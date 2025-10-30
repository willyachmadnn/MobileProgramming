import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import './login.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of first page",
          body: "Here you can write the description of the page, to explain something...",
          image: Center(
            child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_XZ3pkn.json", height: 175.0),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(color: Colors.orange, fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 20.0),
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(
          title: "Title of second page",
          body: "Here you can write the description of the page, to explain something...",
          image: Center(
            child: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json", height: 175.0),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(color: Colors.orange, fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 20.0),
            pageColor: Colors.white,
          ),
        ),
      ],
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginPage()),
        );
      },
      showSkipButton: true,
      skip: Text("Skip"),
      next: Text("Next"),
      done: Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      dotsDecorator: DotsDecorator(
        size: Size.square(10.0),
        activeSize: Size(20.0, 10.0),
        activeColor: Colors.blue,
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}