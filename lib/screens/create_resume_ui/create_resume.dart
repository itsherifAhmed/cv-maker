import 'dart:io';

import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/screens/components/resume_create_component/add_field.dart';
import 'package:cv_maker/screens/components/resume_create_component/app_bar.dart';
import 'package:cv_maker/screens/components/resume_create_component/bottom_bar.dart';
import 'package:cv_maker/screens/components/resume_create_component/tab_list.dart';
import 'package:cv_maker/util/classes.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateResume extends StatefulWidget {
  const CreateResume({super.key});

  @override
  State<CreateResume> createState() => _CreateResumeState();
}

int selIndex = 0;
int genderValue = 0;
File? imgPath;
ResumeData resumeData = ResumeData();

class _CreateResumeState extends State<CreateResume> {
  late double height, width;
  void _update(int newValue) {
    setState(() => selIndex = newValue);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return primaryDark;
        }

        return null;
      },
    );

    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return primaryDark.withOpacity(0.54);
        }

        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }

        return null;
      },
    );
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: primaryBgColor,
      ),
      body: Column(
        children: [
          //CUSTOM APP BAR
          const TopBar(),

          //ALL FIELD/TAB LIST
          TabList(
            height: height,
            width: width,
            currentIndex: selIndex,
            update: _update,
          ),

          const SizedBox(
            height: 14,
          ),

          //INDEX WISE SCREENS
          Expanded(
            child: SizedBox(
              child: IndexedStack(
                index: selIndex,
                children: [
                  //PERSONAL
                  personalBox(),
                  //CONTACT
                  contactBox(trackColor, overlayColor),
                  //Language
                  languageBox(),
                  //Expertise
                  experticeBox(),
                  //Experience
                  experienceBox(),
                  //Education
                  educationBox(),
                  //Skills
                  skillBox(),
                ],
              ),
            ),
          ),

          //BOTTOM BAR
          BottomBar(
            width: width,
            currentIndex: selIndex,
            update: _update,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView skillBox() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              ...List.generate(
                resumeData.skillControllerList.length,
                (index) => Container(
                  width: width,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      addField(
                        addWidth: false,
                        hintText: 'Skill name',
                        radius: 14,
                        controller: resumeData.skillControllerList[index]
                            ['skill'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      addField(
                        addWidth: false,
                        hintText: 'Percentage in skill',
                        radius: 14,
                        inputType: TextInputType.number,
                        controller: resumeData.skillControllerList[index]
                            ['percentage'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          size: 24,
                          Icons.delete,
                          color: primaryDark,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              resumeData.skillControllerList.removeAt(index);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    TextEditingController txtSkill =
                        TextEditingController(text: 'Communication');
                    TextEditingController txtPercentage =
                        TextEditingController(text: '90');

                    Map map = {
                      'skill': txtSkill,
                      'percentage': txtPercentage,
                    };

                    resumeData.skillControllerList.add(map);
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryDark,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Skill',
                        style: normalText(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView educationBox() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              ...List.generate(
                resumeData.educationControllerList.length,
                (index) => Container(
                  width: width,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      addField(
                        addWidth: false,
                        hintText: 'University name',
                        radius: 14,
                        controller: resumeData.educationControllerList[index]
                            ['university'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      addField(
                        addWidth: false,
                        hintText: 'Degree / Course name',
                        radius: 14,
                        controller: resumeData.educationControllerList[index]
                            ['degree'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      addField(
                        addWidth: false,
                        hintText: 'Staring - Ending year',
                        radius: 14,
                        controller: resumeData.educationControllerList[index]
                            ['year'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          size: 24,
                          Icons.delete,
                          color: primaryDark,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              resumeData.educationControllerList
                                  .removeAt(index);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    TextEditingController txtUniversity =
                        TextEditingController(text: 'Borcelle University');
                    TextEditingController txtDegree = TextEditingController(
                        text: 'Bachelore of Business Management');
                    TextEditingController txtYear =
                        TextEditingController(text: '2014-2018');

                    Map map = {
                      'university': txtUniversity,
                      'degree': txtDegree,
                      'year': txtYear,
                    };

                    resumeData.educationControllerList.add(map);
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryDark,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Education',
                        style: normalText(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView experienceBox() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              ...List.generate(
                resumeData.experienceControllerList.length,
                (index) => Container(
                  width: width,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      addField(
                        addWidth: false,
                        hintText: 'Company / organization',
                        radius: 14,
                        controller: resumeData.experienceControllerList[index]
                            ['company'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      addField(
                        addWidth: false,
                        hintText: 'Located At',
                        radius: 14,
                        controller: resumeData.experienceControllerList[index]
                            ['location'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      addField(
                        addWidth: false,
                        hintText: 'Staring - Ending year',
                        radius: 14,
                        controller: resumeData.experienceControllerList[index]
                            ['year'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      addField(
                        addWidth: false,
                        hintText: 'About Experience',
                        radius: 14,
                        height: 150,
                        maxLine: 5,
                        controller: resumeData.experienceControllerList[index]
                            ['about'],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          size: 24,
                          Icons.delete,
                          color: primaryDark,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              resumeData.experienceControllerList
                                  .removeAt(index);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    TextEditingController txtCompany =
                        TextEditingController(text: 'Studio Shawde');
                    TextEditingController txtLocation =
                        TextEditingController(text: 'Camberra - Australia');
                    TextEditingController txtYear =
                        TextEditingController(text: '2020-2022');
                    TextEditingController txtAbout = TextEditingController(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet quam rhoncus, egestas dui eget, malesuada justo. Ut aliquam augue.');
                    Map map = {
                      'company': txtCompany,
                      'location': txtLocation,
                      'year': txtYear,
                      'about': txtAbout,
                    };

                    resumeData.experienceControllerList.add(map);
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryDark,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Experience',
                        style: normalText(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding experticeBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ...List.generate(
                resumeData.expertiseControllerList.length,
                (index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: addField(
                        addWidth: false,
                        hintText: '',
                        controller: resumeData.expertiseControllerList[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          size: 24,
                          Icons.delete,
                          color: primaryDark,
                        ),
                        onPressed: () {
                          resumeData.expertiseControllerList.removeAt(index);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    TextEditingController textField =
                        TextEditingController(text: 'Managment Skill');
                    resumeData.expertiseControllerList.add(textField);
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryDark,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Expertise',
                        style: normalText(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding languageBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ...List.generate(
                resumeData.languageControllerList.length,
                (index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: addField(
                        addWidth: false,
                        hintText: 'Language',
                        controller: resumeData.languageControllerList[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          size: 24,
                          Icons.delete,
                          color: primaryDark,
                        ),
                        onPressed: () {
                          resumeData.languageControllerList.removeAt(index);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    TextEditingController textField =
                        TextEditingController(text: 'English');
                    resumeData.languageControllerList.add(textField);
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryDark,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Language',
                        style: normalText(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding contactBox(MaterialStateProperty<Color?> trackColor,
      MaterialStateProperty<Color?> overlayColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              addContactField(
                  controller: resumeData.txtMobile,
                  hintText: 'Mobile No.',
                  img: 'call',
                  inputType: TextInputType.number),
              const SizedBox(
                height: 16,
              ),
              addContactField(
                  controller: resumeData.txtEmail,
                  hintText: 'Email id',
                  img: 'mail',
                  inputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              addContactField(
                controller: resumeData.txtAddress,
                hintText: 'Address',
                img: 'home',
                inputType: TextInputType.streetAddress,
                height: 140,
                radius: 24,
              ),
              const SizedBox(
                height: 16,
              ),
              addContactField(
                controller: resumeData.txtGithub,
                hintText: 'Github id / Link',
                img: 'github',
                inputType: TextInputType.url,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Show Github : ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Switch(
                    trackColor: trackColor,
                    overlayColor: overlayColor,
                    value: resumeData.showGithub!,
                    onChanged: (value) {
                      setState(() {
                        resumeData.showGithub = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  addContactField(
      {required String img,
      required String hintText,
      required TextEditingController controller,
      TextInputType? inputType,
      double? height,
      double? radius}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: CircleAvatar(
            backgroundColor: primaryDark,
            child: Image.asset(
              'asset/images/resume/$img.png',
              height: 22,
              width: 22,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: addField(
            inputType: inputType ?? TextInputType.multiline,
            addWidth: true,
            hintText: hintText,
            controller: controller,
            height: height,
            radius: radius,
          ),
        ),
      ],
    );
  }

  //Personal Box
  Padding personalBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setImage();
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  backgroundImage: (imgPath != null)
                                      ? FileImage(imgPath!)
                                      : null,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 10,
                                          ),
                                        ]),
                                    child: CircleAvatar(
                                      backgroundColor: primaryDark,
                                      child: Image.asset(
                                        'asset/images/resume/pencil.png',
                                        height: 14,
                                        width: 14,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          addField(
                              addWidth: true,
                              hintText: 'First Name',
                              controller: resumeData.txtFirstName),
                          const SizedBox(
                            height: 10,
                          ),
                          addField(
                              addWidth: true,
                              hintText: 'Last Name',
                              controller: resumeData.txtLastName),
                        ],
                      ),
                    ],
                  ),
                ),
                addField(
                    addWidth: false,
                    hintText: 'Profession',
                    controller: resumeData.txtProfession),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Select Gender',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          fillColor: MaterialStatePropertyAll(primaryDark),
                          value: 0,
                          groupValue: genderValue,
                          onChanged: (value) {
                            setState(() {
                              genderValue = value!;
                            });
                          },
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          fillColor: MaterialStatePropertyAll(primaryDark),
                          value: 1,
                          groupValue: genderValue,
                          onChanged: (value) {
                            setState(() {
                              genderValue = value!;
                            });
                          },
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                addField(
                    addWidth: false,
                    hintText: 'Objective',
                    height: 150,
                    maxLine: 5,
                    radius: 24,
                    controller: resumeData.txtObjective),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Suggestions (You can select one)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                addSuggestionRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addSuggestionRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          objectives.length,
          (index) => objectiveSuggestion(index),
        ),
      ),
    );
  }

  objectiveSuggestion(int index) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        resumeData.txtObjective =
            TextEditingController(text: objectives[index]);
        setState(() {});
      },
      child: Container(
        height: 140,
        width: width / 1.2,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          softWrap: true,
          textAlign: TextAlign.center,
          objectives[index],
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  setImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? img = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgPath = File(img!.path);
    });
  }
}
