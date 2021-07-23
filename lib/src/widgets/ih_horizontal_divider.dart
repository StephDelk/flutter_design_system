import 'package:flutter/material.dart';
import 'package:in_harmony/src/widgets/ih_empty.dart';

class IHHorizontalDivider extends StatelessWidget {
  final double? thickness;
  final Color? color;
  final double? leftIndent;
  final double? rightIndent;
  final EdgeInsets? marginInsets;

  final Widget? label;
  final Alignment? labelAlignment;
  final EdgeInsets? labelMarginInsets;

  const IHHorizontalDivider({
    Key? key,
    this.thickness,
    this.color,
    this.leftIndent,
    this.rightIndent,
    this.marginInsets,
    this.label,
    this.labelAlignment,
    this.labelMarginInsets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget lineWidget = _getLineWidget();

    Widget? lineWidgetWrapper = _getLineWidgetWrapper();

    return Container(
      margin: marginInsets ?? EdgeInsets.zero,
      child: Row(
        children: [
          SizedBox(width: leftIndent ?? 0.0),
          lineWidgetWrapper != null ? Expanded(child: lineWidgetWrapper) : lineWidget,
          SizedBox(width: rightIndent ?? 0.0),
        ],
      ),
    );
  }

  Widget _getLineWidget() {
    return Expanded(
      child: Container(
        height: thickness == null || thickness! < 0 ? 1.0 : thickness,
        color: color ?? Colors.black,
      ),
    );
  }

  Widget _getLabelWidget() {
    return (label == null
        ? IHEmptyWidget()
        : labelMarginInsets == null
            ? label
            : Container(margin: labelMarginInsets, child: label)) as Widget;
  }

  Widget? _getLineWidgetWrapper() {
    if (label == null) return null;

    final Widget labelWidgetWrapper = _getLabelWidget();
    final Widget lineWidget = _getLineWidget();

    Alignment labelPosition = labelAlignment ?? Alignment.center;

    if (labelPosition == Alignment.center) {
      return Row(
        children: [
          lineWidget,
          labelWidgetWrapper,
          lineWidget,
        ],
      );
    }

    if (labelPosition == Alignment.centerLeft) {
      return Row(
        children: [
          labelWidgetWrapper,
          lineWidget,
        ],
      );
    }

    if (labelPosition == Alignment.centerRight) {
      return Row(
        children: [
          lineWidget,
          labelWidgetWrapper,
        ],
      );
    }

    if (labelPosition == Alignment.topCenter) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 25.0),
              Flexible(child: labelWidgetWrapper),
              SizedBox(width: 25.0),
            ],
          ),
          Row(
            children: [lineWidget],
          ),
        ],
      );
    }

    if (labelPosition == Alignment.topLeft) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: labelWidgetWrapper),
              SizedBox(width: 25.0),
            ],
          ),
          Row(
            children: [lineWidget],
          ),
        ],
      );
    }

    if (labelPosition == Alignment.topRight) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 25.0),
              Flexible(child: labelWidgetWrapper),
            ],
          ),
          Row(
            children: [lineWidget],
          ),
        ],
      );
    }

    if (labelPosition == Alignment.bottomCenter) {
      return Column(
        children: [
          Row(
            children: [lineWidget],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 25.0),
              Flexible(child: labelWidgetWrapper),
              SizedBox(width: 25.0),
            ],
          ),
        ],
      );
    }

    if (labelPosition == Alignment.bottomLeft) {
      return Column(
        children: [
          Row(
            children: [lineWidget],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: labelWidgetWrapper),
              SizedBox(width: 25.0),
            ],
          ),
        ],
      );
    }

    if (labelPosition == Alignment.bottomRight) {
      return Column(
        children: [
          Row(
            children: [lineWidget],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 25.0),
              Flexible(child: labelWidgetWrapper),
            ],
          ),
        ],
      );
    }
  }
}
