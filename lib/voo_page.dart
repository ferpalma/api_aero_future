import 'package:flutter/material.dart';

import 'api.dart';
import 'detalhes_voo_page.dart';

class VoosPage extends StatefulWidget {
  late List<Voo> voos;
  VoosPage({required this.voos});

  @override
  _VoosPageState createState() => _VoosPageState();
}

class _VoosPageState extends State<VoosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Vôos'),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: Container(
            child: ListView.builder(
          // shrinkWrap: true,
          itemCount: widget.voos.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(widget.voos[index].numero.toString()),
                subtitle: Text('Destino: ' +
                    widget.voos[index].destino.toString() +
                    ' / ' +
                    'Data: ' +
                    widget.voos[index].data.toString() +
                    ' / ' +
                    'Horário: ' +
                    widget.voos[index].horario.toString()),
                onTap: () {
                  print('Voos $index selecionada');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalhesVooPage(
                              numero: widget.voos[index].numero,
                              voo: widget.voos[index])));
                });
          },
        )));
  }
}
