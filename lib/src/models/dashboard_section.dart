import 'package:flutter/material.dart';

import 'dashboard_section_tile.dart';

class DashboardSection {
  final String name;
  final ValueChanged<bool>? onDisabled;
  final List<SectionTile> tiles;

  const DashboardSection({
    required this.name,
    required this.onDisabled,
    required this.tiles,
  });
}
