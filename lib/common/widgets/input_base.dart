import 'package:flutter/material.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/config_app.dart';

class InputBase extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool isRow;
  final Widget? elementRow;
  const InputBase(
      {Key? key,
      required this.hintText,
      required this.textEditingController,
      this.elementRow,
      this.isRow = false,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.size0),
      borderSide: const BorderSide(color: AppColors.transparent),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom(text: hintText),
        const SizedBox(height: AppSize.size5),
        Container(
          width: AppSize.sizeWidthApp,
          child: Row(
            children: [
              if (isRow) elementRow!,
              Expanded(
                child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: AppSize.size12,
                      horizontal: AppSize.size15,
                    ),
                    border: border,
                    focusedBorder: border,
                  ),
                  validator: validator,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size20),
      ],
    );
  }
}
