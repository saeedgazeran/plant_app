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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          children: <Widget>[
            //Search Box
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(right: 5),
                              hintText: "جستجو ...",
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
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
            //Categories
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 10.0,
              ),
              height: 70.0,
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
                          fontFamily: 'iranSans',
                          fontSize: 16.0,
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
            const SizedBox(height: 10),
            //Product Section 1
            SizedBox(
              height: size.height * 0.32,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  final plant = _plantList[index];

                  return Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: <Widget>[
                        /// ❤️ Favorite
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  plant.isFavorated = toggleIsFavorit(
                                    plant.isFavorated,
                                  );
                                });
                              },
                              icon: Icon(
                                plant.isFavorated
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Constants.primaryColor,
                              ),
                            ),
                          ),
                        ),

                        /// 🌱 Image
                        Positioned.fill(
                          top: 50,
                          bottom: 50,
                          child: Image.asset(
                            plant.imageURL,
                            fit: BoxFit.contain,
                          ),
                        ),

                        /// 💰 Price
                        Positioned(
                          bottom: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _plantList[index].price.toString().farsiNumber +
                                  r"تومان",
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 16,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),

                        /// 📝 Name & Category
                        Positioned(
                          bottom: 12,
                          right: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                plant.category,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontFamily: "bYekan",
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                plant.plantName,
                                style: const TextStyle(
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
            //Section Title
            const Padding(
              padding: EdgeInsets.only(right: 18, top: 20, bottom: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "گیاهان جدید",
                  style: TextStyle(
                    fontFamily: "Lalezar",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //Product Section 2
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: _plantList.length,
              itemBuilder: (context, index) {
                final plant = _plantList[index];

                return Container(
                  height: 90,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /// Price
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            child: Image.asset(
                              "assets/images/PriceUnit-green.png",
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            plant.price.toString().farsiNumber,
                            style: TextStyle(
                              fontFamily: "Lalezar",
                              fontWeight: FontWeight.bold,
                              color: Constants.primaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      /// Info + Image
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                plant.category,
                                style: const TextStyle(
                                  fontFamily: "bYekan",
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                plant.plantName,
                                style: TextStyle(
                                  color: Constants.blackColor,
                                  fontFamily: "bYekan",
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset(
                              plant.imageURL,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension FarsiNumberNumberExtension on String {
  String get farsiNumber {
    const english = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    const farsi = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];
    String text = this;
    for (var i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }
    return text;
  }
}
