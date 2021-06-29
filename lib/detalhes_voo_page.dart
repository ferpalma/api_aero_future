import 'package:flutter/material.dart';

import 'api.dart';

class DetalhesVooPage extends StatelessWidget {
  late Voo? voo = Voo();
  late int? numero;
  DetalhesVooPage({this.numero, this.voo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Vôo")),
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "Voo" + ": " + voo!.numero.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Destino" + ": " + voo!.destino.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Data" + ": " + voo!.data.toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Horário" + ": " + voo!.horario.toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Companhia" + ": " + voo!.companhia!.nome.toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
