import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/core.dart';
import 'package:food_delivery_app/home/home.dart';
import 'package:food_delivery_app/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [HomePage].
/// {@endtemplate}
class FoodDeliveryApp extends MaterialApp {
  /// {@macro counter_app}
  FoodDeliveryApp({super.key})
      : super(
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            home: const SkeletonApp());
}

class SkeletonApp extends StatefulWidget {
  const SkeletonApp({super.key});

  @override
  State<SkeletonApp> createState() => _SkeletonAppState();
}

class _SkeletonAppState extends State<SkeletonApp> {
  int _selectedIndex = 0;
  final List<NavBarItem> navBarItem = [
    NavBarItem(
      title: 'Home',
      icon: ImageConstant.cooking,
      activeIcon: ImageConstant.cooking,
    ),
    NavBarItem(
      title: 'Category',
      icon: ImageConstant.category,
      activeIcon: ImageConstant.category,
    ),
    NavBarItem(
      title: 'Favorite',
      icon: ImageConstant.heart,
      activeIcon: ImageConstant.heart,
    ),
    NavBarItem(
      title: 'Cart',
      icon: ImageConstant.buy,
      activeIcon: ImageConstant.buy,
    ),
  ];
  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF252830).withOpacity(0.6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...navBarItem.map(
              (e) {
                return SizedBox(
                  width: 60.w,
                  // height: 60.h,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.r),
                    onTap: () {
                      setState(() {
                        _selectedIndex = navBarItem.indexOf(e);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 7.h,
                        ),
                        SvgPicture.asset(e.icon,
                            color: _selectedIndex == navBarItem.indexOf(e)
                                ? AppColors.activeIconColor
                                : AppColors.iconColor),
                        _selectedIndex == navBarItem.indexOf(e)
                            ? const ActiveDot()
                            : const InactiveDot()
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class NavBarItem {
  final String title;
  final String icon;
  final String activeIcon;

  NavBarItem({
    required this.title,
    required this.icon,
    required this.activeIcon,
  });
}
