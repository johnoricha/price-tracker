// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_symbol_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbolsResponse _$ActiveSymbolsResponseFromJson(
        Map<String, dynamic> json) =>
    ActiveSymbolsResponse(
      (json['active_symbols'] as List<dynamic>)
          .map((e) => ActiveSymbol.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActiveSymbolsResponseToJson(
        ActiveSymbolsResponse instance) =>
    <String, dynamic>{
      'active_symbols': instance.activeSymbols.map((e) => e.toJson()).toList(),
    };
