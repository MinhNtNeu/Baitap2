class ProductIdModel {
  int? productId;
  String? productCode;
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
  double? percentSales;
  double? percentSalesVn;
  double? percentSalesKr;
  double? percentKol;
  double? percentKolVn;
  double? percentKolKr;
  String? productName;
  String? productDescription;
  String? mfgDate;
  String? extendNote;
  List<Null>? productImages;
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
  double? kolCommissionAmountOfOneProductVn;
  double? kolCommissionAmountOfOneProductVnMin;
  double? kolCommissionAmountOfOneProductVnMax;
  double? kolCommissionAmountOfOneProductKr;
  double? kolCommissionAmountOfOneProductKrMin;
  double? kolCommissionAmountOfOneProductKrMax;
  List<Null>? dynamicSizes;
  List<Null>? dynamicColors;

  ProductIdModel(
      {this.productId,
        this.productCode,
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
        this.percentSales,
        this.percentSalesVn,
        this.percentSalesKr,
        this.percentKol,
        this.percentKolVn,
        this.percentKolKr,
        this.productName,
        this.productDescription,
        this.mfgDate,
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
        this.kolCommissionAmountOfOneProductVn,
        this.kolCommissionAmountOfOneProductVnMin,
        this.kolCommissionAmountOfOneProductVnMax,
        this.kolCommissionAmountOfOneProductKr,
        this.kolCommissionAmountOfOneProductKrMin,
        this.kolCommissionAmountOfOneProductKrMax,
        this.dynamicSizes,
        this.dynamicColors});

  ProductIdModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productCode = json['productCode'];
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
    percentSales = json['percentSales'];
    percentSalesVn = json['percentSalesVn'];
    percentSalesKr = json['percentSalesKr'];
    percentKol = json['percentKol'];
    percentKolVn = json['percentKolVn'];
    percentKolKr = json['percentKolKr'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    mfgDate = json['mfgDate'];
    extendNote = json['extendNote'];

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
    kolCommissionAmountOfOneProductVn =
    json['kolCommissionAmountOfOneProductVn'];
    kolCommissionAmountOfOneProductVnMin =
    json['kolCommissionAmountOfOneProductVnMin'];
    kolCommissionAmountOfOneProductVnMax =
    json['kolCommissionAmountOfOneProductVnMax'];
    kolCommissionAmountOfOneProductKr =
    json['kolCommissionAmountOfOneProductKr'];
    kolCommissionAmountOfOneProductKrMin =
    json['kolCommissionAmountOfOneProductKrMin'];
    kolCommissionAmountOfOneProductKrMax =
    json['kolCommissionAmountOfOneProductKrMax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productCode'] = this.productCode;
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
    data['percentSales'] = this.percentSales;
    data['percentSalesVn'] = this.percentSalesVn;
    data['percentSalesKr'] = this.percentSalesKr;
    data['percentKol'] = this.percentKol;
    data['percentKolVn'] = this.percentKolVn;
    data['percentKolKr'] = this.percentKolKr;
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['mfgDate'] = this.mfgDate;
    data['extendNote'] = this.extendNote;
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
    data['kolCommissionAmountOfOneProductVn'] =
        this.kolCommissionAmountOfOneProductVn;
    data['kolCommissionAmountOfOneProductVnMin'] =
        this.kolCommissionAmountOfOneProductVnMin;
    data['kolCommissionAmountOfOneProductVnMax'] =
        this.kolCommissionAmountOfOneProductVnMax;
    data['kolCommissionAmountOfOneProductKr'] =
        this.kolCommissionAmountOfOneProductKr;
    data['kolCommissionAmountOfOneProductKrMin'] =
        this.kolCommissionAmountOfOneProductKrMin;
    data['kolCommissionAmountOfOneProductKrMax'] =
        this.kolCommissionAmountOfOneProductKrMax;
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
