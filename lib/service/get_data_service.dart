import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_provider/models/user_model.dart';
import 'package:http/http.dart' as http;

class GetDataService {
  Future<List<Api>> getData() async {
    Uri url = Uri.parse("https://picsum.photos/v2/list?page=2&limit=100");
    var res = await http.get(url);
    debugPrint(res.toString());

    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => Api.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato Bor ${res.statusCode}");
    }
  }
}
