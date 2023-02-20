import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/core/cubits/price_tracker_state.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../remote/models/active_symbol/active_symbol.dart';
import '../../remote/deriv_websocket/deriv_websocket_channel.dart';
import '../../remote/models/active_symbol/active_symbol_response.dart';
import '../../remote/models/forget_tick/forget_ticks_stream_param.dart';
import '../../remote/models/active_symbol/get_active_symbols_param.dart';
import '../../remote/models/get_ticks/get_ticks_param.dart';
import '../../remote/models/get_ticks/price_response.dart';
import '../../remote/models/get_ticks/tick.dart';

class PriceTrackerCubit extends Cubit<PriceTrackerState> {
  WebSocketChannel activeSymbolsChannel = DerivWebSocketChannel().getChannel();
  WebSocketChannel priceChannel = DerivWebSocketChannel().getChannel();

  PriceTrackerCubit(super.initialState);

  List<ActiveSymbol> activeSymbols = [];
  Map<String, List<String>> marketAssetsMap = {};
  Set<String> markets = {};

  void getMarkets() {
    activeSymbolsChannel.sink.add(jsonEncode(GetActiveSymbolsParam(
      activeSymbols: 'brief',
    ).toJson()));

    /// Listen for all incoming data
    var stream = activeSymbolsChannel.stream;
    stream.listen(
      (data) {
        activeSymbols =
            ActiveSymbolsResponse.fromJson(jsonDecode(data.toString()))
                .activeSymbols;

        for (var element in activeSymbols) {
          markets.add(element.marketDisplayName);
        }

        for (var market in markets) {
          List<String> list = [];
          for (var e in activeSymbols) {
            if (e.marketDisplayName == market) {
              list.add(e.displayName);
            }
          }
          marketAssetsMap.addAll({market: list});
        }
        if (markets.isNotEmpty) {
          emit(
            state.copyWith(
                markets: markets.toList(), marketAssets: marketAssetsMap),
          );
        }
      },
      onError: (error) {
        return emit(state.copyWith(
            error: "oops! something went wrong. Check internet connection"));
      },
    );
  }

  void getPrice(String market, String asset) {
    emit(state.copyWith(isLoading: true));
    String symbol = '';

    for (var activeSymbol in activeSymbols) {
      if (activeSymbol.marketDisplayName == market &&
          activeSymbol.displayName == asset) {
        symbol = activeSymbol.symbol;
        break;
      }
    }

    priceChannel.sink.add(jsonEncode(
      GetTicksParam(ticks: symbol).toJson(),
    ));

    priceChannel.stream.asBroadcastStream().listen((data) {
      Tick tick = PriceResponse.fromJson(jsonDecode(data.toString())).tick;
      emit(
          state.copyWith(price: tick.quote, tickId: tick.id, isLoading: false));
    });
  }

  void forget(String id) {
    priceChannel.sink.add(
      jsonEncode(ForgetTicksStreamParam(forget: id).toJson()),
    );
  }

  void closeConnection() {
    activeSymbolsChannel.sink.close();
    priceChannel.sink.close();
  }
}
