import 'package:ecume/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_view.dart';

class IntroView extends StatefulWidget {
  final UserRepository userRepository;
  IntroView({Key key, @required this.userRepository}) : super(key: key);

  @override
  _IntroViewState createState() => _IntroViewState(userRepository);
}

class _IntroViewState extends State<IntroView> {
  final UserRepository userRepository;
  _IntroViewState(this.userRepository);
  bool clicked = false;
  void afterIntroComplete() {
    setState(() {
      clicked = true;
    });
  }

  final List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          Text('TE DOY LA BIENVENIDA',
              style: TextStyle(fontSize: 28.0, color: Colors.blueAccent)),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      body:
          "ECUME la aplicación para ejercitar cuerpo y mente te da la bienvenida",
      image: Center(child: SvgPicture.asset("assets/intro_icons/ecume.svg")),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          Text('EJERCICIOS PERSONALIZADOS',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, color: Colors.blueAccent)),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      body: "Cada ejercicio fue creado para ti y tu mejora continua",
      image: Center(
          child: SizedBox(
        width: 450.0,
        child: SvgPicture.asset("assets/intro_icons/ejercicios.svg"),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          Text('¡MUY BIEN!',
              style: TextStyle(fontSize: 28.0, color: Colors.blueAccent)),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      body:
          "Haz hecho un gran paso muy importante para mejorar tu salud física y mental",
      image: Center(
          child: SizedBox(
        width: 450.0,
        child: SvgPicture.asset("assets/intro_icons/muyBien.svg"),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return clicked
        ? LoginView(
            userRepository: userRepository,
          )
        : IntroductionScreen(
            pages: pages,
            onDone: () {
              afterIntroComplete();
            },
            onSkip: () {
              afterIntroComplete();
            },
            showSkipButton: true,
            skip: const Text('SALTAR',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
            next: const Icon(Icons.navigate_next),
            done: const Text("HECHO",
                style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(7.0),
                activeSize: const Size(20.0, 5.0),
                activeColor: Colors.blueAccent,
                color: Colors.black12,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
  }
}
