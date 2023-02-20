import 'package:json_annotation/json_annotation.dart';

part 'get_ticks_param.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetTicksParam {

  String ticks;

  int subscribe;

  GetTicksParam({required this.ticks, this.subscribe = 1});

  factory GetTicksParam.fromJson(Map<String, dynamic> json) =>
      _$GetTicksParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetTicksParamToJson(this);
}
