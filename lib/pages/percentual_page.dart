import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_perfil_investidor/perfil_controller.dart';
import 'package:flutter_perfil_investidor/widgets/percentual_slider.dart';

class PercentualPage extends StatefulWidget {
  @override
  _PercentualPageState createState() => _PercentualPageState();
}

class _PercentualPageState extends State<PercentualPage> {

  ProfileCalculator calculator;
  String profile;
  bool isLoading = false;

  double percFundoRendaFixa = 0.0;
  double percAtivoRendaFixa = 0.0;
  double percFundoMultimercado = 0.0;
  double percFundoImobiliario = 0.0;
  double percAcoes = 0.0;
  double percPrevidPrivada = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PercentualSlider(
              title: 'Fundos de Renda Fixa',
              colour: Colors.green[800],
              percentual: percFundoRendaFixa,
              onChanged: (newValue) {
                setState(() {
                  percFundoRendaFixa = newValue;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            PercentualSlider(
              title: 'Ativo Renda Fixa',
              colour: Colors.lightGreen[600],
              percentual: percAtivoRendaFixa,
              onChanged: (newValue) {
                setState(() {
                  percAtivoRendaFixa = newValue;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            PercentualSlider(
              title: 'Fundo Multimercado',
              colour: Colors.orange[300],
              percentual: percFundoMultimercado,
              onChanged: (newValue) {
                setState(() {
                  percFundoMultimercado = newValue;
                });
              },
            ),
            PercentualSlider(
              title: 'Fundo Imobiliário',
              colour: Colors.orange[800],
              percentual: percFundoImobiliario,
              onChanged: (newValue) {
                setState(() {
                  percFundoImobiliario = newValue;
                });
              },
            ),
            PercentualSlider(
              title: 'Ações',
              colour: Colors.red,
              percentual: percAcoes,
              onChanged: (newValue) {
                setState(() {
                  percAcoes = newValue;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            PercentualSlider(
              title: 'Previdência Privada',
              colour: Colors.black,
              percentual: percPrevidPrivada,
              onChanged: (newValue) {
                setState(() {
                  percPrevidPrivada = newValue;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                calculator = ProfileCalculator(
                  percAcoes: percAcoes,
                  percAtivoRendaFixa: percAtivoRendaFixa,
                  percFundoImobiliario: percFundoImobiliario,
                  percFundoMultimercado: percFundoMultimercado,
                  percFundoRendaFixa: percFundoRendaFixa,
                  percPrevidPrivada: percPrevidPrivada,
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
            Expanded(
              child: Center(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : profile == null
                        ? Container()
                        : Container(
                            child: Text(
                              profile,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
              ),
            )
          ],
        ),
      );
  }
}