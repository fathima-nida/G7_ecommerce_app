import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';

class DotsIndicator extends StatefulWidget {
  final int itemCount;
  final PageController controller;
  final Color activeColor;
  final Color inactiveColor;
  final double activeSize;
  final double inactiveSize;

  const DotsIndicator({
    super.key,
    required this.itemCount,
    required this.controller,
    this.activeColor = AppColors.pink,
    this.inactiveColor =AppColors.lightpink,
    this.activeSize = 9,
    this.inactiveSize = 5,
  });

  @override
  State<DotsIndicator> createState() => _DotsIndicatorState();
}

class _DotsIndicatorState extends State<DotsIndicator> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      int next = widget.controller.page!.round();
      if (currentIndex != next) {
        setState(() {
          currentIndex = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(widget.itemCount, (index) {
        bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? widget.activeSize : widget.inactiveSize,
          height: isActive ? widget.activeSize : widget.inactiveSize,
          decoration: BoxDecoration(
            color: isActive ? widget.activeColor : widget.inactiveColor,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
