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

  bool isChecked = false;
  bool isChecked2 = false;

  var resultHolder = 'Mostrar Area Lateral?';

  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = "Área Lateral = $areaLateral cm²";
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Mostrar Area Lateral?';
      });
    }
  }

  var resultHolder2 = 'Mostrar Area Base?    ';

  void toggleCheckbox2(bool value2) {
    if (isChecked2 == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked2 = true;
        resultHolder2 = "Área Base = $areaBase cm²   ";
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked2 = false;
        resultHolder2 = "Mostrar Area Base?   ";
      });
    }
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
    'images/prisma.jpg',
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

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    toggleCheckbox(value!);
                  },
                  activeColor: Colors.pink,
                  checkColor: Colors.white,
                  tristate: false,
                ),
              ),
              Text('$resultHolder',
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isChecked2,
                  onChanged: (value2) {
                    toggleCheckbox2(value2!);
                  },
                  activeColor: Colors.pink,
                  checkColor: Colors.white,
                  tristate: false,
                ),
              ),
              Text('$resultHolder2',
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey))
            ]),
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
