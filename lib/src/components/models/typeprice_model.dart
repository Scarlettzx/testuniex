import 'dart:convert';

List<TypePriceModel> typePriceModelFromJson(String str) =>
    List<TypePriceModel>.from(
        json.decode(str).map((x) => TypePriceModel.fromJson(x)));

String typePriceModelToJson(List<TypePriceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypePriceModel {
  String? type;

  TypePriceModel({
    this.type,
  });

  factory TypePriceModel.fromJson(Map<String, dynamic> json) => TypePriceModel(
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
      };
}

List<TypePriceModel> loadTypePriceData(String jsonString) {
  return typePriceModelFromJson(jsonString);
}
