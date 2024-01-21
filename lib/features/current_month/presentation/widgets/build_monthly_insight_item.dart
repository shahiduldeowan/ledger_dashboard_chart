import 'package:flutter/material.dart';

import '../../../../core/utility/price_format_service.dart';
import '../../domain/entity/current_month_entity.dart';

class BuildMonthlyInsightItem extends StatelessWidget {
  const BuildMonthlyInsightItem({super.key, required this.item});

  final LedgerCurrentMonthEntity item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.departmentName ?? 'N/A'),
      trailing: Chip(
        label: Text((item.bill ?? 0.0).toFormatOfPrice),
        avatar: Text(item.getCreditDebitFlag),
      ),
    );
  }
}
