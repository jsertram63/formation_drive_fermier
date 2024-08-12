import 'package:flutter/material.dart';
class FilterWidget extends StatefulWidget {
  final Widget child;
  final int type;
  const FilterWidget({Key? key, required this.child, required this.type});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}
class _FilterWidgetState extends State<FilterWidget> {

  int type = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) => StateInheritedWidget(
    type: type,
    child: widget.child,filterState: this);
  }


class StateInheritedWidget extends InheritedWidget {
  final int type;
  final _FilterWidgetState filterState;
  StateInheritedWidget({required this.type, required super.child,
  required this.filterState});
  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.type != type;
  }
  // méthode .of
  static _FilterWidgetState of(BuildContext context) => context 
          .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
          .filterState;
}