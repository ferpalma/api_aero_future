import 'dart:convert';

import 'package:api_aero_future/api.dart';
import 'package:api_aero_future/voo_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Aeroporto> listaAeroporto = [];

  Future<List<Aeroporto>> buscaAllDados() async {
    var response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/ferpalma/fakeapi-testes/aerorporto'));
    List<dynamic> lista = json.decode(response.body);
    listaAeroporto = lista.map((model) => Aeroporto.fromJson(model)).toList();
    print(listaAeroporto);
    return listaAeroporto;
  }

  @override
  Widget build(BuildContext context) {
    List<Voo> list = [];
    // buscaDados();
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Aeroportos Brasileiro')),
      body: Container(
        child: FutureBuilder<List<Aeroporto>>(
            future: buscaAllDados(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loadding...'),
                  ),
                );
              } else
                return ListView.builder(
                    // shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].nome.toString()),
                        subtitle: Text(snapshot.data![index].cidade.toString() +
                            '/' +
                            snapshot.data![index].estado.toString() +
                            '-' +
                            snapshot.data![index].pais.toString()),
                        onTap: () {
                          print('Aeroporto $index selecionada');
                          //dar pushNemed para próxima tela
                          list = snapshot.data![index].voo!.toList();
                          print(list.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VoosPage(
                                        voos: list,
                                      )));
                        },
                      );
                    });
            }),
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   var aeroportos = <Aeroporto>[];
//
//   Future<List<Aeroporto>?> buscaDados() async {
//     http.Response response = await http.get(Uri.parse(
//         'https://my-json-server.typicode.com/ferpalma/fakeapi-testes/aerorporto'));
//     setState(() {
//       if (response.statusCode == 200) {
//         var dadosJson = json.decode(response.body);
//         aeroportos = dadosJson.map((model) => Aeroporto.fromJson(model));
//         //return aeroportos;
//       } else {
//         print('Lista bão encontrada');
//       }
//     });
//   }
//
//   _HomePageState() {
//     buscaDados();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de aeroportos'),
//       ),
//       body: listaAeroportos(),
//     );
//   }
//
//   listaAeroportos() {
//     return ListView.builder(
//         itemCount: aeroportos.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//               aeroportos[index].nome,
//               style: TextStyle(fontSize: 20),
//             ),
//             subtitle: Text(aeroportos[index].cidade +
//                 '-' +
//                 aeroportos[index].estado +
//                 '-' +
//                 aeroportos[index].pais),
//           );
//         });
//   }
// }

// aeroporto = dadosJson
//     .map(
//       (dynamic item) => Aeroporto.fromJson(item),
//     )
//     .toList();
