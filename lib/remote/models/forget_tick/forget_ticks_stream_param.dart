import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_ticks_stream_param.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ForgetTicksStreamParam extends Equatable {
  String forget;

  ForgetTicksStreamParam({required this.forget});

  factory ForgetTicksStreamParam.fromJson(Map<String, dynamic> json) =>
      _$ForgetTicksStreamParamFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetTicksStreamParamToJson(this);

  @override
  List<Object?> get props => [forget];
}
