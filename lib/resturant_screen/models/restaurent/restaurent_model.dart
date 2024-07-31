import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurent_model.g.dart';
part 'restaurent_model.freezed.dart';

@Freezed()
class RestaurentModel with _$RestaurentModel{
  factory RestaurentModel({
  @Default("")  String id,
    @Default("")  String name,
    @Default("")  String location,
    @Default("")  String logoImage,
    @Default("")  String restaurentImage,
    @Default(0)  double ratings,
    @Default(0) int hmRatings,
    @Default("") String deliveryTime,
    @Default("") String category,
}) = _RestaurentModel;

  factory RestaurentModel.fromJson(Map<String,dynamic> json)=> _$RestaurentModelFromJson(json);
}