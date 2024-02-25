import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/data/models/my_response.dart';
import 'package:homework/data/models/one_call/one_call_models/one_call_data_models.dart';
import 'package:homework/data/repository/weather_repository.dart';
import 'package:homework/screens/next_seven_days/widgets/days_items.dart';
import 'package:homework/screens/next_seven_days/widgets/tomorrow_items.dart';
import 'package:homework/utils/colors/app_colors.dart';
import 'package:homework/utils/extensions/my_extensions.dart';
import 'package:homework/utils/images/app_images.dart';
import 'package:homework/utils/size/size_utils.dart';

class NextDaysScreen extends StatefulWidget {
  const NextDaysScreen({super.key});

  @override
  State<NextDaysScreen> createState() => _NextDaysScreenState();
}

class _NextDaysScreenState extends State<NextDaysScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_FEE3BC,
      body: FutureBuilder(
        future: weatherRepository.getComplexWeatherInfo(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text(
                data.error.toString(),
              ),
            );
          }
          if (data.hasData) {
            OneCallDataModels oneCallDataModels =
                (data.data as MyResponse).data as OneCallDataModels;
            return Column(
              children: [
                19.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          AppImages.arrowLeft,
                          width: 16.w,
                          height: 16.h,
                        ),
                      ),
                      Text(
                        "Next 7 Days",
                        style: TextStyle(
                          color: AppColors.c_313341,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          34.getH(),
                          Container(
                            padding: EdgeInsets.only(
                                left: 11.w,
                                right: 13.w,
                                top: 12.h,
                                bottom: 19.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(.6),
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: AppColors.white.withOpacity(.8),
                                width: 1.w,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Tomorrow",
                                      style: TextStyle(
                                        color: AppColors.c_303345,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      oneCallDataModels
                                          .dailyModels[1].tempModel.day
                                          .round()
                                          .toString(),
                                      style: TextStyle(
                                        color: AppColors.c_303345,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    5.getW(),
                                    Image.network(
                                      oneCallDataModels
                                          .dailyModels[1].inWeatherModel[0].icon
                                          .getWeatherIconUrl(),
                                      width: 32.w,
                                      height: 32.h,
                                    ),
                                  ],
                                ),
                                14.getH(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TomorrowItems(
                                      icon: AppImages.umbrella,
                                      text: oneCallDataModels.dailyModels[1]
                                                  .inWeatherModel[0].main ==
                                              "Snow"
                                          ? oneCallDataModels
                                              .dailyModels[1].snow
                                              .round()
                                              .toString()
                                          : oneCallDataModels
                                              .dailyModels[1].rain
                                              .round()
                                              .toString(),
                                    ),
                                    19.getW(),
                                    TomorrowItems(
                                      icon: AppImages.wind,
                                      text:
                                          "${oneCallDataModels.dailyModels[1].windSpeed}km/h",
                                    ),
                                    19.getW(),
                                    TomorrowItems(
                                      icon: AppImages.humidity,
                                      text:
                                          "${oneCallDataModels.dailyModels[1].humidity} %",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          16.getH(),
                          ...List.generate(
                            oneCallDataModels.dailyModels.length,
                            (index) => DaysItems(
                              text1: oneCallDataModels.dailyModels[index].dt
                                  .toInt()
                                  .getWeekdayName(week),
                              text2: oneCallDataModels
                                  .dailyModels[index].tempModel.day
                                  .round()
                                  .toString(),
                              image: oneCallDataModels
                                  .dailyModels[index].inWeatherModel[0].icon
                                  .getWeatherIconUrl(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
    );
  }
}
