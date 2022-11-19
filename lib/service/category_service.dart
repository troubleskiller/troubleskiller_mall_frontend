import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CategoryService {
  Dio dio = Dio();
  CategoryService();
  Future<dynamic> getAllCategory() async {
    dynamic response;
    try {
      response =
          await Dio().get('http://127.0.0.1:10000/product/category/list');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return response;
  }

  Future<dynamic> getLevel1Category() async {
    dynamic response;
    try {
      response =
          await Dio().get('http://127.0.0.1:10000/product/category/list/tree');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return response;
  }
}
