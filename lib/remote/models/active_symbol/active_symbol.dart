import 'package:json_annotation/json_annotation.dart';

part 'active_symbol.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ActiveSymbol {
  String symbol;

  String displayName;

  String marketDisplayName;

  ActiveSymbol(this.symbol, this.marketDisplayName, this.displayName);

  factory ActiveSymbol.fromJson(Map<String, dynamic> json) =>
      _$ActiveSymbolFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveSymbolToJson(this);
}
