import 'package:flutter/material.dart';

class PriceDisplay extends StatefulWidget {
  double price;

  PriceDisplay({super.key, required this.price});

  @override
  _PriceDisplayState createState() => _PriceDisplayState();
}

class _PriceDisplayState extends State<PriceDisplay> {
  late double _previousPrice;
  late Color _color;

  @override
  void initState() {
    super.initState();
    _previousPrice = widget.price;
    _color = widget.price > _previousPrice ? Colors.green : Colors.red;
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    if (widget.price == _previousPrice) {
      _color = Colors.grey;
    } else if (widget.price > _previousPrice) {
      _color = Colors.green;
    } else {
      _color = Colors.red;
    }
    _previousPrice = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    _previousPrice = widget.price;
    return Text(
      "Price: ${widget.price.toStringAsFixed(2)}",
      style: TextStyle(
        color: _color,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
