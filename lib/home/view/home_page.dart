import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/dish/dish.dart';
import 'package:food_delivery_app/home/model/category_model.dart';
import 'package:food_delivery_app/dish/model/new_dish_model.dart';
import 'package:food_delivery_app/theme/theme.dart';

final List<DishModel> newDishes = [
  DishModel(
      name: 'Fried Shrimp',
      picture: ImageConstant.friedShrimp1,
      rate: 4.8,
      numberOfRates: 163,
      time: 20,
      price: 29),
  DishModel(
      name: 'Fried Shrimp',
      picture: ImageConstant.friedShrimp2,
      rate: 4.8,
      numberOfRates: 163,
      time: 20,
      price: 29),
  DishModel(
      name: 'Fried Shrimp',
      picture: ImageConstant.friedShrimp1,
      rate: 4.8,
      numberOfRates: 163,
      time: 20,
      price: 29),
  DishModel(
      name: 'Fried Shrimp',
      picture: ImageConstant.friedShrimp2,
      rate: 4.8,
      numberOfRates: 163,
      time: 20,
      price: 29)
];

final List<CategoryModel> categoryItems = [
  CategoryModel(icon: '🍔', title: 'Burger', isSelected: false),
  CategoryModel(icon: '🍕', title: 'Pizza', isSelected: false),
  CategoryModel(icon: '🌭', title: 'Sandwich', isSelected: false),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning',
              style: TextStyle(
                  fontSize: 13.sp,
                  color: TextColors.primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Shania fraser',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              ImageConstant.user,
            ),
            iconSize: 36.w,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.h,
            ),
            const SearchField(),
            SizedBox(
              height: 15.h,
            ),
            const Categories(),
            SizedBox(
              height: 30.h,
            ),
            const NewDishes()
          ],
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 7.w,
      margin: EdgeInsets.only(top: 5.h),
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 7.w,
      margin: EdgeInsets.only(top: 5.h),
      decoration: const BoxDecoration(
        color: AppColors.activeIconColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class NewDishes extends StatelessWidget {
  const NewDishes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Dishes',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'All',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    SvgPicture.asset(
                      ImageConstant.arrowRight,
                      height: 16.dm,
                      width: 16.dm,
                      color: AppColors.activeIconColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        GridView.count(
          primary: false,
          shrinkWrap: true,
          childAspectRatio:
              MediaQuery.of(context).size.width > 760 ? 0.8 : 0.65,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          crossAxisCount: 2,
          children: <Widget>[
            ...newDishes.map(
              (e) {
                return InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DishDetailPage(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.secondaryColor,
                    ),
                    padding: EdgeInsets.all(10.r),
                    child: Column(
                      children: [
                        Image.asset(
                          e.picture,
                          fit: BoxFit.contain,
                          height: 130.h,
                          width: 130.w,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          e.name,
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageConstant.star,
                                  height: 16.h,
                                  width: 16.w,
                                  color: AppColors.iconColor,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  '${e.rate.toString()}(${e.numberOfRates})',
                                  style: TextStyle(
                                      color: TextColors.secondaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageConstant.stopWatch,
                                  height: 16.h,
                                  width: 16.w,
                                  color: AppColors.iconColor,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  '${e.time} min',
                                  style: TextStyle(
                                      color: TextColors.secondaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        const Spacer(),
                        Text(
                          '\$${e.price.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: AppColors.activeIconColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ],
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({
    super.key,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'All',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    SvgPicture.asset(
                      ImageConstant.arrowRight,
                      height: 16.dm,
                      width: 16.dm,
                      color: AppColors.activeIconColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 48.h,
          padding: EdgeInsets.only(left: 20.w),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 48.h,
                child: ChoiceChip(
                    showCheckmark: false,
                    labelPadding: EdgeInsets.only(left: 13.w),
                    avatar: SizedBox(
                      child: Text(
                        categoryItems[index].icon,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    avatarBorder: const ContinuousRectangleBorder(),
                    label: Text(
                      categoryItems[index].title,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: TextColors.secondaryColor),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    side: BorderSide.none,
                    backgroundColor: AppColors.secondaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                    selected: categoryItems[index].isSelected,
                    onSelected: (value) {
                      setState(() {
                        for (var item in categoryItems) {
                          item.isSelected = false;
                        }
                        categoryItems[index].isSelected = value;
                      });
                    }),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 13.w,
              );
            },
            itemCount: categoryItems.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(20.dm),
          hintText: 'Find yours dishes',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ImageConstant.filter,
              color: AppColors.activeIconColor,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.none,
            ),
          ),
          filled: true,
          fillColor: const Color(0xFF252830),
        ),
      ),
    );
  }
}
