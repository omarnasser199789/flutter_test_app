import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: _cardColor,
      padding: const EdgeInsets.all(8),
      child:  Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 16,
              // color: _textSecondary,
            ),
            SizedBox(width: 8),
            Text(
              'Leads details',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );;
  }
}
