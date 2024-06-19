import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget padding(EdgeInsets padding) => Padding(padding: padding, child: this);

  @Deprecated('Use onTap instead')
  Widget onTap(VoidCallback? onTap) => GestureDetector(onTap: onTap, child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);

  Widget paddingOnly({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );

  Widget paddingFromLTRB({required double left, required double right, required double top, required double bottom}) =>
      Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);

  Widget marginAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget marginSymmetric({required double horizontal, required double vertical}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);

  Widget marginOnly({required double left, required double right, required double top, required double bottom}) =>
      Padding(padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom), child: this);

  Widget marginFromLTRB({required double left, required double right, required double top, required double bottom}) =>
      Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);

  Widget center() => Center(child: this);

  Widget fit() => FittedBox(child: this);

  Widget materialized({
    BorderRadius? borderRadius,
  }) =>
      Material(
        borderRadius: borderRadius,
        color: Colors.transparent,
        child: this,
      );

  Widget safeArea() => SafeArea(child: this);

  Widget showIf(bool value) => value ? this : const SizedBox.shrink();

  // Widget centerHorizontal() => Center(child: this);

  Widget align([AlignmentGeometry alignment = Alignment.center]) => Align(alignment: alignment, child: this);

  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget background(Color color) => Material(color: color, child: this);

  Widget constrains({
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: this,
    );
  }

  Widget toScrollableList({int itemCount = 10, Axis scrollDirection = Axis.vertical, EdgeInsets padding = EdgeInsets.zero, Widget? separator}) {
    List<Widget> items = List.generate(itemCount, (index) => this);
    if (separator != null) {
      items = items.expand((element) => [element, separator]).toList();
    }

    return SingleChildScrollView(
      padding: padding,
      scrollDirection: scrollDirection,
      child: scrollDirection == Axis.vertical ? Column(children: items) : Row(children: items),
    );
  }

  Widget toScrollableGrid({
    SliverGridDelegate gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
    ),
    EdgeInsets padding = EdgeInsets.zero,
    int itemCount = 10,
    Axis scrollDirection = Axis.vertical,
  }) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: gridDelegate,
      scrollDirection: scrollDirection,
      padding: padding,
      itemBuilder: (_, __) => this,
    );
  }

  Widget scrollable({Axis scrollDirection = Axis.vertical, EdgeInsets padding = EdgeInsets.zero}) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      padding: padding,
      child: this,
    );
  }
}

extension ColumnExtension on Column {
  Column childrenPadding(EdgeInsets padding) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: children.map((e) => e.padding(padding)).toList(),
    );
  }
}

extension RowExtension on Row {
  Row childrenPadding(EdgeInsets padding) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: children.map((e) => e.padding(padding)).toList(),
    );
  }
}
