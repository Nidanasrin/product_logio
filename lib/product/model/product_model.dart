import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  Products({this.products, this.total, this.skip, this.limit});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    products: json["products"] == null
        ? []
        : List<Product>.from(
        json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null
        ? []
        : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  int? id;
  String? title;
  String? description;
  Category? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  AvailabilityStatus? availabilityStatus;
  List<Review>? reviews;
  ReturnPolicy? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    category: categoryValues.map[json["category"]],
    price: (json["price"] ?? 0).toDouble(),
    discountPercentage: (json["discountPercentage"] ?? 0).toDouble(),
    rating: (json["rating"] ?? 0).toDouble(),
    stock: json["stock"],
    tags: json["tags"] == null
        ? []
        : List<String>.from(json["tags"].map((x) => x)),
    brand: json["brand"],
    sku: json["sku"],
    weight: json["weight"],
    dimensions: json["dimensions"] != null
        ? Dimensions.fromJson(json["dimensions"])
        : null,
    warrantyInformation: json["warrantyInformation"],
    shippingInformation: json["shippingInformation"],
    availabilityStatus:
    availabilityStatusValues.map[json["availabilityStatus"]],
    reviews: json["reviews"] == null
        ? []
        : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    returnPolicy: returnPolicyValues.map[json["returnPolicy"]],
    minimumOrderQuantity: json["minimumOrderQuantity"],
    meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
    images: json["images"] == null
        ? []
        : List<String>.from(json["images"].map((x) => x)),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "category": categoryValues.reverse[category],
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "brand": brand,
    "sku": sku,
    "weight": weight,
    "dimensions": dimensions?.toJson(),
    "warrantyInformation": warrantyInformation,
    "shippingInformation": shippingInformation,
    "availabilityStatus":
    availabilityStatusValues.reverse[availabilityStatus],
    "reviews": reviews == null
        ? []
        : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    "returnPolicy": returnPolicyValues.reverse[returnPolicy],
    "minimumOrderQuantity": minimumOrderQuantity,
    "meta": meta?.toJson(),
    "images": images == null
        ? []
        : List<dynamic>.from(images!.map((x) => x)),
    "thumbnail": thumbnail,
  };
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    width: (json["width"] ?? 0).toDouble(),
    height: (json["height"] ?? 0).toDouble(),
    depth: (json["depth"] ?? 0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "depth": depth,
  };
}

class Meta {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
    updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
    barcode: json["barcode"],
    qrCode: json["qrCode"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "barcode": barcode,
    "qrCode": qrCode,
  };
}

class Review {
  int? rating;
  String? comment;
  DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: json["rating"],
    comment: json["comment"],
    date: DateTime.tryParse(json["date"] ?? ''),
    reviewerName: json["reviewerName"],
    reviewerEmail: json["reviewerEmail"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "comment": comment,
    "date": date?.toIso8601String(),
    "reviewerName": reviewerName,
    "reviewerEmail": reviewerEmail,
  };
}

// Enum and helpers

enum AvailabilityStatus { IN_STOCK, LOW_STOCK }

final availabilityStatusValues = EnumValues({
  "IN_STOCK": AvailabilityStatus.IN_STOCK,
  "LOW_STOCK": AvailabilityStatus.LOW_STOCK,
});

enum Category { BEAUTY, FRAGRANCES, FURNITURE, GROCERIES }

final categoryValues = EnumValues({
  "beauty": Category.BEAUTY,
  "fragrances": Category.FRAGRANCES,
  "furniture": Category.FURNITURE,
  "groceries": Category.GROCERIES,
});

enum ReturnPolicy {
  NO_RETURN_POLICY,
  THE_30_DAYS_RETURN_POLICY,
  THE_60_DAYS_RETURN_POLICY,
  THE_7_DAYS_RETURN_POLICY,
  THE_90_DAYS_RETURN_POLICY
}

final returnPolicyValues = EnumValues({
  "NO_RETURN_POLICY": ReturnPolicy.NO_RETURN_POLICY,
  "30_DAYS_RETURN_POLICY": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
  "60_DAYS_RETURN_POLICY": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
  "7_DAYS_RETURN_POLICY": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
  "90_DAYS_RETURN_POLICY": ReturnPolicy.THE_90_DAYS_RETURN_POLICY,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map) {
    reverseMap = map.map((k, v) => MapEntry(v, k));
  }

  Map<T, String> get reverse => reverseMap;
}
