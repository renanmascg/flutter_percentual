import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_perfil_investidor/pages/metodologia_page.dart';
import 'package:flutter_perfil_investidor/pages/percentual_page.dart';
import 'package:flutter_perfil_investidor/pages/reais_page.dart';

import 'perfil_controller.dart';

class PerfilInvestidor extends StatefulWidget {
  @override
  _PerfilInvestidorState createState() => _PerfilInvestidorState();
}

class _PerfilInvestidorState extends State<PerfilInvestidor> with SingleTickerProviderStateMixin{
  TabController controller;

  

  @override
  void initState() {
    super.initState();

    controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descubra seu Perfil'),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(child: Text('Percentual')),
            Tab(child: Text('Reais')),
            Tab(child: Text('Metodologia'))
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          PercentualPage(),
          ReaisPage(),
          MetodologiaPage(),
        ],
      ),
    );
  }
}

