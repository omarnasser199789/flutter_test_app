import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Theme/style.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize,
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.loading,
  });

  final double? width;
  final double? height;
  final String text;
  final  Function () onTap;
  final Color ?color;
  final Color ?textColor;
  final double ?textSize;
  final double ? topPadding;
  final double ? leftPadding;
  final double ? rightPadding;
  final double ? bottomPadding;
  final bool?  loading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return (widget.loading== null || widget.loading==false)?GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height??50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.5),
              Theme.of(context).primaryColor.withOpacity(0.3),
            ],
            stops: const [0.5, 0.7],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(kBorderRadius), // optional: rounded corners
        ),


        child: Padding(
          padding:  EdgeInsets.only(
              top:widget.topPadding??0,
              bottom: widget.bottomPadding??0,
            left: widget.leftPadding??0,
            right: widget.rightPadding??0
          ),
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black)
          ),
        ),
      ),
    ):Stack(
      alignment: Alignment.center,
      children: [
        Shimmer.fromColors(
            baseColor: Theme.of(context).primaryColor,
            highlightColor: Colors.white,
            child:Container(decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(kBorderRadius)),
          height: 50,
        )),
        Text(
          "Loading...",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black)        )
      ],
    );
  }
}