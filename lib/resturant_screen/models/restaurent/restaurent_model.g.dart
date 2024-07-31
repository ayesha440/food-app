// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurentModelImpl _$$RestaurentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurentModelImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      location: json['location'] as String? ?? "",
      logoImage: json['logoImage'] as String? ?? "",
      restaurentImage: json['restaurentImage'] as String? ?? "",
      ratings: (json['ratings'] as num?)?.toDouble() ?? 0,
      hmRatings: (json['hmRatings'] as num?)?.toInt() ?? 0,
      deliveryTime: json['deliveryTime'] as String? ?? "",
      category: json['category'] as String? ?? "",
    );

Map<String, dynamic> _$$RestaurentModelImplToJson(
        _$RestaurentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'logoImage': instance.logoImage,
      'restaurentImage': instance.restaurentImage,
      'ratings': instance.ratings,
      'hmRatings': instance.hmRatings,
      'deliveryTime': instance.deliveryTime,
      'category': instance.category,
    };
