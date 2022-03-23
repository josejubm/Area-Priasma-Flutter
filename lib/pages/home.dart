// ignore_for_file: unnecessary_new

import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<Home> {
  var areaTotal = 0.0,
      volumen = 0.0,
      areaLateral = 0.0,
      areaBase = 0.0,
      lados = 0.0,
      valorLado = 0.0,
      perimetro = 0.0,
      apotema = 0.0,
      altura = 0.0;

  final TextEditingController avg1 = TextEditingController(text: "");
  final TextEditingController avg2 = TextEditingController(text: "");
  final TextEditingController avg3 = TextEditingController(text: "");
  final TextEditingController avg4 = TextEditingController(text: "");

  //OPERACIONES.
  void doCalcular() {
    setState(() {
      lados = double.parse(avg1.text);
      valorLado = double.parse(avg2.text);
      apotema = double.parse(avg3.text);
      altura = double.parse(avg4.text);

      perimetro = valorLado * lados;
      areaBase = perimetro * apotema / 2;
      areaLateral = perimetro * altura;
      areaTotal = areaLateral + 2 * areaBase;
      volumen = areaBase * altura;
    });
  }

//LIMPIAR CAMPOS.
  void doClear() {
    setState(() {
      avg1.text = "";
      avg2.text = "";
      avg3.text = "";
      avg4.text = "";
      areaTotal = 0.0;
      volumen = 0.0;
      areaLateral = 0.0;
      areaBase = 0.0;
    });
  }

  final mainImage = Image.asset(
    'images/mate.jpg',
    //width: 400,
    //height: 300,
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext contex) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Calcular Áreas y Volumen de un Prisma "),
      ),
      body: new Container(
        padding: const EdgeInsets.all(50.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: prefer_const_constructors
            mainImage,
            const Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Numero de lados"),
              controller: avg1,
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Valor de Lado "),
              controller: avg2,
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Apotema "),
              controller: avg3,
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Altura "),
              controller: avg4,
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),

            new Text("Volumen = $volumen cm³",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
            new Text("Área Total = $areaTotal cm²",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
            new Text("Área Lateral = $areaLateral cm²",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
            new Text("Área Base = $areaBase cm²",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
            const Padding(
              padding: const EdgeInsets.only(top: 30.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Icon(
                  Icons.check_rounded,
                  color: Colors.green,
                  size: 30.0,
                ),
                new MaterialButton(
                  child: const Text("Calcular"),
                  color: Colors.green,
                  onPressed: doCalcular,
                ),
                const Icon(
                  Icons.close_outlined,
                  color: Colors.red,
                  size: 30.0,
                ),
                new MaterialButton(
                  child: const Text("Limpiar"),
                  color: Colors.red,
                  onPressed: doClear,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
