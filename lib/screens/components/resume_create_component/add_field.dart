import 'package:cv_maker/screens/home_ui/home_scr.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:flutter/material.dart';

SizedBox addField(
    {required bool addWidth,
    required String hintText,
    double? height,
    int? maxLine,
    double? radius,
    required TextEditingController controller,
    TextInputType? inputType}) {
  return SizedBox(
    width: addWidth ? width / 1.8 : width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            hintText,
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: height ?? 50,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(radius ?? 40),
          ),
          child: SizedBox(
            height: height ?? 40,
            child: TextFormField(
              keyboardType: inputType ?? TextInputType.multiline,
              controller: controller,
              textInputAction: TextInputAction.done,
              style: const TextStyle(color: Colors.black),
              maxLines: maxLine ?? 1,
              minLines: 1,
              cursorColor: primaryDark,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                hintText: 'Your $hintText',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
