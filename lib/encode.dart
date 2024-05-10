import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:stegano_app/process/process_encode.dart';
// import 'package:stegano_app/process/process_encode.dart';
// import 'package:steganograph/steganograph.dart';

// import 'process/process_encode.dart';

class Encode extends StatefulWidget {
  const Encode({super.key});

  @override
  State<Encode> createState() => _EncodeState();
}

class _EncodeState extends State<Encode> {
  File? pickedImage;
  File? pickedPdf;
  // File? result;

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
                    height: 50,
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
                    height: 400,
                    width: 300,
                    child: Image.file(File(pickedImage!.path), ),
                  ),
            const SizedBox(height: 10),



            // tombol upload gambar
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? picked = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpeg', 'png'],
                );
                if (picked != null) {
                  setState(() {});
                  pickedImage = File(picked.files.single.path!);
                }
              },
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 10),


            pickedPdf == null
                ? Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'no pdf file',
                        style: TextStyle(
                          fontSize: 15 ),
                      ),
                    ),
                  )


                // nama pdf
                : SizedBox(
                    height: 100,
                    width: 500,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 30,
                          left: 30
                        ),
                        child: Text(
                          pickedPdf!.path.split('/').last,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 10),


            // tombol upload pdf
            ElevatedButton(
              onPressed: pickedImage != null
                  ? () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      if (result != null) {
                        setState(() {});
                        pickedPdf = File(result.files.single.path!);
                      }
                    }
                  : null,
              child: const Text('Upload PDF'),
            ),
            const SizedBox(height: 10),


            // tombol unduh hasil encode
            ElevatedButton(
              onPressed: pickedPdf != null ? () {
                encode(pickedPdf!.path, pickedImage!.path);
              } : null,
              child: const Text(
                "Encode and Download",
              ),
            ),
          ],
        ),
      ),
    );
  }
}





