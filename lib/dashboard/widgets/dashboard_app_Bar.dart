import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/util/assets_manager.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});
  static const Color _textPrimary = Color(0xFF111827);
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 250, 250, 1),
                    borderRadius: BorderRadius.circular(size.width)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: _textPrimary),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                ),

                const SizedBox(width: 8,),
                Text(
                  'AllPro',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),

            Row(
              children: [
                SvgPicture.asset(ImgAssets.notificationCenter),
                const SizedBox(width: 10,),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color.fromRGBO(220, 218, 240, 1),
                  child: Text(
                      'MA',
                      style: Theme.of(context).textTheme.bodySmall
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
