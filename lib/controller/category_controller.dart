import 'package:dio/dio.dart';
import 'package:troubleskiller_mall/model/CategoryModel.dart';
import 'package:troubleskiller_mall/service/category_service.dart';

class CategoryController {
  CategoryController();
  final CategoryService _categoryService = CategoryService();

  Future<List<CategoryModel>> getAllCategory() async {
    List<CategoryModel> results = [];
    Response response = await _categoryService.getAllCategory();
    // results = CategoryJSON.fromJson(response).page
    // results = CategoryPage.fromJson(CategoryJSON.fromJson(response).page)
    return results;
  }

  Future<List<CategoryModel>> getLevel1Category() async {
    List<CategoryModel> results = [];
    Response response = await _categoryService.getLevel1Category();

    CategoryData categoryData = CategoryData.fromJson(response.data);
    CategoryJSONModel categoryJSONModel =
        CategoryJSONModel.fromJson(categoryData.data);
    results = categoryJSONModel.result ?? [];
    // results = CategoryJSON.fromJson(response).page
    // results = CategoryPage.fromJson(CategoryJSON.fromJson(response).page)
    return results;
  }
}
