import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/scanner_bloc.dart';
import 'package:homework/bloc/scanner_event.dart';
import 'package:homework/bloc/scanner_state.dart';
import 'package:homework/data/models/form_status.dart';
import 'package:homework/services/widget_save_sirvice.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(.84),
      body: BlocBuilder<ScannerBloc, ScannerState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == FormStatus.error) {
            return Center(
              child: Text(state.statusText),
            );
          }
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 46.w, right: 31.w, top: 41.h),
                child: Row(
                  children: [
                    Text(
                      "History",
                      style: TextStyle(
                        color: AppColors.c_D9D9D9,
                        fontSize: 27.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        backgroundColor: AppColors.c_333333.withOpacity(.84),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.menu,
                        size: 30.sp,
                        color: AppColors.c_FDB623,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return RepaintBoundary(
                      key: Key(state.products[index].qrCode),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.c_333333.withOpacity(.84),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 46.w, vertical: 10.h),
                        child: ListTile(
                          onTap: () async {
                            Uri uri = Uri.parse(state.products[index].qrCode);
                            await launchUrl(uri);
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      20.r,
                                    ),
                                  ),
                                  backgroundColor: const Color(0xFF252525),
                                  title: Text(
                                    "Do you want to install or save?",
                                    style: TextStyle(
                                      color: const Color(0xFFCFCFCF),
                                      fontSize: 23.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 112.w,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFFFF0000),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  5.r,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              WidgetSaverService
                                                  .openWidgetAsImage(
                                                context: context,
                                                widgetKey: _globalKey,
                                                fileId: state
                                                    .products[index].qrCode,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Share",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 112.w,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF30BE71),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  5.r,
                                                ),
                                              ),
                                            ),
                                            onPressed: () async {
                                              WidgetSaverService
                                                  .saveWidgetToGallery(
                                                context: context,
                                                widgetKey: _globalKey,
                                                fileId: state
                                                    .products[index].qrCode,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Download",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          leading: SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: QrImageView(
                              data: state.products[index].qrCode,
                              version: QrVersions.auto,
                              size: 100,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<ScannerBloc>().add(
                                  RemoveScannerEvent(
                                      scannerId: state.products[index].id!));
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              size: 30.sp,
                              color: AppColors.c_FDB623,
                            ),
                          ),
                          title: Text(
                            state.products[index].qrCode,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Text(
                            state.products[index].name,
                            style: TextStyle(
                              color: AppColors.c_A4A4A4,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
