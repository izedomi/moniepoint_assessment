import 'package:flutter/material.dart';

class CounterText extends ImplicitlyAnimatedWidget {
  final int value;
  final TextStyle? style;
  const CounterText({
    super.key,
    required super.duration,
    required this.value,
    this.style,
  });

  @override
  ImplicitlyAnimatedWidgetState<CounterText> createState() =>
      _CounterTextState();
}

class _CounterTextState extends AnimatedWidgetBaseState<CounterText> {
  late IntTween _counter;

  @override
  void initState() {
    _counter = IntTween(begin: widget.value, end: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_counter.evaluate(animation)}',
      style: widget.style,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _counter = visitor(
      _counter,
      widget.value,
      (dynamic value) => IntTween(begin: value),
    ) as IntTween;
  }
}
