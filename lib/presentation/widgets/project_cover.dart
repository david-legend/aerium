import 'package:flutter/material.dart';
import 'package:portfoliosite/values/values.dart';

class ProjectCover extends StatelessWidget {
  ProjectCover({
    this.width,
    this.height,
    this.offset,
    this.projectCoverUrl,
    this.projectCoverBackgroundColor,
  });

  final double width;
  final double height;
  final double offset;
  final String projectCoverUrl;
  final Color projectCoverBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: offset,
            right: offset,
            child: Container(
              width: width - offset,
              height: height -offset,
              color: AppColors.deepBlue300,
            ),
          ),
          Positioned(
            left: offset,
            bottom: offset,
            child: Image.asset(
              projectCoverUrl,
              width: width - offset,
              height: height -offset,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
