import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SliderExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double sliderAlturaValue = 0.0;
  double sliderPesoValue = 0.0;
  double alturam = 0.0;
  double calculado = 0.0;
  String calculado2 = '0.0';
  String mensaje1 = '';
  String mensaje2 = '';
  String img2 = 'definido.png';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calcular IMC",
          ),
          backgroundColor: Color.fromRGBO(65, 105, 225, 1),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Altura:",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    child: Text(
                      sliderAlturaValue.toStringAsFixed(1),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Text(
                      'cm',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Slider(
                value: sliderAlturaValue,
                min: 0.0,
                max: 190.0,
                //activeColor: Colors.blue,
                //inactiveColor: Colors.grey,
                thumbColor: Colors.blue,
                onChanged: (altura) {
                  sliderAlturaValue = altura;
                  setState(() {});
                },
              ),
              Text(
                "Peso:",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    child: Text(
                      sliderPesoValue.toStringAsFixed(1),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Text(
                      'kg',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Slider(
                value: sliderPesoValue,
                min: 0.0,
                max: 150.0,
                //activeColor: Colors.blue,
                //inactiveColor: Colors.grey,
                thumbColor: Colors.blue,
                onChanged: (peso) {
                  sliderPesoValue = peso;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    double inDouble = 0.0;
                    if (sliderAlturaValue != 0) {
                      alturam = (sliderAlturaValue * 1) / 100;
                      calculado = sliderPesoValue / (alturam * alturam);
                      calculado2 = calculado.toStringAsFixed(1);
                      inDouble = double.parse(calculado2);
                    }

                    if (inDouble < 18.5 && inDouble != 0.0) {
                      mensaje1 = "Delgado";
                      mensaje2 =
                          "Si su IMC es menos de 18.5, se encuentra dentro del rango de peso insuficiente.";
                      img2 = "delgado.png";
                    } else if (inDouble >= 18.5 && inDouble <= 24.9) {
                      mensaje1 = "Normal";
                      mensaje2 =
                          "Si su IMC es entre 18.5 y 24.9, se encuentra dentro del rango de peso normal o saludable.";
                      img2 = "normal.png";
                    } else if (inDouble >= 25.0 && inDouble <= 29.9) {
                      mensaje1 = "Sobrepeso";
                      mensaje2 =
                          "Si su IMC es entre 25.0 y 29.9, se encuentra dentro del rango de sobrepeso.";
                      img2 = "sobrepeso.png";
                    } else if (inDouble > 30.0) {
                      mensaje1 = "Obecidad";
                      mensaje2 =
                          "Si su IMC es 30.0 o superior, se encuentra dentro del rango de obesidad.";
                      img2 = "obeso.png";
                    } else {
                      mensaje1 = "";
                      mensaje2 = "";
                      img2 = "definido.png";
                    }

                    setState(() {});
                  },
                  child: Text('Calcular'),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Text(
                      '$calculado2',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$mensaje1',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(65, 105, 225, 1),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '$mensaje2',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: 250,
                      height: 250,
                      child: Image.asset('assets/images/$img2'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
