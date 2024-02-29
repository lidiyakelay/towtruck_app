import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:towtruck_app/Screen/auth_page/login_page.dart';
import 'package:towtruck_app/Screen/detail_view_page/map_view_page.dart';
import 'package:towtruck_app/Screen/home_page/main_page.dart';
import 'package:towtruck_app/Screen/notification_page/notification_page.dart';
import 'package:towtruck_app/Screen/publish_post_page/publish_post_page.dart';
import 'package:towtruck_app/Screen/setting_page/setting_page.dart';
import 'package:towtruck_app/controllers/auth_controller.dart';
import 'package:towtruck_app/models/signin_body_model.dart';

class HomePage extends StatelessWidget {
 
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
     PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    return  GetBuilder<AuthController>(
      builder: (authController) {
        return authController.userLoggedIn()? Container(
          child: PersistentTabView(
              context,
              controller: _controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
              confineInSafeArea: true,
              backgroundColor: Color.fromARGB(171, 0, 0, 0), // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                colorBehindNavBar: Colors.white,
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
          ),
        ):LoginPage();
      }
    );
  }

    List<Widget> _buildScreens() {
        return [
          MainPage(),
          PublishPostPage(),
          MapViewPage(),
          NotificationPage(),
          SettingPage()
        ];
    }


    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Icons.home),
                title: ("Home"),
                activeColorPrimary: Colors.amber,
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.camera),
                title: ("Post"),
                activeColorPrimary: Colors.amber,
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.location_on,),
                title: ("Location"),
                 activeColorPrimary: Colors.amber,
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.notifications),
                title: ("Notification"),
                activeColorPrimary: Colors.amber,
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.settings),
                title: ("Settings"),
                activeColorPrimary: Colors.amber,
                inactiveColorPrimary: Colors.grey,
            ),
        ];
    }


}