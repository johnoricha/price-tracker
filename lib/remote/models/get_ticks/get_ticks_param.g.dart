// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ticks_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTicksParam _$GetTicksParamFromJson(Map<String, dynamic> json) =>
    GetTicksParam(
      ticks: json['ticks'] as String,
      subscribe: json['subscribe'] as int? ?? 1,
    );

Map<String, dynamic> _$GetTicksParamToJson(GetTicksParam instance) =>
    <String, dynamic>{
      'ticks': instance.ticks,
      'subscribe': instance.subscribe,
    };
