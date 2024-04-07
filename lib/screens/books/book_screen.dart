import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/blocs/book_bloc.dart';
import 'package:homework/blocs/book_event.dart';
import 'package:homework/blocs/book_state.dart';
import 'package:homework/screens/add/add_screen.dart';
import 'package:homework/screens/info/info_screen.dart';
import 'package:homework/utils/size_utils.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.height;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Books",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocConsumer<BookBloc, BookState>(
          builder: (context, state) {
            if (state is BookLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BookErrorState) {
              return Center(
                child: Text(state.errorText),
              );
            }
            if (state is BookSuccessState) {
              return GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                crossAxisCount: 2,
                childAspectRatio: 0.42,
                crossAxisSpacing: 5.w,
                children: [
                  ...List.generate(
                    state.books.length,
                    (index) => Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookInfoScreen(
                                bookModels: state.books[index],
                              ),
                            ),
                          );
                        },
                        onLongPress: () {
                          context.read<BookBloc>().add(
                              DeleteBookEvent(uuid: state.books[index].uuid!));
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              width: 120.w,
                              height: 190.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  state.books[index].name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            16.getW(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.getH(),
                                Text(
                                  state.books[index].name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                5.getH(),
                                Text(
                                  state.books[index].author,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${state.books[index].price.toInt()} so'm",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                60.getW(),
                                Text(
                                  "${state.books[index].rate}★",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          listener: (context, state) {}),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 30.sp,
        ),
      ),
    );
  }
}
