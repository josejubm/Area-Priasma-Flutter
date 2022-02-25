// ignore_for_file: unnecessary_new

import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<Home> {
  var dolares = 0.0, costo = 0.0, resultado = 0.0;

  final TextEditingController avg1 = TextEditingController(text: "");
  final TextEditingController avg2 = TextEditingController(text: "");

  void doDolaresPesos() {
    setState(() {
      dolares = double.parse(avg1.text);
      costo = double.parse(avg2.text);

      resultado = dolares * costo;
    });
  }

  void doClear() {
    setState(() {
      avg1.text = "";
      avg2.text = "";
      dolares = 0.0;
      resultado = 0.0;
    });
  }

  @override
  Widget build(BuildContext contex) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Convertidor De Dólares a Pesos"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: prefer_const_constructors
            new Text(
                "Ingrese la Cantidad de dólares que desea convertir junto con el valor por unidad",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
            const Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Dólares : "),
              controller: avg1,
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: "Valor o Costo Por Dólar:"),
              controller: avg2,
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),
            const Icon(
              Icons.attach_money_outlined,
              color: Colors.green,
              size: 30.0,
            ),
            new Text("$dolares Dólares Es Igual a $resultado Pesos",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
            const Padding(
              padding: const EdgeInsets.only(top: 50.0),
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
                  child: const Text("Convertir"),
                  color: Colors.green,
                  onPressed: doDolaresPesos,
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
