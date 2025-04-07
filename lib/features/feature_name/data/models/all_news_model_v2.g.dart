// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_news_model_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllNewsModelV2 _$AllNewsModelV2FromJson(Map<String, dynamic> json) =>
    AllNewsModelV2(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$AllNewsModelV2ToJson(AllNewsModelV2 instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
    };
