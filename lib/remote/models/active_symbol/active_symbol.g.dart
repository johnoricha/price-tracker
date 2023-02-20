// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbol _$ActiveSymbolFromJson(Map<String, dynamic> json) => ActiveSymbol(
      json['symbol'] as String,
      json['market_display_name'] as String,
      json['display_name'] as String,
    );

Map<String, dynamic> _$ActiveSymbolToJson(ActiveSymbol instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'display_name': instance.displayName,
      'market_display_name': instance.marketDisplayName,
    };
