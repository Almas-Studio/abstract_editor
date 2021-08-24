import 'package:flutter/cupertino.dart';

import 'dashboard_section.dart';

typedef DashboardBuilder<T> = Dashboard Function(BuildContext context, T data);

class Dashboard {

  final List<DashboardSection> sections;

  const Dashboard({required this.sections});

}