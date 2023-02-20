import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/core/cubits/price_tracker_cubit.dart';
import 'package:price_tracker/core/cubits/price_tracker_state.dart';
import 'package:price_tracker/ui/price_display.dart';

class PriceTrackerHome extends StatefulWidget {
  const PriceTrackerHome({Key? key}) : super(key: key);

  @override
  State<PriceTrackerHome> createState() => _PriceTrackerHomeState();
}

class _PriceTrackerHomeState extends State<PriceTrackerHome> {
  final _priceTrackerCubit = PriceTrackerCubit(const PriceTrackerState());
  String? marketDropDownValue;
  String? assetDropDownValue;

  @override
  void initState() {
    _priceTrackerCubit.getMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceTrackerCubit, PriceTrackerState>(
        bloc: _priceTrackerCubit,
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Price Tracker"),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 350,
                      child: DropdownButton(
                        isExpanded: true,
                        value: marketDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: const Text("Select a Market"),
                        items: state.markets
                            .map<DropdownMenuItem<String>>((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            marketDropDownValue = value.toString();
                            Set<String>? list = state
                                .marketAssets?[marketDropDownValue]
                                ?.toSet();
                            if (!list!.contains(assetDropDownValue) &&
                                assetDropDownValue != null) {
                              assetDropDownValue = null;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 350,
                      child: DropdownButton(
                        // Initial Value
                        isExpanded: true,
                        value: assetDropDownValue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        hint: const Text("Select an Asset"),

                        // Array list of items
                        items: state.marketAssets?[marketDropDownValue]
                            ?.toSet()
                            .map<DropdownMenuItem<String>>((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != assetDropDownValue && value != null) {
                            _priceTrackerCubit.forget(state.tickId);
                          }
                          setState(() {
                            if (value != null) {
                              assetDropDownValue = value.toString();
                            }
                          });
                          _priceTrackerCubit.getPrice(
                              marketDropDownValue.toString(),
                              assetDropDownValue.toString());
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 160),
                  Center(
                    child: Stack(children: [
                      Visibility(
                          visible: !state.isLoading,
                          child: state.error != null
                              ? Text(state.error!,
                            style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),)
                              : PriceDisplay(price: state.price)),
                      Visibility(
                          visible: state.isLoading,
                          child: const CircularProgressIndicator())
                    ]),
                  )
                ],
              )
          );
        },
        listener: (context, state) {});
  }

  @override
  void dispose() {
    _priceTrackerCubit.closeConnection();
    super.dispose();
  }
}
