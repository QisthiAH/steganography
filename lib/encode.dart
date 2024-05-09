import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Encode extends StatefulWidget {
  const Encode({super.key});

  @override
  State<Encode> createState() => _EncodeState();
}

class _EncodeState extends State<Encode> {
  XFile? pickedImage;
  File? pickedPdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Encode',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 44, 43, 43),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pickedImage == null
                ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'no image',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network('${pickedImage?.path}'),
                  ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: const Text('pick image from gallery'),
            ),
            const SizedBox(height: 20),
            pickedPdf == null
                ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'no pdf file',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 100,
                    width: 500,
                    child: Center(
                      child: Text(
                        pickedPdf!.path,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if (result != null) {
                  pickedPdf = File(result.files.single.path!);
                  setState(() {});
                }
              },
              child: const Text('pick pdf file'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "download file encode",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
