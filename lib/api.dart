// To parse this JSON data, do
//
//     final aeroporto = aeroportoFromJson(jsonString);

import 'dart:convert';

List<Aeroporto> aeroportoFromJson(String str) =>
    List<Aeroporto>.from(json.decode(str).map((x) => Aeroporto.fromJson(x)));

String aeroportoToJson(List<Aeroporto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aeroporto {
  Aeroporto({
    this.id,
    this.nome,
    this.codigo,
    this.cidade,
    this.estado,
    this.pais,
    this.voo,
  });

  int? id;
  String? nome;
  String? codigo;
  String? cidade;
  String? estado;
  String? pais;
  List<Voo>? voo;

  factory Aeroporto.fromJson(Map<String, dynamic> json) => Aeroporto(
        id: json["id"],
        nome: json["nome"],
        codigo: json["codigo"],
        cidade: json["cidade"],
        estado: json["estado"],
        pais: json["pais"],
        voo: List<Voo>.from(json["voo"].map((x) => Voo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "codigo": codigo,
        "cidade": cidade,
        "estado": estado,
        "pais": pais,
        "voo": List<dynamic>.from(voo!.map((x) => x.toJson())),
      };
}

class Voo {
  Voo({
    this.id,
    this.data,
    this.horario,
    this.numero,
    this.destino,
    this.portaoEmbarque,
    this.companhia,
  });

  int? id;
  String? data;
  String? horario;
  int? numero;
  String? destino;
  String? portaoEmbarque;
  Companhia? companhia;

  factory Voo.fromJson(Map<String, dynamic> json) => Voo(
        id: json["id"],
        data: json["data"],
        horario: json["horario"],
        numero: json["numero"],
        destino: json["destino"],
        portaoEmbarque: json["portaoEmbarque"],
        companhia: Companhia.fromJson(json["Companhia"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "data": data,
        "horario": horario,
        "numero": numero,
        "destino": destino,
        "portaoEmbarque": portaoEmbarque,
        "Companhia": companhia!.toJson(),
      };
}

class Companhia {
  Companhia({
    this.id,
    this.nome,
    this.codigo,
  });

  int? id;
  String? nome;
  int? codigo;

  factory Companhia.fromJson(Map<String, dynamic> json) => Companhia(
        id: json["id"],
        nome: json["nome"],
        codigo: json["codigo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "codigo": codigo,
      };
}

// class Companhia {
//   late int id;
//   late String nome;
//   late int codigo;
//
//   Companhia({required this.id, required this.nome, required this.codigo});
//
//   Companhia.with_JSON(json)
//       : this.id = json['id'],
//         this.nome = json['nome'],
//         this.codigo = json['codigo'];
//
//   Companhia.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nome = json['nome'];
//     codigo = json['codigo'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['nome'] = this.nome;
//     data['codigo'] = this.codigo;
//     return data;
//   }
// }
//
// class Voo {
//   late int id;
//   late String data;
//   late String horario;
//   late int numero;
//   late String destino;
//   late String portaoEmbarque;
//   late Companhia companhia;
//   Voo();
//   Voo.with_parameters(
//       {required this.id,
//       required this.data,
//       required this.horario,
//       required this.numero,
//       required this.destino,
//       required this.portaoEmbarque,
//       required this.companhia});
//
//   Voo.with_JSON(json)
//       : this.id = json['id'],
//         this.data = json['data'],
//         this.horario = json['horario'],
//         this.numero = json['numero'],
//         this.destino = json['destino'],
//         this.portaoEmbarque = json['portaoEmbarque'],
//         this.companhia = Companhia.with_JSON(['companhia']);
//
//   Voo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     data = json['data'];
//     horario = json['horario'];
//     numero = json['numero'];
//     destino = json['destino'];
//     portaoEmbarque = json['portaoEmbarque'];
//     companhia = (json['Companhia'] != null
//         ? new Companhia.fromJson(json['Companhia'])
//         : null)!;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['data'] = this.data;
//     data['horario'] = this.horario;
//     data['numero'] = this.numero;
//     data['destino'] = this.destino;
//     data['portaoEmbarque'] = this.portaoEmbarque;
//     if (this.companhia != null) {
//       data['Companhia'] = this.companhia.toJson();
//     }
//     return data;
//   }
// }
//
// class Aeroporto {
//   late int id;
//   late String nome;
//   late String codigo;
//   late String cidade;
//   late String estado;
//   late String pais;
//   late List<Voo> voo;
//
//   Aeroporto(
//       {required this.id,
//       required this.nome,
//       required this.codigo,
//       required this.cidade,
//       required this.estado,
//       required this.pais,
//       required this.voo});
//
//   Aeroporto.with_JSON(json)
//       : this.id = json['id'],
//         this.nome = json['nome'],
//         this.codigo = json['codigo'],
//         this.cidade = json['cidade'],
//         this.estado = json['estado'],
//         this.pais = json['pais'],
//         // if (json['voo'] != null) {
//         this.voo = <Voo>[];
//   // json['voo'].forEach((obj) {
//   // voo.add(voo.fromJson(obj));
//
//   Aeroporto.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nome = json['nome'];
//     codigo = json['codigo'];
//     cidade = json['cidade'];
//     estado = json['estado'];
//     pais = json['pais'];
//     // Voo.fromJson(json['voo']);
//     // if (json['voo'] != null) {
//     //   this.voo = <Voo>[];
//     //   json['voo'].forEach((obj) {
//     //     voo.add(voo.fromJson(obj));
//     //   }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['nome'] = this.nome;
//     data['codigo'] = this.codigo;
//     data['cidade'] = this.cidade;
//     data['estado'] = this.estado;
//     data['pais'] = this.pais;
//     if (this.voo != null) {
//       data['voo'] = this.voo.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
