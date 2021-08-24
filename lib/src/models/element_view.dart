import 'package:flutter/material.dart';

import 'dashboard.dart';

typedef EditorElementBuilder = Widget Function(
    BuildContext context, bool selected);

class ElementView {
  final bool selectable;
  final Transform transform;
  final EditorElementBuilder builder;
  final DashboardBuilder dashboardBuilder;

 const ElementView({
    required this.selectable,
    required this.transform,
    required this.builder,
    required this.dashboardBuilder,
  });
}
