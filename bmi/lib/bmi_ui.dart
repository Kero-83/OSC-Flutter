import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _height = 150;
  int _weight = 75;
  int _age = 20;
  bool _isFemale = false;
  bool _isMale = false;

  void _incrementw() {
    setState(() {
      _weight++;
    });
  }

  void _decrementw() {
    setState(() {
      if (_weight != 1) {
        _weight--;
      }
    });
  }

  void _incrementa() {
    setState(() {
      _age++;
    });
  }

  void _decrementa() {
    setState(() {
      if (_age != 1) {
        _age--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 24, 122),
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Female
            Positioned(
                top: 25,
                right: 15,
                child: GestureDetector(
                  // style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(200, 200)), backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 13, 13, 73))),
                  onTap: () {
                    setState(() {
                      _isFemale = true;
                      _isMale = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _isFemale
                          ? const Color.fromARGB(255, 78, 24, 122)
                          : const Color.fromARGB(212, 4, 109, 237),
                      borderRadius: BorderRadiusDirectional.circular(25),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Venus_symbol.svg/1200px-Venus_symbol.svg.png'), // replace with your image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 190,
                    height: 190,
                  ),
                )),
            // Male
            Positioned(
                top: 25,
                left: 15,
                child: GestureDetector(
                  // style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(200, 200)), backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 13, 13, 73))),
                  onTap: () {
                    setState(() {
                      _isFemale = false;
                      _isMale = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _isMale
                          ? const Color.fromARGB(255, 78, 24, 122)
                          : const Color.fromARGB(212, 4, 109, 237),
                      borderRadius: BorderRadiusDirectional.circular(25),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Mars_symbol.svg/800px-Mars_symbol.svg.png'), // replace with your image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 190,
                    height: 190,
                  ),
                )),
            // Height Slider
            Positioned(
              left: 15,
              right: 15,
              top: 280,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(212, 4, 109, 237),
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                width: 370,
                height: 200,
                // ignore: prefer_const_constructors
                child: Center(
                  child: Column(children: [
                    const Text(
                      'Height',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(_height.toString(),
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      const Text('cm', style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                    Slider(
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.toInt().round();
                        });
                      },
                      value: _height.toDouble(),
                    )
                  ]),
                ),
              ),
            ),
            // Age Counter
            Positioned(
              bottom: 100,
              right: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(212, 4, 109, 237),
                  borderRadius: BorderRadiusDirectional.circular(30),
                ),
                width: 190,
                height: 190,
                child: Column(
                  children: [
                    const SizedBox(width: 20, height: 20,),
                    const Text(
                      'Age',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _age.toString(),
                      style:
                          const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _decrementa,
                          icon: const Icon(Icons.remove_circle),
                        ),
                        IconButton(
                          onPressed: _incrementa,
                          icon: const Icon(Icons.add_circle),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Weight Counter
            Positioned(
              bottom: 100,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(212, 4, 109, 237),
                    borderRadius: BorderRadiusDirectional.circular(30)),
                width: 190,
                height: 190,
                child: Center(
                    child: Column(
                  children: [
                    const SizedBox(width: 20, height: 20,),
                    const Text(
                      'Weight',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(_weight.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35)),
                      const Text('kg', style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _decrementw,
                          icon: const Icon(Icons.remove_circle),
                        ),
                        IconButton(
                          onPressed: _incrementw,
                          icon: const Icon(Icons.add_circle),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 78, 24, 122),
                  ),
                  width: 80,
                  height: 80,
                  child: const Center(
                      child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      color: Colors.white,
                      //  fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 3,
                  ))),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 13, 13, 73),
    );
  }
}
