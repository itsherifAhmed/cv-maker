import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/screens/components/resume_create_component/bottom_bar.dart';
import 'package:cv_maker/screens/create_resume_ui/create_resume.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 2,
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            selIndex = 0;
            clearField();
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        // Text(
        //   'Details',
        //   style: textStyle(),
        // ),
        Expanded(
          child: SizedBox(
            child: TextField(
              controller: resumeData.txtTitle,
              style: textStyle(color: Colors.grey),
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: const InputDecoration(
                suffix: Icon(
                  Icons.edit,
                  size: 19,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          height: 50,
          width: 130,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 36,
                  width: 110,
                  child: CupertinoButton(
                    pressedOpacity: 1,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    color: primaryDark,
                    child: Text(
                      'Premium',
                      style: miniText(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  '✨',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

void clearField() {
  resumeData.languageControllerList.clear();
  resumeData.educationControllerList.clear();
  resumeData.expertiseControllerList.clear();
  resumeData.experienceControllerList.clear();
  resumeData.skillControllerList.clear();
  resumeData.txtGithub.clear();
  resumeData.txtFirstName.clear();
  resumeData.txtLastName.clear();
  resumeData.txtProfession.clear();
  resumeData.txtObjective.clear();
  resumeData.txtMobile.clear();
  resumeData.txtEmail.clear();
  resumeData.txtAddress.clear();
  resumeData.txtGithub.clear();
  resumeData.txtTitle = TextEditingController(text: 'Untitled');
  genderValue = 0;
  resumeData.img = null;
  isAdded = false;
  isSaved = false;
  resumeData.showGithub = true;
  imgPath = null;
}
