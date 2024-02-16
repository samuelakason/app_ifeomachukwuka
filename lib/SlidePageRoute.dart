// SlidePageRoute.dart
import 'package:flutter/material.dart';

enum SlideDirection {
  leftToRight,
  rightToLeft,
}

class SlidePageRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  final SlideDirection slideDirection;

  SlidePageRoute({
    required this.enterPage,
    required this.exitPage,
    required this.slideDirection,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => enterPage,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            var tween = Tween(
                    begin: slideDirection == SlideDirection.leftToRight
                        ? begin
                        : -begin,
                    end: end)
                .chain(CurveTween(curve: Curves.easeInOut));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 500),
          reverseTransitionDuration: Duration(milliseconds: 500),
          maintainState: true,
          fullscreenDialog: false,
        );
}
