class Lista {
  int id;
  String name;
  bool estatus;

  Lista({this.id, this.name, this.estatus});

  factory Lista.fromJson(Map<String, dynamic> json) =>
      Lista(id: json['id'], name: json['name'], estatus: json['estatus']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'estatus': estatus};
}
