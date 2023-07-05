import 'package:flutter/material.dart';

class SlideTransitionPageRoute extends PageRouteBuilder {
  final Widget child;
  final String direction;
  SlideTransitionPageRoute({required this.child, required this.direction})
      : super(
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (contex, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween(
                begin: direction == "left"
                    ? Offset(1.0, 0.0)
                    : direction == "right"
                        ? Offset(-1, 0)
                        : direction == "topright"
                            ? Offset(1, -1)
                            : Offset(0, 1),
                end: direction == "left" ? Offset.zero : Offset.zero)
            .animate(animation),
        child: child,
      );
}

class ScaleTransitionPageRoute extends PageRouteBuilder {
  final Widget child;
  ScaleTransitionPageRoute({required this.child})
      : super(
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (contex, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: child,
      );
}

class FaidinTransitionPageRoute extends PageRouteBuilder {
  final Widget child;
  FaidinTransitionPageRoute({required this.child})
      : super(
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (contex, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      FadeTransition(
        opacity: animation,
        child: child,
      );
}
