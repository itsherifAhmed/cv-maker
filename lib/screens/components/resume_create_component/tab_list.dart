import 'package:cv_maker/screens/create_resume_ui/create_resume.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/lists/ui_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabList extends StatelessWidget {
  const TabList({
    super.key,
    required this.height,
    required this.width,
    required this.currentIndex,
    required this.update,
  });

  final int currentIndex;
  final double height;
  final double width;
  final ValueChanged<int> update;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            List.generate(tabList.length, (index) => addList(index: index)),
      ),
    );
  }

  Row addList({required int index}) {
    return Row(
      children: [
        index != 0
            ? Container(
                height: 1,
                width: 10,
                color: Colors.grey,
              )
            : const SizedBox(
                width: 10,
              ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => update(index),
          child: Container(
            padding:
                EdgeInsets.symmetric(vertical: height / 80, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: selIndex == index ? primaryDark : Colors.grey.shade400,
                width: 1.5,
              ),
            ),
            child: Text(
              tabList[index],
              style: TextStyle(
                fontSize: 16,
                color: selIndex == index ? primaryDark : Colors.grey.shade400,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        index == tabList.length - 1
            ? const SizedBox(
                width: 10,
              )
            : const SizedBox()
      ],
    );
  }
}
