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
        title: const Text('Decode',
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 18, 24, 110),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const SizedBox(
                height: 30,
                width: 330,
                child: Text(
                  "Please upload the image here",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromARGB(255, 125, 124, 124)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pickedImage == null
                    ? Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'No images uploaded',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network('${pickedImage?.path}'),
                      ),
                ElevatedButton(
                  onPressed: () async {
                    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.grey[300]!),
                    )),
                  ),
                  child: const Text('Upload Image'),
                ),
              ],
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: pickedImage != null ? () {} : null,
              // style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
              child: const Text('Decode Image'),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("See the results click here"),
                TextButton(
                    onPressed: () {},
                    child: const SizedBox(
                      width: 130,
                      child: Text("decode file",
                          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
                    ))
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            //       foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            //   child: const Text(
            //     "download file decode",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
