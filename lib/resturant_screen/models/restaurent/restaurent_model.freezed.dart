// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurentModel _$RestaurentModelFromJson(Map<String, dynamic> json) {
  return _RestaurentModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurentModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get logoImage => throw _privateConstructorUsedError;
  String get restaurentImage => throw _privateConstructorUsedError;
  double get ratings => throw _privateConstructorUsedError;
  int get hmRatings => throw _privateConstructorUsedError;
  String get deliveryTime => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurentModelCopyWith<RestaurentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurentModelCopyWith<$Res> {
  factory $RestaurentModelCopyWith(
          RestaurentModel value, $Res Function(RestaurentModel) then) =
      _$RestaurentModelCopyWithImpl<$Res, RestaurentModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      String logoImage,
      String restaurentImage,
      double ratings,
      int hmRatings,
      String deliveryTime,
      String category});
}

/// @nodoc
class _$RestaurentModelCopyWithImpl<$Res, $Val extends RestaurentModel>
    implements $RestaurentModelCopyWith<$Res> {
  _$RestaurentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? logoImage = null,
    Object? restaurentImage = null,
    Object? ratings = null,
    Object? hmRatings = null,
    Object? deliveryTime = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      logoImage: null == logoImage
          ? _value.logoImage
          : logoImage // ignore: cast_nullable_to_non_nullable
              as String,
      restaurentImage: null == restaurentImage
          ? _value.restaurentImage
          : restaurentImage // ignore: cast_nullable_to_non_nullable
              as String,
      ratings: null == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as double,
      hmRatings: null == hmRatings
          ? _value.hmRatings
          : hmRatings // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurentModelImplCopyWith<$Res>
    implements $RestaurentModelCopyWith<$Res> {
  factory _$$RestaurentModelImplCopyWith(_$RestaurentModelImpl value,
          $Res Function(_$RestaurentModelImpl) then) =
      __$$RestaurentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      String logoImage,
      String restaurentImage,
      double ratings,
      int hmRatings,
      String deliveryTime,
      String category});
}

/// @nodoc
class __$$RestaurentModelImplCopyWithImpl<$Res>
    extends _$RestaurentModelCopyWithImpl<$Res, _$RestaurentModelImpl>
    implements _$$RestaurentModelImplCopyWith<$Res> {
  __$$RestaurentModelImplCopyWithImpl(
      _$RestaurentModelImpl _value, $Res Function(_$RestaurentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? logoImage = null,
    Object? restaurentImage = null,
    Object? ratings = null,
    Object? hmRatings = null,
    Object? deliveryTime = null,
    Object? category = null,
  }) {
    return _then(_$RestaurentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      logoImage: null == logoImage
          ? _value.logoImage
          : logoImage // ignore: cast_nullable_to_non_nullable
              as String,
      restaurentImage: null == restaurentImage
          ? _value.restaurentImage
          : restaurentImage // ignore: cast_nullable_to_non_nullable
              as String,
      ratings: null == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as double,
      hmRatings: null == hmRatings
          ? _value.hmRatings
          : hmRatings // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurentModelImpl implements _RestaurentModel {
  _$RestaurentModelImpl(
      {this.id = "",
      this.name = "",
      this.location = "",
      this.logoImage = "",
      this.restaurentImage = "",
      this.ratings = 0,
      this.hmRatings = 0,
      this.deliveryTime = "",
      this.category = ""});

  factory _$RestaurentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurentModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String logoImage;
  @override
  @JsonKey()
  final String restaurentImage;
  @override
  @JsonKey()
  final double ratings;
  @override
  @JsonKey()
  final int hmRatings;
  @override
  @JsonKey()
  final String deliveryTime;
  @override
  @JsonKey()
  final String category;

  @override
  String toString() {
    return 'RestaurentModel(id: $id, name: $name, location: $location, logoImage: $logoImage, restaurentImage: $restaurentImage, ratings: $ratings, hmRatings: $hmRatings, deliveryTime: $deliveryTime, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.logoImage, logoImage) ||
                other.logoImage == logoImage) &&
            (identical(other.restaurentImage, restaurentImage) ||
                other.restaurentImage == restaurentImage) &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.hmRatings, hmRatings) ||
                other.hmRatings == hmRatings) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location, logoImage,
      restaurentImage, ratings, hmRatings, deliveryTime, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurentModelImplCopyWith<_$RestaurentModelImpl> get copyWith =>
      __$$RestaurentModelImplCopyWithImpl<_$RestaurentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurentModelImplToJson(
      this,
    );
  }
}

abstract class _RestaurentModel implements RestaurentModel {
  factory _RestaurentModel(
      {final String id,
      final String name,
      final String location,
      final String logoImage,
      final String restaurentImage,
      final double ratings,
      final int hmRatings,
      final String deliveryTime,
      final String category}) = _$RestaurentModelImpl;

  factory _RestaurentModel.fromJson(Map<String, dynamic> json) =
      _$RestaurentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get location;
  @override
  String get logoImage;
  @override
  String get restaurentImage;
  @override
  double get ratings;
  @override
  int get hmRatings;
  @override
  String get deliveryTime;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$RestaurentModelImplCopyWith<_$RestaurentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
