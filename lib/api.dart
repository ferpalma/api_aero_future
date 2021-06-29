import 'dart:convert';

class Companhia {
  late int id;
  late String nome;
  late int codigo;

  Companhia({required this.id, required this.nome, required this.codigo});

  Companhia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    codigo = json['codigo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['codigo'] = this.codigo;
    return data;
  }
}

class Voo {
  late int id;
  late String data;
  late String horario;
  late int numero;
  late String destino;
  late String portaoEmbarque;
  late Companhia companhia;
  Voo();
  Voo.with_parameters(
      {required this.id,
      required this.data,
      required this.horario,
      required this.numero,
      required this.destino,
      required this.portaoEmbarque,
      required this.companhia});

  Voo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    horario = json['horario'];
    numero = json['numero'];
    destino = json['destino'];
    portaoEmbarque = json['portaoEmbarque'];
    companhia = (json['Companhia'] != null
        ? new Companhia.fromJson(json['Companhia'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['horario'] = this.horario;
    data['numero'] = this.numero;
    data['destino'] = this.destino;
    data['portaoEmbarque'] = this.portaoEmbarque;
    if (this.companhia != null) {
      data['Companhia'] = this.companhia.toJson();
    }
    return data;
  }
}

class Aeroporto {
  late int id;
  late String nome;
  late String codigo;
  late String cidade;
  late String estado;
  late String pais;
  late List<Voo> voo;

  Aeroporto.with_JSON(json)
      : this.id = json['id'],
        this.nome = json['nome'],
        this.codigo = json['codigo'],
        this.cidade = json['cidade'],
        this.estado = json['estado'],
        this.pais = json['pais'];

  Aeroporto(
      {required this.id,
      required this.nome,
      required this.codigo,
      required this.cidade,
      required this.estado,
      required this.pais,
      required this.voo});

  Aeroporto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    codigo = json['codigo'];
    cidade = json['cidade'];
    estado = json['estado'];
    pais = json['pais'];
    // if (json['voo'] != null) {
    //   voo = <Voo>[];
    //   json['voo'].forEach((v) {
    //     voo.add(new Voo.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['codigo'] = this.codigo;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['pais'] = this.pais;
    if (this.voo != null) {
      data['voo'] = this.voo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
