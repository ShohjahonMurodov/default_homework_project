import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/book_bloc.dart';
import 'package:homework/bloc/book_event.dart';
import 'package:homework/bloc/book_state.dart';
import 'package:homework/data/model/category_model.dart';
import 'package:homework/data/repositories/book_repository.dart';
import 'package:homework/screens/book/widgets/book_widget.dart';
import 'package:homework/screens/book/widgets/wrap_item.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:open_filex/open_filex.dart';
import '../../utils/app_colors.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String categoryString = "all";

  @override
  Widget build(BuildContext context) {
    BookBloc fileManagerBloc = BookBloc();

    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      body: SingleChildScrollView(
        child: BlocProvider.value(
          value: fileManagerBloc,
          child: BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              debugPrint("CURRENT MB: ${state.progress}");
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.getH(),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 29.w),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.c_6B6B6B,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 29.w, vertical: 5.h),
                    child: Text(
                      "The World of books",
                      style: TextStyle(
                        color: AppColors.c_263238,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  22.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: TextField(
                      style: TextStyle(
                        color: AppColors.c_979797,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textInputAction: TextInputAction.next,
                      onChanged: (v) {
                        context.read<BookBloc>().add(
                            SearchBooksEvent(searchBooks: books, value: v));
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Icon(
                            Icons.search,
                            color: AppColors.c_29BB89,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 14.h),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: AppColors.c_979797,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.white,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.white,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.white,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
                  15.getH(),
                  Column(
                    children: [
                      ...List.generate(
                        context.read<BookBloc>().state.searchBooks.length,
                        (index) {
                          return BookItem(
                            image: context
                                .read<BookBloc>()
                                .state
                                .searchBooks[index]
                                .imagePath,
                            bookName: context
                                .read<BookBloc>()
                                .state
                                .searchBooks[index]
                                .bookName,
                            newFileLocation: state.newFileLocation,
                            onTap: () async {
                              if (state.newFileLocation.isEmpty) {
                                fileManagerBloc.add(
                                  DownLoadEvent(
                                    bookModel: context
                                        .read<BookBloc>()
                                        .state
                                        .searchBooks[index],
                                  ),
                                );
                              } else {
                                await OpenFilex.open(state.newFileLocation);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  29.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 33.w),
                    child: Text(
                      "Category",
                      style: TextStyle(
                        color: AppColors.c_263238,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  11.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.h),
                    child: Wrap(
                      spacing: 11,
                      children: [
                        ...List.generate(
                          CategoryModel.values.length,
                          (index) => WrapItem(
                            title: CategoryModel.values[index].name,
                            onTap: () {
                              context.read<BookBloc>().add(
                                    CategoryBooksEvent(
                                      categoryModel:
                                          CategoryModel.values[index],
                                      books: books,
                                    ),
                                  );
                              categoryString = CategoryModel.values[index].name;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29.w),
                    child: Text(
                      "$categoryString books",
                      style: TextStyle(
                        color: AppColors.c_263238,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(25),
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 15.w,
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        children: [
                          ...List.generate(
                            context.read<BookBloc>().state.books.length,
                            (index) {
                              return BookItem(
                                image: context
                                    .read<BookBloc>()
                                    .state
                                    .books[index]
                                    .imagePath,
                                bookName: context
                                    .read<BookBloc>()
                                    .state
                                    .books[index]
                                    .bookName,
                                newFileLocation: state.newFileLocation,
                                onTap: () async {
                                  if (state.newFileLocation.isEmpty) {
                                    fileManagerBloc.add(
                                      DownLoadEvent(
                                        bookModel: context
                                            .read<BookBloc>()
                                            .state
                                            .books[index],
                                      ),
                                    );
                                  } else {
                                    await OpenFilex.open(state.newFileLocation);
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
