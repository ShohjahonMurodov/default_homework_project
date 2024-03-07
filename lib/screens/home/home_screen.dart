import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/data/local/coffee_database.dart';
import 'package:homework/data/local/local_database.dart';
import 'package:homework/data/models/coffee_models.dart';
import 'package:homework/screens/favourite/favourite_screen.dart';
import 'package:homework/screens/home/widgets/drawer.dart';
import 'package:homework/screens/info_coffee_screen/info_coffee_screen.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeCategory = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0C0F14,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: SvgPicture.asset(AppImages.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.search),
          ),
          8.getW(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouriteScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(AppImages.favourite),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              tr("your_favorites"),
              style: TextStyle(
                color: AppColors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          16.getH(),
          CarouselSlider(
            items: List.generate(
              dataBase.length,
              (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white.withOpacity(.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoCoffeeScreen(),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.getH(),
                    Image.asset(dataBase[index].image),
                    8.getH(),
                    Text(
                      dataBase[index].title.tr(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.getH(),
                    Text(
                      dataBase[index].subtitle.tr(),
                      style: TextStyle(
                        color: AppColors.white.withOpacity(.5),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    14.getH(),
                    Row(
                      children: [
                        Text(
                          "₱ ${dataBase[index].price}".tr(),
                          style: TextStyle(
                            color: AppColors.c_D17842,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 16.h),
                            backgroundColor: AppColors.c_D17842,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          onPressed: () async {
                            CoffeeModels coffeeModels = CoffeeModels(
                              image: dataBase[index].image,
                              title: dataBase[index].title,
                              subtitle: dataBase[index].subtitle,
                              price: dataBase[index].price,
                              count: dataBase[index].count,
                            );
                            final allCoffees = await LocalDatabase.searchGames(dataBase[index].title);
                            if (allCoffees.isEmpty) {
                              await LocalDatabase.insertGame(coffeeModels);
                            } else {
                              final model = coffeeModels.copyWith(count: allCoffees[0].count + 1);
                              await LocalDatabase.updateGameId(model);
                            }
                            print("Databasega qushildi :)");
                            setState(() {});
                          },
                          child: SvgPicture.asset(AppImages.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            options: CarouselOptions(
              height: 0.53 * height,
              viewportFraction: 0.60,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.linear,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              onPageChanged: (v, d) {},
              scrollDirection: Axis.horizontal,
            ),
          ),
          24.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "popular_now".tr(),
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          16.getH(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                24.getW(),
                ...List.generate(
                  categoryDatabase.length,
                  (index) => TextButton(
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        side: BorderSide(
                          color: activeCategory == index
                              ? AppColors.white.withOpacity(.10)
                              : AppColors.transparent,
                          width: 1.w,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        activeCategory = index;
                      });
                    },
                    child: Text(
                      categoryDatabase[index].text.tr(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: activeCategory == index
                            ? AppColors.white
                            : AppColors.white.withOpacity(.25),
                      ),
                    ),
                  ),
                ),
                24.getW(),
              ],
            ),
          ),
          24.getH(),
        ],
      ),
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: const MyDrawer(),
    );
  }
}
