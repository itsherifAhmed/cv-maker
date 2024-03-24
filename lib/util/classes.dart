import 'dart:io';

import 'package:flutter/cupertino.dart';

class ResumeData {
  String? firstName, lastName;
  String? profession;
  String? gender;
  String? objective;
  File? img;
  List contact = [];
  List<String> languages = [];
  List<String> expertise = [];
  List experience = [];
  List education = [];
  List skills = [];
  bool? showGithub = true;
  String? resumetitle;

  TextEditingController txtTitle = TextEditingController(text: 'Untitled');
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtProfession = TextEditingController();
  TextEditingController txtObjective = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtGithub = TextEditingController();
  List<TextEditingController> languageControllerList = [
    TextEditingController(text: 'English')
  ];
  List<TextEditingController> expertiseControllerList = [
    TextEditingController(text: 'Management Skill')
  ];
  List experienceControllerList = [
    {
      'company': TextEditingController(text: 'Studio Shawde'),
      'location': TextEditingController(text: 'Camberra - Australia'),
      'year': TextEditingController(text: '2020-2022'),
      'about': TextEditingController(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet quam rhoncus, egestas dui eget, malesuada justo. Ut aliquam augue.'),
    },
  ];
  List educationControllerList = [
    {
      'university': TextEditingController(text: 'Borcelle University'),
      'degree': TextEditingController(text: 'Bachelore of Business Management'),
      'year': TextEditingController(text: '2014-2018'),
    },
  ];
  List skillControllerList = [
    {
      'skill': TextEditingController(text: 'Design Process'),
      'percentage': TextEditingController(text: '60'),
    },
    {
      'skill': TextEditingController(text: 'Project Management'),
      'percentage': TextEditingController(text: '81'),
    },
  ];
}

List<String> objectives = [
  'Experienced [position] looking to help [company] provide excellent customer service. Over [number] years of experience at [company], demonstrating excellent [skill], [skill], and [skill].',
  '[Position] with [number] years of experience looking to help [company] improve its [function]. Diligent and detail-oriented professional with extensive experience with [hard skill]. ',
  'Hardworking [position] with [number] years of experience at a [type of environment]. Seeking to bring [skills] and experience to benefit [company] in the [department].',
  'Dedicated [position] with over [number] years of experience looking to move into [new field]. [Graduate degree title] from [school name]. Excellent [skill], [skill], and [skill].',
  'A resourceful individual with a proven track record in implementing successful marketing strategies, boosting organic traffic, and improving search rankings seeks a position of Marketing Associate at ABC company to maximize brand awareness and revenue through integrated marketing communications.',
  'An MBA with specialization in online marketing, working knowledge of Google Analytics and Adwords, and 4 years experience in developing and managing marketing campaigns seek the role of Online Marketing Manager with ABC Inc. to provide thought leadership and implement best practices for digital marketing.',
  'A highly creative thinker, grammar Nazi, and social media enthusiast seek the position of Social Media & Content Marketing Analyst to transform technical and digital information and processes into influencial stories.',
];
