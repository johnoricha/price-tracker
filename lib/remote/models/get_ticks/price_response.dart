
import 'package:json_annotation/json_annotation.dart';
import 'package:price_tracker/remote/models/get_ticks/tick.dart';

part 'price_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PriceResponse {

  Tick tick;

  PriceResponse(this.tick);

  factory PriceResponse.fromJson(Map<String, dynamic> json) => _$PriceResponseFromJson(json);


  Map<String, dynamic> toJson() => _$PriceResponseToJson(this);

  List<Object?> get props => [tick];

}