import 'package:flutter/material.dart';

class MetodologiaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
          child: ListView(
        children: [
          Text('PERFIL CONSERVADOR', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
          Text('Para XPI (2014), a carteira de um investidor conservador deve ser composta de: 30% em fundos de renda fixa, 45% em ativos de renda fixa, 10% em fundos multimercado, 10% em fundos de ações e 5% em previdência privada.'),
          SizedBox(height: 15.0,),
          Text('PERFIL MODERADO', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
          Text('Já a XPI (2014) sugere uma composição de carteira seguida por 10% em fundos de renda fixa, 30% em ativos de renda fixa, 15% em fundos multimercado, B 10% em fundos imobiliários, 30% em ações e 5% em previdência privada.'),
          SizedBox(height: 15.0,),
          Text('PERFIL ARROJADO', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
          Text('Para XPI, a carteira pode ser composta em 10% em fundos de renda fixa, 20% em ativos de renda fixa, 10% em fundos multimercado, 15% em fundos  imobiliários, 40% em ações e BM&F, 5% em previdência privada.'),
          SizedBox(height: 15.0,),
          Text('PERFIL AGRESSIVO', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
          Text('Para XPI (2014), o perfil agressivo tem total conhecimento do mercado de capitais e busca retornos expressivos a qualquer risco. A composição de carteira sugerida é 10% em ativos de renda fixa, 15% em fundos imobiliários, 10% em fundos multimercado, 60% em ações e BM&F e 5% em previdência privada.'),
          SizedBox(height: 15.0,)

        ],
      ),
    );
  }
}