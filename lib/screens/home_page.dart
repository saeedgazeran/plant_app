import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "رد کردن",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "lalezar",
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              CreatePage(
                image: "assets/images/plant-one.png",
                title: Constants.titleOne,
                discription: Constants.descriptionOne,
              ),
              CreatePage(
                image: "assets/images/plant-two.png",
                title: Constants.titleTwo,
                discription: Constants.descriptionTwo,
              ),
              CreatePage(
                image: "assets/images/plant-three.png",
                title: Constants.titleThree,
                discription: Constants.descriptionThree,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String discription;

  const CreatePage({
    super.key,
    required this.image,
    required this.title,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 350, child: Image.asset(image)),
          SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "bYekan",
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor,
            ),
          ),
          SizedBox(height: 20),
          Text(
            discription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "iranSans",
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
