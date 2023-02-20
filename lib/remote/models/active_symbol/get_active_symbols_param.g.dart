// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_active_symbols_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActiveSymbolsParam _$GetActiveSymbolsParamFromJson(
        Map<String, dynamic> json) =>
    GetActiveSymbolsParam(
      activeSymbols: json['active_symbols'] as String,
      productType: json['product_type'] as String? ?? "basic",
    );

Map<String, dynamic> _$GetActiveSymbolsParamToJson(
        GetActiveSymbolsParam instance) =>
    <String, dynamic>{
      'active_symbols': instance.activeSymbols,
      'product_type': instance.productType,
    };
