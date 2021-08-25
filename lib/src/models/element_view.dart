
import 'package:flutter/material.dart' hide Transform;

import 'dashboard.dart';

typedef EditorElementBuilder<T> = Widget Function(
    BuildContext context, T model, bool selected);

class ElementView<T> {
  final bool selectable;
  final EditorElementBuilder<T> builder;
  final DashboardBuilder dashboardBuilder;

 const ElementView({
    required this.selectable,
    required this.builder,
    required this.dashboardBuilder,
  });
}
