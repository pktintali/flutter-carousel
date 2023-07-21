import 'package:flutter/material.dart';

/// Dot indicator that can be used to indicate some form of progress.
class DotIndicator extends StatelessWidget {
  /// Create a new [DotIndicator].
  const DotIndicator({
    Key? key,
    required this.numberOfDots,
    required this.activeDotIndex,
    this.color,
    this.dotSize = 6.0,
  })  : assert(activeDotIndex < numberOfDots),
        super(key: key);

  /// The number of dots in the indicator.
  final int numberOfDots;

  /// The index of the dot that is active.
  final int activeDotIndex;

  /// The color of the dots (optional).
  final Color? color;

  ///The size of the dots (optional).
  ///
  ///Defaults to 6.0
  final double dotSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        numberOfDots,
        (index) => _DotIndicatorCircle(
          isActive: index == activeDotIndex,
          color: color,
          dotSize: dotSize,
        ),
      ),
    );
  }
}

/// A single dot of a dot indicator.
///
/// Dots can be active. Active dots have an opacity of 1, inactive dots have an
/// opacity of 0.3.
class _DotIndicatorCircle extends StatelessWidget {
  /// Create a new [_DotIndicatorCircle].
  const _DotIndicatorCircle({
    Key? key,
    required this.isActive,
    required this.color,
    required this.dotSize,
  }) : super(key: key);

  /// Whether this indicator is active, changing its appearance.
  final bool isActive;

  /// The color of the dot (optional).
  final Color? color;

  ///The size of the dots.
  ///
  ///Defaults to 6.0
  final double dotSize;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive ? 1 : .3,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: dotSize * 0.5),
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(dotSize / 2)),
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
