import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:yap/page/welcome.dart';
import 'package:yap/page/home_page.dart';
import 'package:yap/widget/button_widget.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'A reader lives a thousand lives',
          body: 'The man who never reads lives only one.',
          image: buildImage('assets/ebook.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Featured Books',
          body: 'Available right at your fingertips',
          image: buildImage('assets/readingbook.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Simple UI',
          body: 'For enhanced reading experience',
          image: buildImage('assets/manthumbs.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Today a reader, tomorrow a leader',
          body: 'Start your journey',
          footer: ButtonWidget(
            text: 'Start Reading',
            onClicked: () => goToHome(context),
          ),
          image: buildImage('assets/learn.png'),
          decoration: getPageDecoration(),
        ),
      ],
      overrideDone: Text(""),
      //onDone: () => goToHome(context),
      //showSkipButton: true,
      //skip: Text('Skip'),
      //onSkip: () => goToHome(context),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Theme.of(context).splashColor,
      dotsFlex: 0,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
      // freeze: true,
      // animationDuration: 1000,
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => WelcomeScreen()),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFBDBDBD),
    //activeColor: Colors.orange,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle:  TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.blueGrey,
  );
}
