import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/bloc/book_bloc.dart';
import 'package:homework/bloc/book_event.dart';
import 'package:homework/bloc/book_state.dart';
import 'package:homework/data/model/book_model.dart';
import 'package:homework/screens/home/home_screen.dart';
import 'package:homework/services/widget_save_service.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:open_filex/open_filex.dart';
import 'package:screenshot/screenshot.dart';

import '../../services/book_manager_services.dart';

class FileManagerScreen extends StatefulWidget {
  const FileManagerScreen({super.key});

  @override
  State<FileManagerScreen> createState() => _FileManagerScreenState();
}

class _FileManagerScreenState extends State<FileManagerScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.c_FDFDFD,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.menu),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String base64Image =
                  await screenshotControllerToString(screenshotController);
              WidgetSaverService.openWidgetAsImage(
                context: context,
                widgetKey: _globalKey,
                fileId: base64Image,
              );
            },
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          Text(
            "Skills: Tech",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          ...List.generate(
            context.read<BookBloc>().state.books.length,
            (index) {
              BookModel fileDataModel =
                  context.read<BookBloc>().state.books[index];

              BookBloc fileManagerBloc = BookBloc();

              return BlocProvider.value(
                value: fileManagerBloc,
                child: BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) {
                    debugPrint("CURRENT MB: ${state.progress}");
                    String filePath = FileManagerService.isExist(
                      fileDataModel.bookUrl,
                      fileDataModel.bookName,
                    );
                    debugPrint("CURRENT MB: ${filePath}");

                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            fileDataModel.bookName,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              if (filePath.isNotEmpty) {
                                await OpenFilex.open(filePath);
                              } else {
                                fileManagerBloc.add(
                                  DownLoadEvent(
                                    bookModel: fileDataModel,
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              filePath.isNotEmpty
                                  ? Icons.check
                                  : Icons.download,
                              color: Colors.blue,
                            ),
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.network(
                              fileDataModel.imagePath,
                              width: 30.w,
                              height: 30.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: state.progress != 0,
                          child: LinearProgressIndicator(
                            value: state.progress,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
