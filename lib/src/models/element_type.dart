import 'package:flutter/material.dart';

class ElementType {
  final Widget icon;
  final String name;
  final void Function(BuildContext context) onTap;
  final bool selected;

 const ElementType({
    required this.icon,
    required this.name,
    required this.onTap,
    required this.selected,
  });
}
