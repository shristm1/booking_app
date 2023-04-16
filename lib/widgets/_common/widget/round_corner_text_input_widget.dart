import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class RoundCornerTextInputWidget extends StatelessWidget {
  const RoundCornerTextInputWidget(
      {Key? key,
      this.onChange,
        this.maxLines = 1,
        this.height = 48,
      this.hintText,
      this.inputTextKey, this.keyboardType = TextInputType.text,
      this.controller})
      : super(key: key);

  final ValueChanged<String>? onChange;
  final String? hintText;
  final Key? inputTextKey;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int maxLines;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        // border: Border.all(
        //   color: HexColor("#757575").withOpacity(0.6),
        // ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.iconColor.withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 16, right: 16),
        child: Container(
          height: height,
          child: Center(
            child: TextFormField(
              controller: controller,
              key: inputTextKey,
              maxLines: maxLines,
              keyboardType: keyboardType,
              onChanged: (String txt) {
                if (onChange != null) onChange!(txt);
              },
              style: TextStyle(
                fontSize: 16,
                // color: AppTheme.dark_grey,
              ),
              cursorColor: AppColors.accentColor,
              decoration: new InputDecoration(
                errorText: null,
                border: InputBorder.none,
                hintText: hintText ?? '',
                hintStyle: TextStyle(color: AppColors.iconColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
