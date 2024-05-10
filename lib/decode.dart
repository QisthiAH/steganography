import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stegano_app/process/process_decode.dart';

class Decode extends StatefulWidget {
  const Decode({super.key});

  @override
  State<Decode> createState() => _DecodeState();
}

class _DecodeState extends State<Decode> {
  XFile? pickedImage;
  File? pickedPdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Decode',
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
                    height: 400,
                    width: 300,
                    child: Image.file(File(pickedImage!.path)),
                  ),
            const SizedBox(height: 10),



            // Tombol upload image
            ElevatedButton(
              onPressed: () async {
                pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 20),

            // Tombol decode 
            ElevatedButton(
              onPressed: pickedImage != null ? () {
                decode(pickedImage!.path);
              } : null,
              child: const Text('Decode and Download'),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
