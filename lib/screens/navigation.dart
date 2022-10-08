import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_master/screens/restaurant%20_details/offer/offer_page.dart';
import 'package:travel_app_master/screens/user_about/person.dart';

import '../provider/Location/location.dart';
import '../provider/pagecontroll.dart';
import 'Search/search.dart';
import 'home/home.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  bool isTap1 = false;
  bool isTap2 = false;
  bool isTap3 = false;
  bool isTap4 = false;
  bool isTap5 = false;

  PageController pageController = PageController();

  int selectedIndex = 0;
  // List<Widget> screens = [
  //   HomeScreen(),
  //   SearchScreen(),
  //   OfferScreen(),
  //   // ProfileScreen(),
  //   PersonScreen()
  // ];

  Future currentlocationget() async {
    final _locationprovider =
        Provider.of<Locationprovider>(context, listen: false);
    await _locationprovider.locationenablecheck();
    await _locationprovider.getcurrectlocation();
  }

  @override
  void initState() {
    currentlocationget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageprovider = Provider.of<PagecontrollProvider>(context);
    return Scaffold(
      body: PageView(
        controller: pageprovider.pageController,
        children: [
          HomeScreen(),
          SearchScreen(selectedcategory: pageprovider.selectcategoryindex),
          OfferScreen(),
          // ProfileScreen(),
          Container(),
          PersonScreen()
        ],
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          items: [
            // BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            // BottomNavigationBarItem(icon: Icon(Icons.person),label: "person"),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/home.png",
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/explor.png",
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/gift_card.png"),
              label: "For You",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/world_card.png"),
              label: "World",
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/person.png",
                color: Colors.grey,
              ),
              label: "Account",
            ),
          ],

          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          // selectedIconTheme: IconThemeData(
          //   color: Colors.redAccent
          // ),

          onTap: (int index) {
            pageprovider.pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
