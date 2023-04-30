import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:tiedup/views/shopping_page.dart';
import '../const/colors.dart';
import '../const/text_styles.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: DefaultTabController(
                length: 6,
                child: Column(
                  children: <Widget>[
                    ButtonsTabBar(
                      backgroundColor: Acesnt_Color,
                      elevation: 0,
                      unselectedBackgroundColor: Colors.transparent,
                      height: 50,
                      buttonMargin: const EdgeInsets.only(left: 20),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      unselectedLabelStyle: boldtext20,
                      labelStyle: boldtext20w,
                      radius: 100,
                      tabs: const [
                        Tab(
                          text: "All",
                        ),
                        Tab(
                          text: "Books",
                        ),
                        Tab(
                          text: "Notes",
                        ),
                        Tab(
                          text: "Calculator",
                        ),
                        Tab(
                          text: "ED Instruments",
                        ),
                        Tab(
                          text: "Others",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          Center(
                            child: ShoppingPage(),
                          ),
                          const Center(
                            child: Icon(Icons.directions_bike),
                          ),
                          const Center(
                            child: Icon(Icons.directions_car),
                          ),
                          const Center(
                            child: Icon(Icons.directions_transit),
                          ),
                          const Center(
                            child: Icon(Icons.directions_bike),
                          ),
                          const Center(
                            child: Icon(Icons.directions_transit),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.all(15),
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.transparent, borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tied",
                            style:
                            boldtext24,
                          ),
                          Text(
                            "Up",
                            style: boldtext24gray,
                          ),
                        ],
                      ),
                      ImageIcon(
                        const AssetImage('assets/settings.png'),
                        size: 20,
                        color: Acesnt_Color,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
