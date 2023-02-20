
import 'package:json_annotation/json_annotation.dart';

part 'tick.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Tick {

  double quote;
  String id;

  Tick(this.quote, this.id);

  factory Tick.fromJson(Map<String, dynamic> json) => _$TickFromJson(json);


  Map<String, dynamic> toJson() => _$TickToJson(this);

}