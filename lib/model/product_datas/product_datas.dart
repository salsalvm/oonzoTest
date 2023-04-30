import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'product_datas.g.dart';

@JsonSerializable()
class ProductDatas {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductDatas({this.products, this.total, this.skip, this.limit});

  factory ProductDatas.fromJson(Map<String, dynamic> json) {
    return _$ProductDatasFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDatasToJson(this);
}
