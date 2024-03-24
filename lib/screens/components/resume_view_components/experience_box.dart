import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          color: resumeColor,
          child: FittedBox(
            child: Text(
              'EXPERIENCE',
              style: ultraMiniText(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                users[currentUser]['data'][currentObj].experience.length,
                (index) => addExperience(
                  company: users[currentUser]['data'][currentObj]
                      .experience[index]['company'],
                  location: users[currentUser]['data'][currentObj]
                      .experience[index]['location'],
                  duration: users[currentUser]['data'][currentObj]
                      .experience[index]['year'],
                  aboutExp: users[currentUser]['data'][currentObj]
                      .experience[index]['about'],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  addExperience(
      {required String company,
      required String location,
      required String duration,
      required String aboutExp}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          company,
          style: resumeBody(
            fontSize: 9.5,
            bold: FontWeight.w700,
          ),
        ),
        Text(
          location,
          style: resumeBody(
            fontSize: 9.5,
            bold: FontWeight.w700,
          ),
        ),
        Text(
          duration,
          style: resumeBody(
            fontSize: 9.5,
            bold: FontWeight.w700,
          ),
        ),
        Text(
          '$aboutExp \n',
          style: resumeBody(),
        ),
      ],
    );
  }
}
