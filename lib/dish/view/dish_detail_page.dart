import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/dish/model/ingridient_model.dart';
import 'package:food_delivery_app/dish/model/new_dish_model.dart';
import 'package:food_delivery_app/theme/theme.dart';

final DishModel dish = DishModel(
  name: 'Fried Shrimp',
  picture: ImageConstant.friedShrimp1,
  description:
      'This is my kind of breakfast egg sandwich and it takes under  5 minutes to make',
  rate: 4.8,
  numberOfRates: 163,
  time: 20,
  kcal: 150,
  price: 29,
  ingridients: [
    IngridientModel(
      name: 'Broccoli',
      picture: ImageConstant.broccoli,
    ),
    IngridientModel(
      name: 'Chili',
      picture: ImageConstant.chili,
    ),
    IngridientModel(
      name: 'Corn',
      picture: ImageConstant.corn,
    ),
    IngridientModel(
      name: 'Carrot',
      picture: ImageConstant.carrot,
    ),
    IngridientModel(
      name: 'Broccoli',
      picture: ImageConstant.broccoli,
    ),
    IngridientModel(
      name: 'Chili',
      picture: ImageConstant.chili,
    ),
    IngridientModel(
      name: 'Corn',
      picture: ImageConstant.corn,
    ),
  ],
);

class DishDetailPage extends StatelessWidget {
  const DishDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            ImageConstant.back,
            width: 26.dm,
            height: 26.dm,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ImageConstant.heart,
              width: 26.dm,
              height: 26.dm,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DishDescription(),
                SizedBox(
                  height: 30.h,
                ),
                // Ingridients
                const DishIngredients(),
                SizedBox(
                  height: 40.h,
                ),
                // Price
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text('Price',
                          style: TextStyle(
                              color: TextColors.secondaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500)),
                      Text('\$${dish.price.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: TextColors.red,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120.h,
                ),
              ],
            ),
          ),
          const AddButton()
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: MediaQuery.of(context).size.height * 1.28,
      child: SizedBox(
          height: 100,
          width: double.infinity,
          child: OverflowBox(
              maxHeight: 800.h,
              maxWidth: 800.w,
              child: Container(
                height: 796.h,
                width: 796.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.red,
                ),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 20.h),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40.sp,
                ),
              ))),
    );
  }
}

class DishDescription extends StatelessWidget {
  const DishDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Picture
          SizedBox(
            height: 200.dm,
            width: 230.dm,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  ImageConstant.salad,
                  fit: BoxFit.fill,
                  width: 220.dm,
                  height: 135.dm,
                ),
                Image.asset(
                  dish.picture,
                  fit: BoxFit.fill,
                  width: 180.dm,
                  height: 180.dm,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          // Dish Name
          Text(
            dish.name,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Dish Description
          SizedBox(
            width: 270.w,
            child: Text(dish.description ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: TextColors.secondaryColor,
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 12.h,
          ),
          // Additional information
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
                    '${dish.rate.toString()}(${dish.numberOfRates})',
                    style: TextStyle(
                        color: TextColors.secondaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                width: 12.w,
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
                    '${dish.time} min',
                    style: TextStyle(
                        color: TextColors.secondaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                width: 12.w,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstant.hotTrend,
                    height: 16.h,
                    width: 16.w,
                    color: AppColors.iconColor,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    '${dish.kcal} kcal',
                    style: TextStyle(
                        color: TextColors.secondaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DishIngredients extends StatelessWidget {
  const DishIngredients({
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
                'Ingridients',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                '${dish.ingridients?.length ?? 0} items',
                style: TextStyle(
                    color: TextColors.secondaryColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        SizedBox(
          height: 110.h,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20.w),
              itemBuilder: (context, index) {
                return Container(
                  height: 108.h,
                  width: 70.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.dm, vertical: 20.dm),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: const Color(0xff2c2f38).withOpacity(0.64)),
                  child: Column(
                    children: [
                      Image.asset(
                        dish.ingridients?[index].picture ?? '',
                        height: 40.h,
                        width: 40.w,
                        fit: BoxFit.cover,
                      ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      Text(
                        dish.ingridients?[index].name ?? '',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 6.w,
                );
              },
              itemCount: dish.ingridients?.length ?? 0),
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300.h,
          width: double.infinity,
        ),
        Expanded(
          child: OverflowBox(
            maxHeight: 800.h,
            maxWidth: 800.w,
            child: Container(
              height: 800.h,
              width: 800.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(241, 34, 36, 43)),
            ),
          ),
        )
      ],
    );
  }
}
