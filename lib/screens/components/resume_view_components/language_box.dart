import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:flutter/material.dart';

class LanguagesKnow extends StatelessWidget {
  const LanguagesKnow({
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
              'LANGUAGE',
              style: ultraMiniText(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 5,
            bottom: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                users[currentUser]['data'][currentObj].languages.length,
                (index) => addLanguage(
                    language: users[currentUser]['data'][currentObj]
                        .languages[index]),
              )
            ],
          ),
        ),
      ],
    );
  }

  RichText addLanguage({required String language}) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: '-',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: '   $language',
            style: resumeBody(),
          ),
        ],
      ),
    );
  }
}
