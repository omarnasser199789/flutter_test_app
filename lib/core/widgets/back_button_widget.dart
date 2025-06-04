import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../util/assets_manager.dart';

// Back button wrapped with SafeArea
class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                color: Colors.transparent,
                child: SvgPicture.asset(ImgAssets.vector),
              ),
            ),
          ),
        ],
      ),
    );
  }
}