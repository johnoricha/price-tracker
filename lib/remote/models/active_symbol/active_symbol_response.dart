
import 'package:json_annotation/json_annotation.dart';

import 'active_symbol.dart';


part 'active_symbol_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ActiveSymbolsResponse {

  List<ActiveSymbol> activeSymbols;

  ActiveSymbolsResponse(this.activeSymbols);

  factory ActiveSymbolsResponse.fromJson(Map<String, dynamic> json) => _$ActiveSymbolsResponseFromJson(json);


  Map<String, dynamic> toJson() => _$ActiveSymbolsResponseToJson(this);

}