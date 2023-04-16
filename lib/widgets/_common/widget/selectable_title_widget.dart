import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class SelectableTitleWidget extends StatelessWidget {
  const SelectableTitleWidget(
      {Key? key,
      required this.title,
      this.isSelected: false,
      this.padding,
      this.onTap,
      this.showRoundedCornerRipple: true,
      this.drawable})
      : super(key: key);
  final String title;
  final bool isSelected;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final bool showRoundedCornerRipple;
  final Icon? drawable;

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 16, top: 16),
      child: Center(
        child: getTitleWidget(),
      ),
    );

    if (drawable != null) {
      Icon icon = Icon(
        drawable!.icon,
        color:
            isSelected ? AppColors.iconColor : AppColors.foreGroundColor,
      );
      child = Column(
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Container(
            width: 40,
            height: 32,
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: getTitleWidget(),
          )
        ],
      );
    }

    return InkWell(
      borderRadius: showRoundedCornerRipple
          ? BorderRadius.all(Radius.circular(32.0))
          : null,
      highlightColor: AppColors.primaryBackgroundColor.withOpacity(0),
      splashColor: AppColors.primaryBackgroundColor.withOpacity(0.2),
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: child,
    );
  }

  Widget getTitleWidget() => Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isSelected
                ? AppColors.primaryTextColor
                : AppColors.secondaryTextColor),
      );
}
