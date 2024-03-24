import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            'Contact',
            style: miniText(
              color: resumeColor,
            ),
          ),
          Divider(
            color: resumeColor,
            indent: 60,
            endIndent: 60,
          ),
          contactList(
              contact: '${users[currentUser]['data'][currentObj].contact[0]}',
              img: 'call'),
          contactList(
              contact: '${users[currentUser]['data'][currentObj].contact[1]}',
              img: 'mail'),
          contactList(
              contact: '${users[currentUser]['data'][currentObj].contact[2]}',
              img: 'home'),
          users[0]['data'][currentObj].showGithub == true
              ? contactList(
                  contact:
                      '${users[currentUser]['data'][currentObj].contact[3]}',
                  img: 'github')
              : const SizedBox(),
        ],
      ),
    );
  }

  contactList({required String img, required String contact}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: resumeColor,
              child: SizedBox(
                height: 10,
                width: 10,
                child: Image.asset('asset/images/resume/$img.png'),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                contact,
                style: resumeBody(bold: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
