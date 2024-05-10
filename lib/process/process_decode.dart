import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:steganograph/steganograph.dart';

void decode(String fileImage) async {
  // proses decode
  final embeddedFile = await Steganograph.decodeFile(
  image: File(fileImage),
  );

  // Dapatkan path dari direktori yang dipilih oleh pengguna
  String? result = await FilePicker.platform.getDirectoryPath();
  if (result != null) {
    // Jika pengguna memilih folder, simpan gambar yang telah diencode di folder tersebut
    String outputPath = '$result/decoded.pdf';
    await embeddedFile!.copy(outputPath);
  } 
}