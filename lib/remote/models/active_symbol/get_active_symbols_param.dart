
import 'package:json_annotation/json_annotation.dart';


part 'get_active_symbols_param.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetActiveSymbolsParam {

  String activeSymbols;

  String productType;

  GetActiveSymbolsParam({required this.activeSymbols, this.productType = "basic"});

  factory GetActiveSymbolsParam.fromJson(Map<String, dynamic> json) => _$GetActiveSymbolsParamFromJson(json);


  Map<String, dynamic> toJson() => _$GetActiveSymbolsParamToJson(this);

}