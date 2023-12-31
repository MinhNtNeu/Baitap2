class BestModel {
  List<Information>? information;
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

  BestModel(
      {this.information,
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

  BestModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      information = <Information>[];
      json['content'].forEach((v) {
        information!.add(new Information.fromJson(v));
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
    if (this.information != null) {
      data['content'] = this.information!.map((v) => v.toJson()).toList();
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

class Information {
  int? productId;
  String? productImage;
  int? productRemain;
  int? productRemainVn;
  int? productRemainKr;
  String? madeIn;
  int? buyCount;
  int? likeNumber;
  int? commentCount;
  double? averageStar;
  int? price;
  int? priceVn;
  int? priceKr;
  int? priceSales;
  int? priceSalesVn;
  int? priceSalesKr;
  double? percentKol;
  double? percentKolVn;
  double? percentKolKr;
  String? productName;
  String? productDescription;
  String? extendNote;
  List<String>? productImages;
  bool? isFreeDelivery;
  bool? isFreeDeliveryVn;
  bool? isFreeDeliveryKr;
  bool? isActive;
  int? agentId;
  String? insertDateTime;
  int? brandId;
  int? categoryId;
  Brand? brand;
  Category? category;
  bool? likeStatus;
  String? saveStatus;
  List<Null>? dynamicSizes;
  List<Null>? dynamicColors;

  Information(
      {this.productId,
        this.productImage,
        this.productRemain,
        this.productRemainVn,
        this.productRemainKr,
        this.madeIn,
        this.buyCount,
        this.likeNumber,
        this.commentCount,
        this.averageStar,
        this.price,
        this.priceVn,
        this.priceKr,
        this.priceSales,
        this.priceSalesVn,
        this.priceSalesKr,
        this.percentKol,
        this.percentKolVn,
        this.percentKolKr,
        this.productName,
        this.productDescription,
        this.extendNote,
        this.productImages,
        this.isFreeDelivery,
        this.isFreeDeliveryVn,
        this.isFreeDeliveryKr,
        this.isActive,
        this.agentId,
        this.insertDateTime,
        this.brandId,
        this.categoryId,
        this.brand,
        this.category,
        this.likeStatus,
        this.saveStatus,
        this.dynamicSizes,
        this.dynamicColors});

  Information.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productImage = json['productImage'];
    productRemain = json['productRemain'];
    productRemainVn = json['productRemainVn'];
    productRemainKr = json['productRemainKr'];
    madeIn = json['madeIn'];
    buyCount = json['buyCount'];
    likeNumber = json['likeNumber'];
    commentCount = json['commentCount'];
    averageStar = json['averageStar'];
    price = json['price'];
    priceVn = json['priceVn'];
    priceKr = json['priceKr'];
    priceSales = json['priceSales'];
    priceSalesVn = json['priceSalesVn'];
    priceSalesKr = json['priceSalesKr'];
    percentKol = json['percentKol'];
    percentKolVn = json['percentKolVn'];
    percentKolKr = json['percentKolKr'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    extendNote = json['extendNote'];
    productImages = json['productImages'].cast<String>();
    isFreeDelivery = json['isFreeDelivery'];
    isFreeDeliveryVn = json['isFreeDeliveryVn'];
    isFreeDeliveryKr = json['isFreeDeliveryKr'];
    isActive = json['isActive'];
    agentId = json['agentId'];
    insertDateTime = json['insertDateTime'];
    brandId = json['brandId'];
    categoryId = json['categoryId'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    likeStatus = json['likeStatus'];
    saveStatus = json['saveStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productImage'] = this.productImage;
    data['productRemain'] = this.productRemain;
    data['productRemainVn'] = this.productRemainVn;
    data['productRemainKr'] = this.productRemainKr;
    data['madeIn'] = this.madeIn;
    data['buyCount'] = this.buyCount;
    data['likeNumber'] = this.likeNumber;
    data['commentCount'] = this.commentCount;
    data['averageStar'] = this.averageStar;
    data['price'] = this.price;
    data['priceVn'] = this.priceVn;
    data['priceKr'] = this.priceKr;
    data['priceSales'] = this.priceSales;
    data['priceSalesVn'] = this.priceSalesVn;
    data['priceSalesKr'] = this.priceSalesKr;
    data['percentKol'] = this.percentKol;
    data['percentKolVn'] = this.percentKolVn;
    data['percentKolKr'] = this.percentKolKr;
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['extendNote'] = this.extendNote;
    data['productImages'] = this.productImages;
    data['isFreeDelivery'] = this.isFreeDelivery;
    data['isFreeDeliveryVn'] = this.isFreeDeliveryVn;
    data['isFreeDeliveryKr'] = this.isFreeDeliveryKr;
    data['isActive'] = this.isActive;
    data['agentId'] = this.agentId;
    data['insertDateTime'] = this.insertDateTime;
    data['brandId'] = this.brandId;
    data['categoryId'] = this.categoryId;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['likeStatus'] = this.likeStatus;
    data['saveStatus'] = this.saveStatus;
    return data;
  }
}

class Brand {
  int? brandId;
  String? brandName;
  String? brandIntroduceMedia;
  String? brandType;
  String? brandAvatar;
  String? brandDescription;
  int? numberProduct;
  String? followStatus;

  Brand(
      {this.brandId,
        this.brandName,
        this.brandIntroduceMedia,
        this.brandType,
        this.brandAvatar,
        this.brandDescription,
        this.numberProduct,
        this.followStatus});

  Brand.fromJson(Map<String, dynamic> json) {
    brandId = json['brandId'];
    brandName = json['brandName'];
    brandIntroduceMedia = json['brandIntroduceMedia'];
    brandType = json['brandType'];
    brandAvatar = json['brandAvatar'];
    brandDescription = json['brandDescription'];
    numberProduct = json['numberProduct'];
    followStatus = json['followStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    data['brandIntroduceMedia'] = this.brandIntroduceMedia;
    data['brandType'] = this.brandType;
    data['brandAvatar'] = this.brandAvatar;
    data['brandDescription'] = this.brandDescription;
    data['numberProduct'] = this.numberProduct;
    data['followStatus'] = this.followStatus;
    return data;
  }
}

class Category {
  int? categoryId;
  int? categoryParentId;
  String? categoryParentName;
  String? categoryParentImage;
  String? categoryParentBackgroundColor;
  List<String>? categoryParentSlideImages;
  String? categoryName;
  String? categoryImage;
  List<Null>? categorySlideImages;

  Category(
      {this.categoryId,
        this.categoryParentId,
        this.categoryParentName,
        this.categoryParentImage,
        this.categoryParentBackgroundColor,
        this.categoryParentSlideImages,
        this.categoryName,
        this.categoryImage,
        this.categorySlideImages});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryParentId = json['categoryParentId'];
    categoryParentName = json['categoryParentName'];
    categoryParentImage = json['categoryParentImage'];
    categoryParentBackgroundColor = json['categoryParentBackgroundColor'];
    categoryParentSlideImages =
        json['categoryParentSlideImages'].cast<String>();
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
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
