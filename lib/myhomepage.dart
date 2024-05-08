import 'package:flutter/material.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "STEGANOGRAPHY",
          style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 43, 43),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 400,
              child: Center(child: Text("Welcome to NamaApp", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),)),
            ),
            const SizedBox(height: 8),
            const SizedBox(
              width: 300,
              child: Center(child: Text("Let's Choose Your Needs", style: TextStyle(fontStyle: FontStyle.italic),)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text("Encode", style: TextStyle(color: Color.fromARGB(255, 30, 29, 29))),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text("Decode",  style: TextStyle(color: Color.fromARGB(255, 30, 29, 29))),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color.fromARGB(255, 94, 93, 93), // warna latar belakang footer
        child: SizedBox(
          height: 50.0, // tinggi footer
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '© 2024 RiazQi.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
