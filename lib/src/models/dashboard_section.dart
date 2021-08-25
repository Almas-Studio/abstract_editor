import 'package:flutter/material.dart';

import 'dashboard_section_tile.dart';

class DashboardSection<T> {
  final String name;
  final ValueChanged<bool>? onDisabled;
  final List<SectionTile<T>> tiles;

  const DashboardSection({
    required this.name,
    required this.tiles,
    this.onDisabled,
  });
}
