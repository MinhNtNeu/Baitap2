class CategoryModel {
  List<Content>? content;
  Pageable? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  bool? first;
  Sort? sort;
  int? numberOfElements;
  int? size;
  int? number;
  bool? empty;

  CategoryModel(
      {this.content,
        this.pageable,
        this.totalPages,
        this.totalElements,
        this.last,
        this.first,
        this.sort,
        this.numberOfElements,
        this.size,
        this.number,
        this.empty});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    first = json['first'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    size = json['size'];
    number = json['number'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['totalPages'] = this.totalPages;
    data['totalElements'] = this.totalElements;
    data['last'] = this.last;
    data['first'] = this.first;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['numberOfElements'] = this.numberOfElements;
    data['size'] = this.size;
    data['number'] = this.number;
    data['empty'] = this.empty;
    return data;
  }
}

class Content {
  int? categoryId;
  int? categoryParentId;
  String? categoryParentName;
  String? categoryParentImage;
  String? categoryParentBackgroundColor;
  List<String>? categoryParentSlideImages;
  String? categoryName;
  String? categoryImage;
  List<Null>? categorySlideImages;
  List<CategoryChilds>? categoryChilds;

  Content(
      {this.categoryId,
        this.categoryParentId,
        this.categoryParentName,
        this.categoryParentImage,
        this.categoryParentBackgroundColor,
        this.categoryParentSlideImages,
        this.categoryName,
        this.categoryImage,
        this.categorySlideImages,
        this.categoryChilds});

  Content.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryParentId = json['categoryParentId'];
    categoryParentName = json['categoryParentName'];
    categoryParentImage = json['categoryParentImage'];
    categoryParentBackgroundColor = json['categoryParentBackgroundColor'];
    categoryParentSlideImages =
        json['categoryParentSlideImages'].cast<String>();
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];

    if (json['categoryChilds'] != null) {
      categoryChilds = <CategoryChilds>[];
      json['categoryChilds'].forEach((v) {
        categoryChilds!.add(new CategoryChilds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryParentId'] = this.categoryParentId;
    data['categoryParentName'] = this.categoryParentName;
    data['categoryParentImage'] = this.categoryParentImage;
    data['categoryParentBackgroundColor'] = this.categoryParentBackgroundColor;
    data['categoryParentSlideImages'] = this.categoryParentSlideImages;
    data['categoryName'] = this.categoryName;
    data['categoryImage'] = this.categoryImage;

    if (this.categoryChilds != null) {
      data['categoryChilds'] =
          this.categoryChilds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryChilds {
  int? categoryId;
  int? categoryParentId;
  String? categoryParentName;
  String? categoryParentImage;
  List<Null>? categoryParentSlideImages;
  String? categoryName;
  String? categoryImage;
  List<Null>? categorySlideImages;

  CategoryChilds(
      {this.categoryId,
        this.categoryParentId,
        this.categoryParentName,
        this.categoryParentImage,
        this.categoryParentSlideImages,
        this.categoryName,
        this.categoryImage,
        this.categorySlideImages});

  CategoryChilds.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryParentId = json['categoryParentId'];
    categoryParentName = json['categoryParentName'];
    categoryParentImage = json['categoryParentImage'];

    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryParentId'] = this.categoryParentId;
    data['categoryParentName'] = this.categoryParentName;
    data['categoryParentImage'] = this.categoryParentImage;

    return data;
  }
}

class Pageable {
  Sort? sort;
  int? pageNumber;
  int? pageSize;
  int? offset;
  bool? unpaged;
  bool? paged;

  Pageable(
      {this.sort,
        this.pageNumber,
        this.pageSize,
        this.offset,
        this.unpaged,
        this.paged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    offset = json['offset'];
    unpaged = json['unpaged'];
    paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['offset'] = this.offset;
    data['unpaged'] = this.unpaged;
    data['paged'] = this.paged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? unsorted;
  bool? empty;

  Sort({this.sorted, this.unsorted, this.empty});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    unsorted = json['unsorted'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    data['empty'] = this.empty;
    return data;
  }
}
