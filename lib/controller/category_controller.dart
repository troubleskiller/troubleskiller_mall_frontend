import 'package:dio/dio.dart';
import 'package:troubleskiller_mall/model/CategoryModel.dart';
import 'package:troubleskiller_mall/service/category_service.dart';

class CategoryController {
  CategoryController();
  final CategoryService _categoryService = CategoryService();

  Future<List<CategoryModel>> getCategory() async {
    List<CategoryModel> results = [];
    Response response = await _categoryService.getCategory();
    // results = CategoryJSON.fromJson(response).page
    // results = CategoryPage.fromJson(CategoryJSON.fromJson(response).page)

    CategoryJSON categoryJSON = CategoryJSON.fromJson(response.data);
    print(categoryJSON.toString());
    print('--------------------------------');
    CategoryPage categoryPage = CategoryPage.fromJson(categoryJSON.page);
    print(categoryPage.toString());
    print('++++++++++++++++++++++++++++++++');
    CategoryJSONModel categoryJSONModel =
        CategoryJSONModel.fromJson(categoryPage.list);
    print(categoryJSONModel.toString());
    results = categoryJSONModel.result ?? [];

    return results;
  }
}
