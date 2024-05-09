import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
              child: const Text('upload image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickedImage != null ? () {} : null,
              child: const Text('decode image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "download file decode",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
