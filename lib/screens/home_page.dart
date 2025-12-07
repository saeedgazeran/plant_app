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
                              onPressed: () {},
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
                              r"$" + _plantList[index].price.toString(),
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
          ],
        ),
      ),
    );
  }
}
