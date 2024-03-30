import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework/data/models/place/place_model.dart';
import 'package:homework/screens/update_map/update_map_screen.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/views/place_view/place_view_model.dart';
import 'package:homework/views/update_view/update_view_model.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    var providerListen = Provider.of<PlaceViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF2A323E),
      body: context.read<PlaceViewModel>().getLoader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.read<PlaceViewModel>().getProducts();
                  },
                );
              },
              child: Column(
                children: [
                  60.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "My addresses",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                  25.getH(),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ...List.generate(
                            providerListen.categoryProduct.length,
                            (index) {
                              PlaceModel placeModel =
                                  providerListen.categoryProduct[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF35B2E6),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        onTap: () {
                                          context
                                              .read<UpdateViewModel>()
                                              .setLatInitialLong(
                                                LatLng(
                                                  placeModel.latLng,
                                                  placeModel.latLong,
                                                ),
                                              );
                                          context
                                              .read<UpdateViewModel>()
                                              .moveToInitialPosition();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateMapScreen(
                                                placeModel: placeModel,
                                              ),
                                            ),
                                          );
                                        },
                                        leading: Image.asset(
                                          placeModel.placeCategory,
                                          width: 50.w,
                                          height: 100.h,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Home",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        subtitle: Text(
                                          placeModel.placeName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            print(
                                                "Place model id: ${placeModel.docId}----------------------------------");
                                            context
                                                .read<PlaceViewModel>()
                                                .deleteProduct(
                                                    placeModel, context);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    15.getH(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: SizedBox(
        width: 65.w,
        height: 65.h,
        child: FloatingActionButton(
          onPressed: () {
            providerListen.getProducts();
          },
          child: const Icon(
            Icons.replay,
            size: 40,
          ),
        ),
      ),
    );
  }
}
