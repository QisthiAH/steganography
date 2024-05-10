// import 'dart:io';
// import 'dart:typed_data';
// import 'package:image/image.dart' as img;
// import 'package:file_picker/file_picker.dart';
// import 'package:steganograph/steganograph.dart';





// // FUNGSI UNTUK MELAKUKAN ENCODE
// void encode(filePDF, fileImage) async {
//   // Konversi file PDF menjadi byte
//   List<int> bytesPDF = filePDF.readAsBytesSync();
//   // Konversi byte ke bit
//   List<int> bitsPDF = [];
//   for (int byte in bytesPDF) {
//     String byteString = byte.toRadixString(2).padLeft(8, '0');
//     bitsPDF.addAll(byteString.codeUnits);
//   }

//   // Baca file gambar
//   File imageFile = File(fileImage.path);
//   Uint8List bytes = imageFile.readAsBytesSync();
//   img.Image image = img.decodeImage(bytes)!;

//   // Cek apakah file PDF dapat disisipkan dalam gambar
//   int imageSize = image.width * image.height * 3;
//   if (bitsPDF.length > imageSize) {
//     // Jika ukuran PDF terlalu besar, maka tambah piksel gambar dengan melakukan
//     // perbesaran citra menggunakan interpolasi linear
//     // konsekuensinya akan ada perubahan signifikan pada gambar setelah encode
//     double scaleFactor = bitsPDF.length / imageSize;
//     img.Image enlargedImage = img.copyResize(
//       image,
//       width: (image.width * scaleFactor).round(),
//       height: (image.height * scaleFactor).round(),
//       interpolation: img.Interpolation.average,
//     );
//     image = enlargedImage;
//   }

//   // Sisipkan file PDF ke dalam gambar
//   int pdfIndex = 0;
//   for (int y = 0; y < image.height; y++) {
//     for (int x = 0; x < image.width; x++) {
//       int pixel = image.getPixel(x, y);
//       int alpha = img.getAlpha(pixel);
//       int red = img.getRed(pixel);
//       int green = img.getGreen(pixel);
//       int blue = img.getBlue(pixel);

//       // Sisipkan bit file PDF ke dalam bit paling tidak signifikan dari komponen warna merah, hijau, dan biru
//       red = (red & ~1) | (bitsPDF[pdfIndex] & 1);
//       green = (green & ~1) | (bitsPDF[pdfIndex] & 1);
//       blue = (blue & ~1) | (bitsPDF[pdfIndex] & 1);
//       pdfIndex++;
//       // if (pdfIndex < bitsPDF.length) {
//       // red = (red & ~1) | (bitsPDF[pdfIndex] & 1);
//       // pdfIndex++;
//       // }
//       // if (pdfIndex < bitsPDF.length) {
//       //   green = (green & ~1) | (bitsPDF[pdfIndex] & 1);
//       //   pdfIndex++;
//       // }
//       // if (pdfIndex < bitsPDF.length) {
//       //   blue = (blue & ~1) | (bitsPDF[pdfIndex] & 1);
//       //   pdfIndex++;
//       // }

//       // Update nilai piksel dalam gambar
//       image.setPixel(x, y, img.getColor(alpha, red, green, blue));
//     }
//   }

//   // Meminta pengguna untuk memilih folder penyimpanan
//   String? result = await FilePicker.platform.getDirectoryPath();
//   if (result != null) {
//     // Jika pengguna memilih folder, simpan gambar yang telah diencode di folder tersebut
//     String outputPath = '$result/encoded_image.jpg';
//     File(outputPath).writeAsBytesSync(img.encodeJpg(image));
//   }
// }


// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:steganograph/steganograph.dart';

// void encode(String filePDF, String fileImage) async {
//   // Lakukan encoding file gambar ke dalam file PDF
//   File? encodedFile = await Steganograph.encodeFile(
//     image: File(fileImage),
//     fileToEmbed: File(filePDF),
//   );

//   // Dapatkan path dari direktori yang dipilih oleh pengguna
//   String? result = await FilePicker.platform.getDirectoryPath();
//   if (result != null) {
//     // Jika pengguna memilih folder, simpan gambar yang telah diencode di folder tersebut
//     String outputPath = '$result/encoded_image.png';
//     await encodedFile!.copy(outputPath);
//   } 
// }


import 'dart:io';
import 'package:file_picker/file_picker.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:steganograph/steganograph.dart';

void encode(String filePDF, String fileImage) async {
  // Lakukan encoding file gambar ke dalam file PDF
  File? encodedFile = await Steganograph.encodeFile(
    image: File(fileImage),
    fileToEmbed: File(filePDF),
  );

  // Dapatkan path dari direktori yang dipilih oleh pengguna
  String? result = await FilePicker.platform.getDirectoryPath();
  if (result != null) {
    // Jika pengguna memilih folder, simpan gambar yang telah diencode di folder tersebut
    String outputPath = '$result/encoded_image';
    await encodedFile!.copy(outputPath);
  } 

  // Directory? directory = await getExternalStorageDirectory();
  // if (directory != null) {
  //   // Jika direktori eksternal tersedia, simpan gambar yang telah diencode di dalamnya
  //   String outputPath = '${directory.path}/encoded_image.png';
  //   await encodedFile!.copy(outputPath);
  // } else {
  //   // Penanganan kesalahan jika gagal mendapatkan direktori penyimpanan eksternal
  //   print('Error: Failed to get external storage directory.');
  // }


}



