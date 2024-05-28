import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedDotsIndicator extends StatefulWidget {
  const AnimatedDotsIndicator({
    super.key,
    required this.dotsCount,
    required this.position,
    required this.activeColor,
    required this.inActiveColor,
    required this.activeDuration,
    this.height,
  });

  final int dotsCount;
  final int position;
  final Color activeColor;
  final Color inActiveColor;
  final Duration activeDuration;
  final double? height;

  @override
  State<AnimatedDotsIndicator> createState() => _AnimatedDotsIndicatorState();
}

class _AnimatedDotsIndicatorState extends State<AnimatedDotsIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.activeDuration,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedDotsIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.position != oldWidget.position) {
      // Animate when the position changes
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.dotsCount, (index) {
        final isActive = index == widget.position;
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final activeWidth = lerpDouble(2, 36, _animation.value);
            if (isActive) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 36.w,
                      height: widget.height ?? 9.h,
                      decoration: BoxDecoration(
                        color: widget.inActiveColor,
                      ),
                    ),
                    Container(
                      width: activeWidth,
                      height: widget.height ?? 9.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: widget.activeColor,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              width: 10,
              margin: EdgeInsets.only(
                right: index == 0 ? 4.w : (index < widget.position ? 4.w : 0),
                left: index == widget.dotsCount - 1 ? 4.w : (index > widget.position ? 4.w : 0),
              ),
              height: widget.height ?? 9.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.inActiveColor,
              ),
            );
          },
        );
      }),
    );
  }
}