import 'package:flutter/material.dart';

typedef DashboardTapCallback<T> = void Function(BuildContext context, T model);

class SectionTile<T> {
  final Widget? icon;
  final String title;
  final Widget? trailing;
  final DashboardTapCallback<T>? onTap;

  const SectionTile({
    required this.title,
    this.trailing,
    this.icon,
    this.onTap,
  });
}
