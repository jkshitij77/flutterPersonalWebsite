import 'package:flutter/material.dart';

class ProfessionalPage extends StatefulWidget {
  static final String professionalPageRoute = '/professionalPage';

  @override
  _ProfessionalPageState createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  // PdfController _pdfController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP HEADING
              Text(
                'Kshitij Jain',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'TNR',
                  fontSize: 60,
                ),
              ),

              // heading 1
              sectionHeading('Education'),
              educationSection(),

              // heading 2
              sectionHeading('Key expriences'),
              educationSection(),
            ],
          ),
        ),
      ),
    );
  }

  Text sectionHeading(String heading) {
    return Text(
      '$heading',
      style: TextStyle(
        fontSize: 40,
        color: Colors.black,
        fontFamily: 'TNR',
      ),
    );
  }

  TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'TNR',
    fontSize: 25,
  );

  TextStyle subtitleStyle = TextStyle(
    fontFamily: 'TNR',
    fontSize: 18,
  );

  Widget educationSection() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dartmouth College',
              style: titleStyle,
            ),
            Text(
              'Bachelor of Arts, Potential Major in Computer Science & Economics; Minor in Mathematical Data Science      	        GPA 3.7',
              style: subtitleStyle,
            ),
            Text(
                '•	Coursework: Multivariable Calculus; OOP with JAVA; Algorithms; Discrete Math; Econometrics; Macroeconomics'),
            Text(
                '•	Academic Citations: Probability; Python in CS; Software Implementation and Design; Differential Equation'),
            Text(
                '•	MOOCs: R Basics (HarvardX); Accounting Fundamentals (Udemy); Modeling and Valuation'),
            Text(
              'Tuck School of Business College',
              style: titleStyle,
            ),
            Text(
              'Tuck Business Bridge Program',
              style: subtitleStyle,
            ),
            Text(
                '•	3-week pre-MBA program taught by MBA faculty covering finance, managerial communications, and more'),
            Text(
                '•  Created a DCF model and presented capstone project and company valuations to analysts and thought leaders'),
            Text(
              'TuckLAB',
              style: subtitleStyle,
            ),
            Text(
                '•	Strategized business plan for startup and presented it to faculty and entrepreneurs(‘Shark Tank’-like program)'),
          ],
        ),
      ],
    );
  }

  Widget experience(String title, String place, String date, String position,
      List<String> things) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // TODO: Alignment
          children: [
            Text(
              '$title',
              style: titleStyle,
            ),
            Text(
              ', $place',
              style: titleStyle.copyWith(fontWeight: FontWeight.normal,),
            ),
          ],
        ),
        Text(
          // TODO: Make invisible if not there
          '$position',
          style: subtitleStyle,
        ),
        Text(
            '•	Coursework: Multivariable Calculus; OOP with JAVA; Algorithms; Discrete Math; Econometrics; Macroeconomics'),
        Text(
            '•	Academic Citations: Probability; Python in CS; Software Implementation and Design; Differential Equation'),
        Text(
            '•	MOOCs: R Basics (HarvardX); Accounting Fundamentals (Udemy); Modeling and Valuation'),
      ],
    );
  }

  Widget experiencesSection() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .05,
        ),
        Column(
          children: [],
        ),
      ],
    );
  }
}
