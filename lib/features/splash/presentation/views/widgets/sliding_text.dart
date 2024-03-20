import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required Animation<Offset> offsetAnimation,
  }) : _offsetAnimation = offsetAnimation;

  final Animation<Offset> _offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Text(
        'Read books for free',
        textAlign: TextAlign.center,
      ),
    );
  }
}
