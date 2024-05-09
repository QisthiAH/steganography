import 'dart:io';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        title: const Text('Encode',
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
            // img
            const SizedBox(
                height: 30,
                width: 330,
                child: Text(
                  "Please upload the cover image here",
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
                SizedBox(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(
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
                ),
              ],
            ),
            const SizedBox(height: 35),

            // pdf
            const SizedBox(
                height: 30,
                width: 330,
                child: Text(
                  "Please upload the PDF file here",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromARGB(255, 125, 124, 124)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pickedPdf == null
                    ? Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'No PDF files uploaded',
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
                SizedBox(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: pickedImage != null
                        ? () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf'],
                            );
                            if (result != null) {
                              pickedPdf = File(result.files.single.path!);
                              setState(() {});
                            }
                          }
                        : null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.grey[300]!),
                      )),
                    ),
                    child: const Text('Upload PDF'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: pickedPdf != null ? () {} : null,
              child: const Text(
                "Download Encode File",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
