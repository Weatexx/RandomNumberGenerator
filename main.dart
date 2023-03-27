import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(Uygulama());

class Uygulama extends StatefulWidget {
  @override
  _UygulamaDurumu createState() => _UygulamaDurumu();
}

class _UygulamaDurumu extends State<Uygulama> {
  List<int> sayilar = [];

  @override
  void initState() {
    super.initState();
    rastgeleSayilarOlustur(); // Rastgele sayı olustur
  }

  void rastgeleSayilarOlustur() {
    Random rastgele = Random();
    for (int i = 0; i < 10; i++) {
      sayilar.add(rastgele.nextInt(100)); // 0-100 arası sayıları olustur
    }
  }

  void sayiSil(int index) {
    setState(() {
      sayilar.removeAt(index); // Seçilen sayıyı sil
    });
  }

  void sayilariYenile() {
    setState(() {
      sayilar.clear(); // tüm sayıları sil
      rastgeleSayilarOlustur(); // yeni sayıları olustur
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold 
      (
        backgroundColor: Color.fromARGB(146, 43, 41, 41), 
        appBar: AppBar(
          title: Text("18648"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 105, 13, 13), 
          leading: Text(
            "Koray", // Sol tarafta gösterilecek metin belirlenir
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: sayilar.isEmpty
              ? ElevatedButton(
  onPressed: sayilariYenile,
  style: ElevatedButton.styleFrom(
    primary: Color.fromARGB(255, 105, 13, 13),
  ),
  child: Text("Yenile"),
)
              : Container(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      sayilar.length,
                      (index) => GestureDetector(
                        onTap: () => sayiSil(index),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(90, 43, 41, 41),
                          ),
                          child: Center(
                            child: Text(
                              sayilar[index].toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 105, 13, 13),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
