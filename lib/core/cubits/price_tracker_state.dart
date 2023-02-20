import 'package:equatable/equatable.dart';


class PriceTrackerState extends Equatable {

  final bool isLoading;
  final String? error;
  final List<String> markets;
  final double price;
  final Map<String, List<String>>? marketAssets;
  final String tickId;

  const PriceTrackerState({
    this.isLoading = false,
    this.error,
    this.markets =  const [],
    this.price = 0.0,
    this.marketAssets,
    this.tickId = ''

  });


  @override
  List<Object?> get props =>
      [
        isLoading,
        error,
        markets,
        price,
        marketAssets,
        tickId
      ];

  PriceTrackerState copyWith({
    bool? isLoading,
    String? error,
    List<String>? markets,
    double? price,
    Map<String, List<String>>? marketAssets,
    String? tickId
  }) => PriceTrackerState(
    isLoading: isLoading ??  this.isLoading,
    error: error ??  this.error,
    markets: markets ?? this.markets,
    price: price ?? this.price,
    marketAssets: marketAssets ?? this.marketAssets,
    tickId: tickId ?? this.tickId
  );

}