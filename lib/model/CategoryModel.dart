class CategoryJSON {
  CategoryJSON({
    this.code,
    this.page,
  });

  int? code;
  dynamic page;

  CategoryJSON.fromJson(dynamic json) {
    code = json['code'];
    page = json['page'];
  }

  @override
  String toString() {
    return 'CategoryJSON{code: $code, page: $page}';
  }
}

class CategoryPage {
  int? totalCount;
  int? pageSize;
  int? totalPage;
  int? currPage;
  dynamic list;

  CategoryPage(
      this.totalCount, this.pageSize, this.totalPage, this.currPage, this.list);

  CategoryPage.fromJson(dynamic json) {
    currPage = json['currPage'];
    totalPage = json['totalPage'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    list = json['list'];
  }

  @override
  String toString() {
    return 'CategoryPage{pageSize: $pageSize, totalPage: $totalPage, currPage: $currPage,ssss:$list}';
  }
}

class CategoryData {
  CategoryData({this.code, this.data});

  int? code;
  dynamic data;
  CategoryData.fromJson(dynamic json) {
    code = json['code'];
    data = json['data'];
  }
}

class CategoryModel {
  CategoryModel(
      {this.catId,
      this.name,
      this.parentCid,
      this.catLevel,
      this.showStatus,
      this.sort,
      this.icon,
      this.productUnit,
      this.productCount,
      this.children});

  CategoryModel.fromJson(dynamic json) {
    catId = json['catId'];
    name = json['name'];
    parentCid = json['parentCid'];
    catLevel = json['catLevel'];
    showStatus = json['showStatus'];
    sort = json['sort'];
    icon = json['icon'];
    productUnit = json['productUnit'];
    productCount = json['productCount'];
    children = json['children'];
  }

  int? catId;
  String? name;
  int? parentCid;
  int? catLevel;
  int? showStatus;
  int? sort;
  dynamic icon;
  dynamic productUnit;
  int? productCount;

  //树状结构，三级表
  dynamic children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['catId'] = catId;
    map['name'] = name;
    map['parentCid'] = parentCid;
    map['catLevel'] = catLevel;
    map['showStatus'] = showStatus;
    map['sort'] = sort;
    map['icon'] = icon;
    map['productUnit'] = productUnit;
    map['productCount'] = productCount;
    map['children'] = children;
    return map;
  }
}

class CategoryJSONModel {
  CategoryJSONModel({
    this.result,
  });

  List<CategoryModel>? result;

  factory CategoryJSONModel.fromJson(List<dynamic> parsedJson) {
    List<CategoryModel> repos =
        parsedJson.map((i) => CategoryModel.fromJson(i)).toList();

    return CategoryJSONModel(
      result: repos,
    );
  }

  @override
  String toString() {
    return 'CategoryJSONModel{result: $result}';
  }
}
