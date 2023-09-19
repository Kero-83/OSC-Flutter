import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// ignore: camel_case_types
class ui extends StatelessWidget {
  const ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0xff,0x86,0x13,0xe6),
        title: const Text("Kero App"),
        centerTitle: true,
      ),
      body: Container(
        width: 400,
        height: 200,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(212, 4, 109, 237),
          borderRadius: BorderRadiusDirectional.circular(30)
        ),
      alignment: const Alignment(-1.0, -1.0),
        child: const Text(
        'This is Container',
        textWidthBasis: TextWidthBasis.parent,
        textScaleFactor: 5,
        style: TextStyle(
          color: Color.fromARGB(0xff, 0x50, 0x00, 0xff),
        ),
      ),
      )
      
    );

  }
}