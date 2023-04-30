import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:tiedup/const/colors.dart';
import 'package:tiedup/const/text_styles.dart';
import 'package:tiedup/views/profile.dart';
import 'package:tiedup/views/search.dart';
import 'package:tiedup/views/shopping_page.dart';
import '../controllers/cart_controller.dart';
import 'Home_screen.dart';
import 'item_upload.dart';

class Constant extends StatefulWidget {
  const Constant({super.key});

  @override
  State<Constant> createState() => _ConstantState();
}

class _ConstantState extends State<Constant> {
  int _selectedindex = 0;

  var screens = [Home_screen(), search(), const item_upload(), profile()];

  int _onitemtapped(int index) {
    setState(() {
      _selectedindex = index;
    });
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _selectedindex,
        children: screens,
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedindex,
        barHeight: 80,
        domeCircleSize: 70,
        domeCircleColor: Acesnt_Color,
        borderRaduis: const BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        barColor: Colors.white,
        onTabChange: _onitemtapped,
        tabs: [
          MoltenTab(
            icon: Padding(
              padding: const EdgeInsets.all(22.0),
              child: ImageIcon(
                const AssetImage('assets/house.png'),
                size: 20,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          MoltenTab(
            icon: Padding(
              padding: const EdgeInsets.all(22.0),
              child: ImageIcon(const AssetImage('assets/search.png'),
                  size: 20, color: Colors.grey.shade400),
            ),
          ),
          MoltenTab(
            icon: Padding(
              padding: const EdgeInsets.all(22.0),
              child: ImageIcon(
                const AssetImage('assets/upload.png'),
                size: 20,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          MoltenTab(
            icon: Padding(
              padding: const EdgeInsets.all(22.0),
              child: ImageIcon(
                const AssetImage('assets/avatar.png'),
                size: 20,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Acesnt_Color,
        icon: const ImageIcon(
          const AssetImage('assets/shopping-cart.png'),
          size: 25,
          color: thiredcolor,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: boldtext24w,
          );
        }),
      ),
    );
  }
}
