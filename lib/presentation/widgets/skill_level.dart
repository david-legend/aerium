import 'package:flutter/material.dart';
import 'package:portfoliosite/core/layout/adaptive.dart';
import 'package:portfoliosite/presentation/widgets/skill_progress_painter.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/values/values.dart';

class SkillLevel extends StatelessWidget {
  SkillLevel({
    @required this.skillLevel,
    @required this.skillName,
    this.width,
    this.circleWidth = Sizes.WIDTH_60,
    this.circleHeight = Sizes.HEIGHT_60,
    this.textStyle,
    this.skillNameTextStyle,
    this.duration = const Duration(milliseconds: 500),
  });

  final double skillLevel;
  final String skillName;
  final double width;
  final double circleWidth;
  final double circleHeight;
  final TextStyle textStyle;
  final TextStyle skillNameTextStyle;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    var actualSkillLevel = skillLevel / 10;
    ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: skillLevel),
            duration: duration,
            child: Container(
              width: circleWidth,
              height: circleHeight,
              child: Center(
                child: Text(
                  actualSkillLevel.toString(),
                  style: theme.textTheme.subtitle1.copyWith(
                        color: AppColors.accentColor2,
                      ) ??
                      textStyle,
                ),
              ),
            ),
            builder: (
              BuildContext context,
              double value,
              Widget child,
            ) {
              return CustomPaint(
                foregroundPainter: SkillProgressPainter(
                  currentProgress: value,
                  circleColor: AppColors.accentColor,
                ),
                child: AnimatedOpacity(
                  opacity: value / 100,
                  duration: duration,
                  child: child,
                ),
              );
            },
          ),
          SpaceW8(),
          Text(
            skillName,
            style: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.accentColor2,
                ) ??
                skillNameTextStyle,
          ),
        ],
      ),
    );
  }
}
