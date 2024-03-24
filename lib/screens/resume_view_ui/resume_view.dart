import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/screens/components/resume_create_component/app_bar.dart';
import 'package:cv_maker/screens/components/resume_view_components/about_me.dart';
import 'package:cv_maker/screens/components/resume_view_components/contact_info.dart';
import 'package:cv_maker/screens/components/resume_view_components/education_info.dart';
import 'package:cv_maker/screens/components/resume_view_components/experience_box.dart';
import 'package:cv_maker/screens/components/resume_view_components/expertise_box.dart';
import 'package:cv_maker/screens/components/resume_view_components/language_box.dart';
import 'package:cv_maker/screens/components/resume_view_components/profile_name_banner.dart';
import 'package:cv_maker/screens/components/resume_view_components/skill_info.dart';
import 'package:cv_maker/screens/create_resume_ui/create_resume.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as vz;
import 'package:printing/printing.dart';

class ResumeView extends StatefulWidget {
  const ResumeView({super.key});

  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView> {
  late double height, width;
  PdfColor primary = PdfColor.fromHex('#27384d');
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        shadowColor: Colors.grey.withOpacity(0.4),
        backgroundColor: primaryBgColor,
        title: Text(
          'Preview',
          style: textStyle(),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            selIndex = 0;
            clearField();
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              // final image = await imageFromAssetBundle(
              //     'asset/images/resume/profile.jpeg');
              final call =
                  await imageFromAssetBundle('asset/images/resume/call.png');
              final mail =
                  await imageFromAssetBundle('asset/images/resume/mail.png');
              final home =
                  await imageFromAssetBundle('asset/images/resume/home.png');
              final github =
                  await imageFromAssetBundle('asset/images/resume/github.png');

              final pdf = vz.Document();

              final imageBytes = vz.MemoryImage(users[currentUser]['data']
                      [currentObj]
                  .img!
                  .readAsBytesSync());

              pdf.addPage(
                vz.Page(
                  pageFormat: PdfPageFormat.a4,
                  build: (context) {
                    return vz.Column(
                      children: [
                        vz.Container(
                          child: vz.Row(
                            children: [
                              vz.SizedBox(
                                height: 120,
                                width: 120,
                                child: vz.Stack(
                                  children: [
                                    vz.Align(
                                      alignment: vz.Alignment.topLeft,
                                      child: vz.Container(
                                        height: 90,
                                        width: 90,
                                        color: primary,
                                      ),
                                    ),
                                    vz.Align(
                                      alignment: vz.Alignment.bottomRight,
                                      child: vz.Container(
                                        alignment: vz.Alignment.center,
                                        height: 100,
                                        width: 100,
                                        decoration: const vz.BoxDecoration(
                                          shape: vz.BoxShape.circle,
                                          color: PdfColors.white,
                                        ),
                                        child: vz.Container(
                                          height: 90,
                                          width: 90,
                                          decoration: vz.BoxDecoration(
                                            color: primary,
                                            shape: vz.BoxShape.circle,
                                          ),
                                          alignment: vz.Alignment.center,
                                          child: vz.ClipOval(
                                            child: vz.Image(
                                              imageBytes,
                                              height: 80,
                                              width: 80,
                                              fit: vz.BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              vz.Expanded(
                                child: vz.Column(
                                  crossAxisAlignment:
                                      vz.CrossAxisAlignment.start,
                                  children: [
                                    vz.Text(
                                      '${users[currentUser]['data'][currentObj].firstName}\n   ${users[currentUser]['data'][currentObj].lastName}',
                                      style: vz.TextStyle(
                                        fontSize: 21,
                                        fontWeight: vz.FontWeight.bold,
                                        color: primary,
                                      ),
                                    ),
                                    vz.Center(
                                      child: vz.Text(
                                        '${users[currentUser]['data'][currentObj].profession}',
                                        style: const vz.TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              vz.Container(
                                height: 70,
                                width: 40,
                                margin: const vz.EdgeInsets.only(bottom: 70),
                                decoration: const vz.BoxDecoration(
                                  color: PdfColors.grey100,
                                  borderRadius: vz.BorderRadius.only(
                                    bottomLeft: vz.Radius.circular(35),
                                    topLeft: vz.Radius.circular(35),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        vz.Expanded(
                          child: vz.Stack(
                            children: [
                              vz.Stack(
                                children: [
                                  vz.Row(
                                    children: [
                                      vz.Expanded(
                                        flex: 3,
                                        child: vz.Container(
                                          child: vz.Padding(
                                            padding:
                                                const vz.EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                            child: vz.Stack(
                                              children: [
                                                vz.Column(
                                                  children: [
                                                    //About us Box
                                                    vz.Column(
                                                      children: [
                                                        vz.Text(
                                                          'About Me',
                                                          style:
                                                              pdfTextHeading(),
                                                        ),
                                                        vz.Divider(
                                                          color: primary,
                                                          indent: 50,
                                                          endIndent: 50,
                                                        ),
                                                        vz.Text(
                                                          textAlign: vz
                                                              .TextAlign.center,
                                                          softWrap: true,
                                                          '${users[currentUser]['data'][currentObj].objective}',
                                                          style: pdfTextBody(),
                                                        ),
                                                      ],
                                                    ),
                                                    //CONTACT BOX
                                                    vz.Padding(
                                                      padding: const vz
                                                          .EdgeInsets.symmetric(
                                                          vertical: 8.0),
                                                      child: vz.Column(
                                                        children: [
                                                          vz.Text(
                                                            'Contact',
                                                            style:
                                                                pdfTextBody(),
                                                          ),
                                                          vz.Divider(
                                                            color: primary,
                                                            indent: 60,
                                                            endIndent: 60,
                                                          ),
                                                          contactList(
                                                              contact:
                                                                  '${users[currentUser]['data'][currentObj].contact[0]}',
                                                              img: call),
                                                          contactList(
                                                              contact:
                                                                  '${users[currentUser]['data'][currentObj].contact[1]}',
                                                              img: mail),
                                                          contactList(
                                                              contact:
                                                                  '${users[currentUser]['data'][currentObj].contact[2]}',
                                                              img: home),
                                                          contactList(
                                                              contact:
                                                                  '${users[currentUser]['data'][currentObj].contact[3]}',
                                                              img: github),
                                                        ],
                                                      ),
                                                    ),

                                                    //LANGUAGE BOX
                                                    vz.Column(
                                                      crossAxisAlignment: vz
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        vz.Container(
                                                          width: width,
                                                          alignment: vz
                                                              .Alignment.center,
                                                          padding: const vz
                                                              .EdgeInsets.all(
                                                              2),
                                                          color: primary,
                                                          child: vz.FittedBox(
                                                            child: vz.Text(
                                                              'LANGUAGE',
                                                              style: const vz
                                                                  .TextStyle(
                                                                fontSize: 8,
                                                                color: PdfColors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        vz.Padding(
                                                          padding: const vz
                                                              .EdgeInsets.only(
                                                            left: 16.0,
                                                            top: 6,
                                                            bottom: 10,
                                                          ),
                                                          child: vz.Column(
                                                            crossAxisAlignment: vz
                                                                .CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              ...List.generate(
                                                                users[currentUser]
                                                                            [
                                                                            'data']
                                                                        [
                                                                        currentObj]
                                                                    .languages
                                                                    .length,
                                                                (index) => languageList(
                                                                    language: users[currentUser]['data']
                                                                            [
                                                                            currentObj]
                                                                        .languages[index]),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    //EXPERTISE BOX
                                                    vz.Column(
                                                      crossAxisAlignment: vz
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        vz.Container(
                                                          width: width,
                                                          alignment: vz
                                                              .Alignment.center,
                                                          padding: const vz
                                                              .EdgeInsets.all(
                                                              2),
                                                          color: primary,
                                                          child: vz.FittedBox(
                                                            child: vz.Text(
                                                                'EXPERTISE',
                                                                style: const vz
                                                                    .TextStyle(
                                                                    fontSize: 8,
                                                                    color: PdfColors
                                                                        .white)),
                                                          ),
                                                        ),
                                                        vz.Padding(
                                                          padding: const vz
                                                              .EdgeInsets.only(
                                                            left: 16.0,
                                                            top: 6,
                                                            bottom: 5,
                                                          ),
                                                          child: vz.Column(
                                                            crossAxisAlignment: vz
                                                                .CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              ...List.generate(
                                                                users[currentUser]
                                                                            [
                                                                            'data']
                                                                        [
                                                                        currentObj]
                                                                    .expertise
                                                                    .length,
                                                                (index) => addname(
                                                                    name: users[currentUser]['data']
                                                                            [
                                                                            currentObj]
                                                                        .expertise[index]),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      vz.Expanded(
                                        flex: 4,
                                        child: vz.Container(
                                          child: vz.Padding(
                                            padding: const vz.EdgeInsets.only(
                                                left: 8.0, right: 6),
                                            child: vz.Column(
                                              children: [
                                                //EXPERIENCE BOX
                                                vz.Column(
                                                  crossAxisAlignment: vz
                                                      .CrossAxisAlignment.start,
                                                  children: [
                                                    vz.Container(
                                                      width: width,
                                                      alignment:
                                                          vz.Alignment.center,
                                                      padding: const vz
                                                          .EdgeInsets.all(2),
                                                      color: primary,
                                                      child: vz.FittedBox(
                                                        child: vz.Text(
                                                          'EXPERIENCE',
                                                          style: const vz
                                                              .TextStyle(
                                                            fontSize: 8,
                                                            color:
                                                                PdfColors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    vz.Padding(
                                                      padding: const vz
                                                          .EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 5,
                                                      ),
                                                      child: vz.Column(
                                                        crossAxisAlignment: vz
                                                            .CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          ...List.generate(
                                                            users[currentUser]
                                                                        ['data']
                                                                    [currentObj]
                                                                .experience
                                                                .length,
                                                            (index) =>
                                                                addExperience(
                                                              company: users[currentUser]
                                                                              [
                                                                              'data']
                                                                          [
                                                                          currentObj]
                                                                      .experience[
                                                                  index]['company'],
                                                              location: users[currentUser]
                                                                              [
                                                                              'data']
                                                                          [
                                                                          currentObj]
                                                                      .experience[
                                                                  index]['location'],
                                                              duration: users[currentUser]
                                                                              [
                                                                              'data']
                                                                          [
                                                                          currentObj]
                                                                      .experience[
                                                                  index]['year'],
                                                              aboutExp: users[currentUser]
                                                                              [
                                                                              'data']
                                                                          [
                                                                          currentObj]
                                                                      .experience[
                                                                  index]['about'],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                //EDUCATION BOX
                                                vz.Column(
                                                  crossAxisAlignment: vz
                                                      .CrossAxisAlignment.start,
                                                  children: [
                                                    vz.Container(
                                                      width: width,
                                                      alignment:
                                                          vz.Alignment.center,
                                                      padding: const vz
                                                          .EdgeInsets.all(2),
                                                      color: primary,
                                                      child: vz.FittedBox(
                                                        child: vz.Text(
                                                          'Education',
                                                          style: const vz
                                                              .TextStyle(
                                                            fontSize: 8,
                                                            color:
                                                                PdfColors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    vz.Padding(
                                                      padding: const vz
                                                          .EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 5,
                                                      ),
                                                      child: vz.Column(
                                                        crossAxisAlignment: vz
                                                            .CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          ...List.generate(
                                                            users[0]['data']
                                                                    [currentObj]
                                                                .education
                                                                .length,
                                                            (index) =>
                                                                addEducation(
                                                              university: users[currentUser]
                                                                              [
                                                                              'data']
                                                                          [
                                                                          currentObj]
                                                                      .education[index]
                                                                  [
                                                                  'university'],
                                                              course: users[currentUser]
                                                                              [
                                                                              'data']
                                                                          [
                                                                          currentObj]
                                                                      .education[
                                                                  index]['degree'],
                                                              duration: users[currentUser]
                                                                              [
                                                                              'data']
                                                                          [
                                                                          currentObj]
                                                                      .education[
                                                                  index]['year'],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                //SKILLS SUMMARY
                                                vz.Column(
                                                  crossAxisAlignment: vz
                                                      .CrossAxisAlignment.start,
                                                  children: [
                                                    vz.Container(
                                                      width: width,
                                                      alignment:
                                                          vz.Alignment.center,
                                                      padding: const vz
                                                          .EdgeInsets.all(2),
                                                      color: primary,
                                                      child: vz.FittedBox(
                                                        child: vz.Text(
                                                          'Skills Summary'
                                                              .toUpperCase(),
                                                          style: const vz
                                                              .TextStyle(
                                                            fontSize: 8,
                                                            color:
                                                                PdfColors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    vz.Padding(
                                                      padding: const vz
                                                          .EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 5,
                                                      ),
                                                      child: vz.Column(
                                                        crossAxisAlignment: vz
                                                            .CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          ...List.generate(
                                                            users[0]['data']
                                                                    [currentObj]
                                                                .skills
                                                                .length,
                                                            (index) =>
                                                                addSkills(
                                                              skillName: users[
                                                                              currentUser]
                                                                          [
                                                                          'data']
                                                                      [
                                                                      currentObj]
                                                                  .skills[index]['skill'],
                                                              percentage: users[currentUser]
                                                                              [
                                                                              'data']
                                                                          [
                                                                          currentObj]
                                                                      .skills[index]
                                                                  [
                                                                  'percentage'],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  vz.Align(
                                    alignment: vz.Alignment.bottomLeft,
                                    child: vz.Container(
                                      margin:
                                          const vz.EdgeInsets.only(bottom: 24),
                                      height: 100,
                                      width: 50,
                                      decoration: const vz.BoxDecoration(
                                        color: PdfColors.grey100,
                                        borderRadius: vz.BorderRadius.only(
                                          bottomRight: vz.Radius.circular(50),
                                          topRight: vz.Radius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                  vz.Align(
                                    alignment: vz.Alignment.bottomRight,
                                    child: vz.Container(
                                      height: 50,
                                      width: 100,
                                      decoration: const vz.BoxDecoration(
                                        color: PdfColors.grey100,
                                        borderRadius: vz.BorderRadius.only(
                                          topRight: vz.Radius.circular(50),
                                          topLeft: vz.Radius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );

              await Printing.layoutPdf(
                  name: users[currentUser]['data'][currentObj].resumetitle,
                  onLayout: (PdfPageFormat format) async => pdf.save());

              // PdfPreview(
              //   build: (format) => pdf.save(),
              // );
            },
            child: printButton(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            margin:
                const EdgeInsets.only(left: 12, right: 12, bottom: 24, top: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //TOP BANNER INCLUDING USER PROFILE NAME AND ROLE
                SizedBox(
                    height: 150,
                    child: ProfileNameBanner(height: height, width: width)),

                Expanded(
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            //About us Box
                                            const AboutMe(),

                                            //CONTACT BOX
                                            const ContactInfo(),

                                            //LANGUAGE BOX
                                            LanguagesKnow(width: width),

                                            //EXPERTISE BOX
                                            ExpertiseIn(width: width),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 6),
                                    child: Column(
                                      children: [
                                        //EXPERIENCE BOX
                                        Experience(width: width),

                                        //EDUCATION BOX
                                        Education(width: width),

                                        //SKILLS SUMMARY
                                        Skills(width: width),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          buildLeftHalfCircle(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: const EdgeInsets.only(),
                              height: height / 15,
                              width: 100,
                              decoration: BoxDecoration(
                                color: componentColor.withOpacity(0.4),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container printButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: primaryDark,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text(
            'Print',
            style: normalText(
              color: Colors.white,
              bold: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          const Icon(
            Icons.print,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Align buildLeftHalfCircle() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        height: height / 10,
        width: 50,
        decoration: BoxDecoration(
          color: componentColor.withOpacity(0.4),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
      ),
    );
  }

  pdfTextHeading() {
    return vz.TextStyle(
      fontSize: 10,
      color: primary,
    );
  }

  pdfTextBody() {
    return const vz.TextStyle(
      fontSize: 7,
    );
  }

  contactList({required String contact, required final img}) {
    return vz.Padding(
      padding: const vz.EdgeInsets.symmetric(vertical: 3.0),
      child: vz.Row(
        crossAxisAlignment: vz.CrossAxisAlignment.center,
        children: [
          vz.Padding(
            padding: const vz.EdgeInsets.only(right: 6.0),
            child: vz.ClipOval(
              child: vz.Container(
                height: 16,
                width: 16,
                alignment: vz.Alignment.center,
                decoration: vz.BoxDecoration(
                  color: primary,
                  shape: vz.BoxShape.circle,
                ),
                child: vz.Image(
                  img,
                  height: 8,
                  width: 8,
                  fit: vz.BoxFit.contain,
                ),
              ),
            ),
          ),
          vz.Expanded(
            child: vz.Align(
              alignment: vz.Alignment.centerLeft,
              child: vz.Text(
                contact,
                style: pdfTextBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  languageList({required String language}) {
    return vz.RichText(
      text: vz.TextSpan(
        children: [
          vz.TextSpan(
            text: '-',
            style: vz.TextStyle(
              fontSize: 14,
              fontWeight: vz.FontWeight.bold,
            ),
          ),
          vz.TextSpan(
            text: '   $language',
            style: pdfTextBody(),
          ),
        ],
      ),
    );
  }

  addname({required String name}) {
    return vz.RichText(
      text: vz.TextSpan(
        children: [
          vz.TextSpan(
            text: '-',
            style: vz.TextStyle(
              fontSize: 14,
              fontWeight: vz.FontWeight.bold,
            ),
          ),
          vz.TextSpan(
            text: '   $name',
            style: pdfTextBody(),
          ),
        ],
      ),
    );
  }

  addExperience(
      {required String company,
      required String location,
      required String duration,
      required String aboutExp}) {
    return vz.Column(
      crossAxisAlignment: vz.CrossAxisAlignment.start,
      children: [
        vz.Text(
          company,
          style: vz.TextStyle(
            fontSize: 7,
            fontWeight: vz.FontWeight.bold,
          ),
        ),
        vz.Text(
          location,
          style: vz.TextStyle(
            fontSize: 7,
            fontWeight: vz.FontWeight.bold,
          ),
        ),
        vz.Text(
          duration,
          style: vz.TextStyle(
            fontSize: 7,
            fontWeight: vz.FontWeight.bold,
          ),
        ),
        vz.Text(
          '$aboutExp \n\n',
          style: pdfTextBody(),
        ),
      ],
    );
  }

  addEducation(
      {required String university,
      required String course,
      required String duration}) {
    return vz.Column(
      crossAxisAlignment: vz.CrossAxisAlignment.start,
      children: [
        vz.Text(
          university,
          style: vz.TextStyle(
            fontSize: 7,
            fontWeight: vz.FontWeight.bold,
          ),
        ),
        vz.Text(
          course,
          style: const vz.TextStyle(
            fontSize: 7,
          ),
        ),
        vz.Text(
          '$duration\n\n',
          style: const vz.TextStyle(
            fontSize: 7,
          ),
        ),
      ],
    );
  }

  addSkills({required String skillName, required int percentage}) {
    return vz.Column(
      crossAxisAlignment: vz.CrossAxisAlignment.start,
      children: [
        vz.SizedBox(
          height: 14,
          child: vz.Row(
            crossAxisAlignment: vz.CrossAxisAlignment.center,
            children: [
              vz.Text(
                '$skillName  ',
                style: pdfTextBody(),
              ),
              vz.SizedBox(
                width: 60,
                height: 4,
                child: vz.LinearProgressIndicator(
                  valueColor: primary,
                  backgroundColor: PdfColors.grey100,
                  value: percentage / 100,
                ),
              ),
              vz.Text(
                '  ${percentage.toStringAsFixed(0)} %',
                style: pdfTextBody(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
