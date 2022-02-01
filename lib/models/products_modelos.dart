import 'dart:convert';

class ProductModel{
  String cBarraGuia;
  List<String>? entrega;
  List<String>? motivo;
  String descargo;
  String picture;
  int? id;

  ProductModel({
    required this.cBarraGuia,
    this.entrega,
    this.motivo,
    required this.descargo,
    required this.picture,
    this.id
  });

  factory ProductModel.fromJson(String str) => ProductModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        cBarraGuia: json["cBarraGuia"],
        entrega: json["entrega"],
        motivo: json["motivo"],
        descargo: json["descargo"],
        picture: json["picture"] == null ? null : json["picture"]
    );

    Map<String, dynamic> toMap() => {
        "cBarraGuia": cBarraGuia,
        "entrega": entrega,
        "motivo": motivo,
        "descargo": descargo,
        "picture": picture == null ? null : picture
    };

    //SE HACE UNA COPIA DE LOS PRODUCTOS
    ProductModel copyProduct() => ProductModel(
      cBarraGuia: this.cBarraGuia,
      descargo: this.descargo, 
      picture: this.picture,
      id: this.id
    );



}