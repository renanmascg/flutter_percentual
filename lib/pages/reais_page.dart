import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_perfil_investidor/perfil_controller.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ReaisPage extends StatefulWidget {
  @override
  _ReaisPageState createState() => _ReaisPageState();
}

class _ReaisPageState extends State<ReaisPage> {
  ProfileCalculator calculator;
  String profile;
  bool isLoading = false;
  FocusNode _focusNode = FocusNode();

  final TextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: 'R\$ ##################',
    filter: {"#": RegExp(r'[0-9]')},
  );

  int reaisFundoRendaFixa = 0;
  int reaisAtivoRendaFixa = 0;
  int reaisFundoMultimercado = 0;
  int reaisFundoImobiliario = 0;
  int reaisAcoes = 0;
  int reaisPrevidPrivada = 0;

  List<FocusNode> focuses = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: focuses.map((focus) {
        return KeyboardAction(
            focusNode: focus,
            onTapAction: () {
              _focusNode.unfocus();
            },
            displayArrows: true);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: KeyboardActions(
        config: _buildConfig(context),
        child: ListView(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: focuses[0],
              onChanged: (str) {
                reaisFundoRendaFixa = int.parse(str);
                print(reaisFundoRendaFixa);
              },
              inputFormatters: [maskFormatter],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fundos de Renda Fixa',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: focuses[1],
              onChanged: (str) {
                reaisAtivoRendaFixa = int.parse(str);
                print(reaisAtivoRendaFixa);
              },
              inputFormatters: [maskFormatter],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ativos de Renda Fixa',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: focuses[2],
              inputFormatters: [maskFormatter],
              onChanged: (str) {
                reaisFundoMultimercado = int.parse(str);
                print(reaisFundoMultimercado);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fundos Multimercado',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: focuses[3],
              inputFormatters: [maskFormatter],
              onChanged: (str) {
                reaisFundoImobiliario = int.parse(str);
                print(reaisFundoImobiliario);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fundos Imobiliario',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: focuses[4],
              inputFormatters: [maskFormatter],
              onChanged: (str) {
                reaisAcoes = int.parse(str);
                print(reaisAcoes);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ações',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: focuses[5],
              inputFormatters: [maskFormatter],
              onChanged: (str) {
                reaisPrevidPrivada = int.parse(str);
                print(reaisPrevidPrivada);
              },
              decoration: InputDecoration(
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
      ),
    );
  }
}
