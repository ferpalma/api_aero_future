import 'package:flutter/material.dart';

import 'api.dart';
import 'detalhes_voo_page.dart';

class VoosPage extends StatelessWidget {
  //AeroportosMock mock = AeroportosMock();
  late Aeroporto aeroporto;
  VoosPage({required this.aeroporto});
  //late List<Voo?> voos = mock.infra.getVooPorAeroporto(aeroporto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Vôos'),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: aeroporto.voo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(aeroporto.voo[index].numero.toString()),
                        subtitle: Text('Destino: ' +
                            aeroporto.voo[index].destino +
                            ' / ' +
                            'Data: ' +
                            aeroporto.voo[index].data.toString() +
                            ' / ' +
                            'Horário: ' +
                            aeroporto.voo[index].horario.toString()),
                        onTap: () {
                          print('Aeroportos $index selecionada');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetalhesVooPage(
                                      numero: aeroporto.voo[index].numero,
                                      voo: aeroporto.voo[index])));
                        });
                  })
            ],
          ),
        ));
  }
}
