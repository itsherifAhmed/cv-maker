import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'About Me',
          style: miniText(
            color: resumeColor,
          ),
        ),
        Divider(
          color: resumeColor,
          indent: 50,
          endIndent: 50,
        ),
        Text(
          textAlign: TextAlign.center,
          softWrap: true,
          '${users[currentUser]['data'][currentObj].objective}',
          style: resumeBody(
            bold: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
