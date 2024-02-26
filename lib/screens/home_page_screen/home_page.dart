import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/data/models/my_response.dart';
import 'package:homework/data/models/one_call/one_call_models/one_call_data_models.dart';
import 'package:homework/data/models/simple/weather_model/weather_model.dart';
import 'package:homework/data/repository/weather_repository.dart';
import 'package:homework/screens/home_page_screen/widgets/hourly_items.dart';
import 'package:homework/screens/home_page_screen/widgets/info_items.dart';
import 'package:homework/screens/home_page_screen/widgets/textbutton_items.dart';
import 'package:homework/screens/next_seven_days/next_days_screen.dart';
import 'package:homework/utils/colors/app_colors.dart';
import 'package:homework/utils/images/app_images.dart';
import 'package:homework/utils/extensions/my_extensions.dart';
import 'package:homework/utils/size/size_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OneCallDataModels? oneCallDataModels;
  final WeatherRepository weatherRepository = WeatherRepository();
  int activeIndex = 0;
  int activeHour = 0;
  bool activeTextField = false;
  String city = "Tashkent";
  OneCallDataModels? oneCallData;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_FEE3BC,
        body: SingleChildScrollView(
          child: Column(
            children: [
              24.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: activeTextField
                    ? Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          onChanged: (value) {
                            setState(() {
                              city = value;
                            });
                          },
                          onSubmitted: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                city = "Tashkent";
                              }
                              activeTextField = false;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Enter the city",
                            hintStyle: TextStyle(
                              color: AppColors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.r),
                              borderSide: BorderSide(
                                color: AppColors.black,
                                width: 1.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.r),
                              borderSide: BorderSide(
                                  color: AppColors.black, width: 1.w),
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                activeTextField = !activeTextField;
                              });
                            },
                            icon: SvgPicture.asset(
                              AppImages.search,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppImages.menu,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ],
                      ),
              ),
              FutureBuilder<MyResponse>(
                future: weatherRepository.getSimpleDataInfo(city),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(
                      child: Text(
                        data.error.toString(),
                      ),
                    );
                  }
                  if (data.hasData) {
                    if (data.data!.data == null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          30.getH(),
                          Text(
                            "Not found the city!!!",
                            style: TextStyle(
                              color: AppColors.c_303345,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    }

                    WeatherModel weatherModel =
                        (data.data as MyResponse).data as WeatherModel;
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              9.getH(),
                              Text(
                                weatherModel.name,
                                style: TextStyle(
                                  color: AppColors.c_313341,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              6.getH(),
                              Text(
                                weatherModel.dt.getParsedDate().toString(),
                                style: TextStyle(
                                  color: AppColors.c_9A938C,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              9.getH(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    weatherModel.inWeather[0].icon
                                        .getWeatherIconUrl(),
                                  ),
                                  10.getW(),
                                  SizedBox(
                                    width: 100.w,
                                    height: 70.h,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                (weatherModel.mainModel.temp -
                                                        273.15)
                                                    .round()
                                                    .toString(),
                                                style: TextStyle(
                                                  color: AppColors.c_303345,
                                                  fontSize: 43.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                weatherModel.inWeather[0].main,
                                                style: TextStyle(
                                                  color: AppColors.c_303345,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 15.w,
                                          child: SvgPicture.asset(
                                            AppImages.c,
                                            width: 23.w,
                                            height: 23.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              22.getH(),
                              const InfoItems(
                                  text1: "RainFall",
                                  text2: "3cm",
                                  icon: AppImages.umbrella),
                              5.getH(),
                              InfoItems(
                                  text1: "Wind",
                                  text2: "${weatherModel.windModel.speed}km/h",
                                  icon: AppImages.wind),
                              5.getH(),
                              InfoItems(
                                  text1: "Humidity",
                                  text2: "${weatherModel.mainModel.humidity}%",
                                  icon: AppImages.humidity),
                              14.getH(),
                              Row(
                                children: [
                                  TextButtonItems(
                                    text: "Today",
                                    onTap: () {
                                      setState(() {
                                        activeIndex = 0;
                                      });
                                    },
                                    isActive: activeIndex == 0,
                                    isIcon: false,
                                  ),
                                  12.getW(),
                                  TextButtonItems(
                                    text: "Tomorrow",
                                    onTap: () {
                                      setState(() {
                                        activeIndex = 1;
                                      });
                                    },
                                    isActive: activeIndex == 1,
                                    isIcon: false,
                                  ),
                                  const Spacer(),
                                  TextButtonItems(
                                    text: "Next 7 days",
                                    onTap: () {
                                      if (oneCallData != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NextDaysScreen(
                                              dailyModels:
                                                  oneCallData!.dailyModels,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    isActive: activeIndex == 2,
                                    isIcon: true,
                                  ),
                                ],
                              ),
                              12.getH(),
                            ],
                          ),
                        ),
                        FutureBuilder<MyResponse>(
                          future: weatherRepository.getComplexWeatherInfo(),
                          builder: (context, data) {
                            if (data.hasError) {
                              return Center(
                                child: Text(data.error.toString()),
                              );
                            }
                            if (data.hasData) {
                              if (data.data!.data == null) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    30.getH(),
                                    Text(
                                      "Not found data info",
                                      style: TextStyle(
                                        color: AppColors.c_303345,
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                );
                              }
                              oneCallData = (data.data as MyResponse).data
                                  as OneCallDataModels;
                              return Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(
                                          oneCallData!.hourlyModels.length,
                                          (index) {
                                            var hourData = oneCallData!
                                                .hourlyModels[index];
                                            return HourlyItems(
                                              onTap: () {
                                                setState(() {
                                                  activeHour = index;
                                                });
                                              },
                                              hour: hourData.dt
                                                  .toInt()
                                                  .getParsedHour(),
                                              icon: hourData.inWeather[0].icon
                                                  .getWeatherIconUrl(),
                                              temp: hourData.temp
                                                  .round()
                                                  .toString(),
                                              isActive: activeHour == index,
                                            );
                                          },
                                        ),
                                        10.getW(),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
