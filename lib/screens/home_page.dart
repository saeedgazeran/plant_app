import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<Plant> _plantList = Plant.plantList;

  bool toggleIsFavorit(bool isFavorit) {
    return !isFavorit;
  }

  final List<String> _plantTypes = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل‌کار |',
    '| گل باغچه‌ایی |',
    '| گل سمی |',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Search Box
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Constants.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.mic,
                        color: Constants.blackColor.withValues(alpha: 0.6),
                      ),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            cursorColor: Constants.primaryColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 5),
                              hintText: "جستجو ...",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "iranSans",
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Constants.blackColor.withValues(alpha: 0.6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Category
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              height: 70,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                          fontFamily: "iranSans",
                          fontSize: 16,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //Product 1
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  bool isFavorated = toggleIsFavorit(
                                    (_plantList[index].isFavorated),
                                  );
                                  _plantList[index].isFavorated = isFavorated;
                                });
                              },
                              icon: _plantList[index].isFavorated == true
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border_outlined),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.asset(_plantList[index].imageURL),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              r"تومان" +
                                  _plantList[index].price
                                      .toString()
                                      .farsiNumber,
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                _plantList[index].category,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: "bYekan",
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                _plantList[index].plantName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "bYekan",
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            //Text
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 18, top: 20, bottom: 15),
              child: Text(
                "گیاهان جدید",
                style: TextStyle(
                  fontFamily: "Lalezar",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Product 2
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withValues(alpha: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 80,
                    width: size.width,
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Image.asset(
                                "assets/images/PriceUnit-green.png",
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              _plantList[index].price.toString().farsiNumber,
                              style: TextStyle(
                                fontFamily: "Lalezar",
                                color: Constants.primaryColor,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Constants.primaryColor.withValues(
                                  alpha: 8,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 80,
                                child: Image.asset(_plantList[index].imageURL),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  _plantList[index].category,
                                  style: TextStyle(
                                    fontFamily: "bYekan",
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: TextStyle(
                                    color: Constants.blackColor,
                                    fontFamily: "bYekan",
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension FarsiNumberNumberExtension on String {
  String get farsiNumber {
    const english = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
    const farsi = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];
    String text = this;
    for (var i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }
    return text;
  }
}
