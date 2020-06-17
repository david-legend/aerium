import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfoliosite/presentation/widgets/skill_level.dart';
import 'package:portfoliosite/presentation/widgets/spaces.dart';
import 'package:portfoliosite/presentation/widgets/sub_menu_item.dart';
import 'package:portfoliosite/values/values.dart';
import 'package:portfoliosite/core/extensions/hover_extensions.dart';

import 'experience_tree.dart';

class SubMenuList extends StatefulWidget {
  SubMenuList({
    @required this.subMenuData,
    this.spacing = Sizes.SIZE_8,
    this.runSpacing = Sizes.SIZE_8,
    this.width,
  });

  final List<SubMenuData> subMenuData;
  final double spacing;
  final double runSpacing;
  final double width;

  @override
  _SubMenuListState createState() => _SubMenuListState();
}

class _SubMenuListState extends State<SubMenuList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> menuAnimation;
  Animation<double> contentAnimation;
  bool _isSkillsVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    initTweens();
    _playAnimation();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            _isSkillsVisible = true;
          });
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {}
  }

  initTweens() {
    menuAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );
    contentAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedOpacity(
            opacity: menuAnimation.value,
            duration: _controller.duration,
            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ..._buildSubMenuList(widget.subMenuData),
              ],
            ),
          ),
          SpaceH16(),
          _isSkillsVisible ? _buildContent(widget.subMenuData) : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildAnimation,
    );
  }

  List<Widget> _buildSubMenuList(List<SubMenuData> menuData) {
    List<Widget> menuList = [];
    for (var index = 0; index < menuData.length; index++) {
      menuList.add(
        InkWell(
          onTap: () {
            _onMenuChange(index);
          },
          child: SubMenuItem(
            title: menuData[index].title,
            isSelected: menuData[index].isSelected,
            thickness: 3,
            color: AppColors.deepBlue800,
          ),
        ).showCursorOnHover,
      );
      menuList.add(SpaceW24());
    }
    return menuList;
  }

  Widget _buildContent(List<SubMenuData> menuData) {
    ThemeData theme = Theme.of(context);
    for (var index = 0; index < menuData.length; index++) {
      if (menuData[index].isSelected) {
        if (menuData[index].isAnimation) {
          return _buildSkillsSection(skills: menuData[index].skillData);
        } else {
          return Text(
            menuData[index].content,
            style: theme.textTheme.bodyText2.copyWith(
              color: AppColors.black,
              fontSize: Sizes.TEXT_SIZE_16,
            ),
          );
        }
      }
    }
    return Container();
  }

  _onMenuChange(int index) {
    setState(() {
      widget.subMenuData.forEach((element) => element.isSelected = false);
      widget.subMenuData[index].isSelected = true;
    });
  }

  Widget _buildSkillsSection({@required List<SkillData> skills}) {
    List<Widget> skillWidgets = [];
    for (var index = 0; index < skills.length; index++) {
      skillWidgets.add(
        SkillLevel(
          width: widget.width / 3.7,
          skillLevel: skills[index].skillLevel,
          skillName: skills[index].skillName,
        ),
      );
    }
    return Wrap(
//      spacing: 8,
      runSpacing: 8,
      children: [
        ...skillWidgets,
      ],
    );
  }
}
