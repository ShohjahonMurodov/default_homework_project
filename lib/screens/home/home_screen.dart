import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/my_response.dart';
import 'package:homework/data/models/product_model.dart';
import 'package:homework/data/repositories/app_repositories.dart';
import 'package:homework/screens/add/add_screen.dart';
import 'package:homework/screens/info/info_screen.dart';
import 'package:homework/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppRepositories appRepositories = AppRepositories();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<MyResponse>(
        future: appRepositories.getAllProducts(),
        builder: (BuildContext context, AsyncSnapshot<MyResponse> data) {
          if (data.hasError) {
            return Center(
              child: Text(
                data.error.toString(),
              ),
            );
          }
          if (data.hasData) {
            List<ProductModel> productsModels =
                (data.data as MyResponse).data as List<ProductModel>;

            return ListView(
              children: [
                ...List.generate(
                  productsModels.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(bottom: 10.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return InfoScreen(
                                  productModel: productsModels[index],
                                );
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.network(
                                productsModels[index].imageUrl,
                                height: 250.h,
                              ),
                            ),
                            10.getH(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    productsModels[index].productName,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    productsModels[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 22.sp, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
