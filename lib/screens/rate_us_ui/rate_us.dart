import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateUs extends StatefulWidget {
  const RateUs({super.key});

  @override
  State<RateUs> createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: primaryBgColor,
        title: Text(
          'Rate us',
          style: textStyle(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please Rate Us By Tapping!',
              style: normalText(),
            ),
            const SizedBox(
              height: 24,
            ),
            RatingBar.builder(
              initialRating: rate,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return const Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );

                  default:
                    return const Icon(Icons.rate_review);
                }
              },
              onRatingUpdate: (rating) {
                rate = rating;
                const snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 1),
                  showCloseIcon: true,
                  content: Text('Thanks for rating!'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
