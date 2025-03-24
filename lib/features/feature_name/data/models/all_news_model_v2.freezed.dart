// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_news_model_v2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllNewsModelV2 {

 String get firstName; String get lastName; int get age;
/// Create a copy of AllNewsModelV2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllNewsModelV2CopyWith<AllNewsModelV2> get copyWith => _$AllNewsModelV2CopyWithImpl<AllNewsModelV2>(this as AllNewsModelV2, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllNewsModelV2&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.age, age) || other.age == age));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,age);

@override
String toString() {
  return 'AllNewsModelV2(firstName: $firstName, lastName: $lastName, age: $age)';
}


}

/// @nodoc
abstract mixin class $AllNewsModelV2CopyWith<$Res>  {
  factory $AllNewsModelV2CopyWith(AllNewsModelV2 value, $Res Function(AllNewsModelV2) _then) = _$AllNewsModelV2CopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, int age
});




}
/// @nodoc
class _$AllNewsModelV2CopyWithImpl<$Res>
    implements $AllNewsModelV2CopyWith<$Res> {
  _$AllNewsModelV2CopyWithImpl(this._self, this._then);

  final AllNewsModelV2 _self;
  final $Res Function(AllNewsModelV2) _then;

/// Create a copy of AllNewsModelV2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? age = null,}) {
  return _then(AllNewsModelV2(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on
