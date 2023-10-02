class CategoryIdModel {
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

  CategoryIdModel(
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

  CategoryIdModel.fromJson(Map<String, dynamic> json) {
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
  int? productId;
  String? productCode;
  String? productImage;
  int? productRemain;
  int? productRemainVn;
  int? productRemainKr;
  int? buyCount;
  int? likeNumber;
  int? commentCount;
  double? averageStar;
  int? price;
  int? priceVn;
  int? priceKr;
  double? percentSales;
  double? percentSalesVn;
  double? percentSalesKr;
  double? percentKol;
  double? percentKolVn;
  double? percentKolKr;
  String? productName;
  String? productDescription;
  String? mfgDate;
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
  List<DynamicSizes>? dynamicSizes;
  List<Null>? dynamicColors;
  int? priceSales;
  int? priceSalesVn;
  int? priceSalesKr;
  String? madeIn;
  int? expiry;
  String? extendNote;

  Content(
      {this.productId,
        this.productCode,
        this.productImage,
        this.productRemain,
        this.productRemainVn,
        this.productRemainKr,
        this.buyCount,
        this.likeNumber,
        this.commentCount,
        this.averageStar,
        this.price,
        this.priceVn,
        this.priceKr,
        this.percentSales,
        this.percentSalesVn,
        this.percentSalesKr,
        this.percentKol,
        this.percentKolVn,
        this.percentKolKr,
        this.productName,
        this.productDescription,
        this.mfgDate,
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
        this.dynamicColors,
        this.priceSales,
        this.priceSalesVn,
        this.priceSalesKr,
        this.madeIn,
        this.expiry,
        this.extendNote});

  Content.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productCode = json['productCode'];
    productImage = json['productImage'];
    productRemain = json['productRemain'];
    productRemainVn = json['productRemainVn'];
    productRemainKr = json['productRemainKr'];
    buyCount = json['buyCount'];
    likeNumber = json['likeNumber'];
    commentCount = json['commentCount'];
    averageStar = json['averageStar'];
    price = json['price'];
    priceVn = json['priceVn'];
    priceKr = json['priceKr'];
    percentSales = json['percentSales'];
    percentSalesVn = json['percentSalesVn'];
    percentSalesKr = json['percentSalesKr'];
    percentKol = json['percentKol'];
    percentKolVn = json['percentKolVn'];
    percentKolKr = json['percentKolKr'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    mfgDate = json['mfgDate'];
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
    if (json['dynamicSizes'] != null) {
      dynamicSizes = <DynamicSizes>[];
      json['dynamicSizes'].forEach((v) {
        dynamicSizes!.add(new DynamicSizes.fromJson(v));
      });
    }

    priceSales = json['priceSales'];
    priceSalesVn = json['priceSalesVn'];
    priceSalesKr = json['priceSalesKr'];
    madeIn = json['madeIn'];
    expiry = json['expiry'];
    extendNote = json['extendNote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productCode'] = this.productCode;
    data['productImage'] = this.productImage;
    data['productRemain'] = this.productRemain;
    data['productRemainVn'] = this.productRemainVn;
    data['productRemainKr'] = this.productRemainKr;
    data['buyCount'] = this.buyCount;
    data['likeNumber'] = this.likeNumber;
    data['commentCount'] = this.commentCount;
    data['averageStar'] = this.averageStar;
    data['price'] = this.price;
    data['priceVn'] = this.priceVn;
    data['priceKr'] = this.priceKr;
    data['percentSales'] = this.percentSales;
    data['percentSalesVn'] = this.percentSalesVn;
    data['percentSalesKr'] = this.percentSalesKr;
    data['percentKol'] = this.percentKol;
    data['percentKolVn'] = this.percentKolVn;
    data['percentKolKr'] = this.percentKolKr;
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['mfgDate'] = this.mfgDate;
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
    if (this.dynamicSizes != null) {
      data['dynamicSizes'] = this.dynamicSizes!.map((v) => v.toJson()).toList();
    }

    data['priceSales'] = this.priceSales;
    data['priceSalesVn'] = this.priceSalesVn;
    data['priceSalesKr'] = this.priceSalesKr;
    data['madeIn'] = this.madeIn;
    data['expiry'] = this.expiry;
    data['extendNote'] = this.extendNote;
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

class DynamicSizes {
  int? dynamicSizeId;
  String? dynamicSizeCode;
  String? dynamicSizeCodeVn;
  String? dynamicSizeCodeKr;
  int? price;
  int? priceVn;
  int? priceKr;
  int? percentSales;
  int? percentSalesVn;
  int? percentSalesKr;
  double? percentKol;
  double? percentKolVn;
  double? percentKolKr;
  int? productRemain;
  int? productRemainVn;
  int? productRemainKr;

  DynamicSizes(
      {this.dynamicSizeId,
        this.dynamicSizeCode,
        this.dynamicSizeCodeVn,
        this.dynamicSizeCodeKr,
        this.price,
        this.priceVn,
        this.priceKr,
        this.percentSales,
        this.percentSalesVn,
        this.percentSalesKr,
        this.percentKol,
        this.percentKolVn,
        this.percentKolKr,
        this.productRemain,
        this.productRemainVn,
        this.productRemainKr});

  DynamicSizes.fromJson(Map<String, dynamic> json) {
    dynamicSizeId = json['dynamicSizeId'];
    dynamicSizeCode = json['dynamicSizeCode'];
    dynamicSizeCodeVn = json['dynamicSizeCodeVn'];
    dynamicSizeCodeKr = json['dynamicSizeCodeKr'];
    price = json['price'];
    priceVn = json['priceVn'];
    priceKr = json['priceKr'];
    percentSales = json['percentSales'];
    percentSalesVn = json['percentSalesVn'];
    percentSalesKr = json['percentSalesKr'];
    percentKol = json['percentKol'];
    percentKolVn = json['percentKolVn'];
    percentKolKr = json['percentKolKr'];
    productRemain = json['productRemain'];
    productRemainVn = json['productRemainVn'];
    productRemainKr = json['productRemainKr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dynamicSizeId'] = this.dynamicSizeId;
    data['dynamicSizeCode'] = this.dynamicSizeCode;
    data['dynamicSizeCodeVn'] = this.dynamicSizeCodeVn;
    data['dynamicSizeCodeKr'] = this.dynamicSizeCodeKr;
    data['price'] = this.price;
    data['priceVn'] = this.priceVn;
    data['priceKr'] = this.priceKr;
    data['percentSales'] = this.percentSales;
    data['percentSalesVn'] = this.percentSalesVn;
    data['percentSalesKr'] = this.percentSalesKr;
    data['percentKol'] = this.percentKol;
    data['percentKolVn'] = this.percentKolVn;
    data['percentKolKr'] = this.percentKolKr;
    data['productRemain'] = this.productRemain;
    data['productRemainVn'] = this.productRemainVn;
    data['productRemainKr'] = this.productRemainKr;
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
