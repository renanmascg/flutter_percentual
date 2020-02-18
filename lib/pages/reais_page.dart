import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_perfil_investidor/perfil_controller.dart';

class ReaisPage extends StatefulWidget {
  @override
  _ReaisPageState createState() => _ReaisPageState();
}

class _ReaisPageState extends State<ReaisPage> {
  ProfileCalculator calculator;
  String profile;
  bool isLoading = false;

  int reaisFundoRendaFixa = 0;
  int reaisAtivoRendaFixa = 0;
  int reaisFundoMultimercado = 0;
  int reaisFundoImobiliario = 0;
  int reaisAcoes = 0;
  int reaisPrevidPrivada = 0;

  double _convertoToPercentual(int value) {
    final total = reaisFundoRendaFixa +
        reaisAtivoRendaFixa +
        reaisFundoMultimercado +
        reaisFundoImobiliario +
        reaisAcoes +
        reaisPrevidPrivada;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          TextField(
            onChanged: (str) {
              reaisFundoRendaFixa = int.parse(str);
              print(reaisFundoRendaFixa);
            },
            decoration: InputDecoration(
              prefix: Text(
                'R\$  ',
                style: TextStyle(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelText: 'Fundos de Renda Fixa',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (str) {
              reaisAtivoRendaFixa = int.parse(str);
              print(reaisAtivoRendaFixa);
            },
            decoration: InputDecoration(
              prefix: Text(
                'R\$  ',
                style: TextStyle(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelText: 'Ativos de Renda Fixa',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (str) {
              reaisFundoMultimercado = int.parse(str);
              print(reaisFundoMultimercado);
            },
            decoration: InputDecoration(
              prefix: Text(
                'R\$  ',
                style: TextStyle(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelText: 'Fundos Multimercado',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (str) {
              reaisFundoImobiliario = int.parse(str);
              print(reaisFundoImobiliario);
            },
            decoration: InputDecoration(
              prefix: Text(
                'R\$  ',
                style: TextStyle(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelText: 'Fundos Imobiliario',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (str) {
              reaisAcoes = int.parse(str);
              print(reaisAcoes);
            },
            decoration: InputDecoration(
              prefix: Text(
                'R\$  ',
                style: TextStyle(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelText: 'Ações',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (str) {
              reaisPrevidPrivada = int.parse(str);
              print(reaisPrevidPrivada);
            },
            decoration: InputDecoration(
              prefix: Text(
                'R\$  ',
                style: TextStyle(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelText: 'Previdencia Privada',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                isLoading = true;
              });

              final total = reaisFundoRendaFixa +
                reaisAtivoRendaFixa +
                reaisFundoMultimercado +
                reaisFundoImobiliario +
                reaisAcoes +
                reaisPrevidPrivada;


              calculator = ProfileCalculator(
                percAcoes: (reaisAcoes / total).toDouble(),
                percAtivoRendaFixa: reaisAtivoRendaFixa / total,
                percFundoImobiliario: reaisFundoImobiliario / total,
                percFundoMultimercado: reaisFundoMultimercado / total,
                percFundoRendaFixa: reaisFundoRendaFixa / total,
                percPrevidPrivada: reaisPrevidPrivada / total,
              );

              Timer(Duration(seconds: 2), () {
                setState(() {
                  isLoading = false;
                  profile = calculator.generatePerfil();
                });
              });
            },
            child: Text(
              'Calcular',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue[700],
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : profile == null
                  ? Container(
                      height: 100,
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          profile,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
        ],
      ),
    );
  }
}
