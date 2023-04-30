// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_datas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDatas _$ProductDatasFromJson(Map<String, dynamic> json) => ProductDatas(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$ProductDatasToJson(ProductDatas instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
