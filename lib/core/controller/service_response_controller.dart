import 'dart:io';
import 'package:dio/dio.dart';
import '../interface/ibase_model.dart';

class ServiceController {
  List<T>? responseController<T extends IBaseModel>(
      Response response, IBaseModel model) {
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) return datas.map<T>((e) => model.fromJson(e)).toList();
    }
    return null;
  }
}
