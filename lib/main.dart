import 'dart:js';

import 'package:api_aero_future/routes.dart';
import 'package:api_aero_future/voo_page.dart';
import 'package:flutter/material.dart';

import 'detalhes_voo_page.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    initialRoute: '/',
    routes: {
      Rotas.HOME_PAGE: (context) => HomePage(),
      // Rotas.VOOS_PAGE: (context) => VoosPage(),
      Rotas.DETALHES_VOO_PAGE: (context) => DetalhesVooPage(),
    },
  ));
}
