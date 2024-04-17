import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/constants/Api/Api.dart';
import '../../models/All_datas_model/All_datas.dart';

Future<List<Hits>> fetchAllDatas(String searchQuery) async {
  final Uri url = Uri.parse(
      '${Api.BaseUrl}/?key=${Api.ApiKey}&q=$searchQuery&image_type=photo');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final List<dynamic> dataList = responseData['hits'];
    return dataList.map((json) => Hits.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
