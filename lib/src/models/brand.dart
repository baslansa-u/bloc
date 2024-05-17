import 'dart:convert';
import 'package:flutter101/src/services/data_service.dart';

class Brand {
  final String name;
  final String logo;

  Brand({required this.name, required this.logo});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'],
      logo: json['logo'],
    );
  }
}

Future<List<Brand>> getBrands() async {
  String responseBody = await brandServices.fetchBrands();
  List<dynamic> parsedJson = json.decode(responseBody);

  return parsedJson.map((json) => Brand.fromJson(json)).toList();
}
