import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/auth/auth_bloc.dart';
import 'package:homework/bloc/auth/auth_state.dart';
import 'package:homework/data/local/local_variables.dart';
import 'package:homework/screens/auth/login/login_screen.dart';
import 'package:homework/screens/auth/widgets/ok_button.dart';
import 'package:homework/screens/auth/widgets/text_input.dart';
import 'package:homework/screens/contacts/contact_screen.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../../bloc/auth/auth_event.dart';
import '../../../view/image_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final picker = ImagePicker();
  String storagePath = "";

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthErrorState) {
            return Center(
              child: Text(state.errorText),
            );
          }
          if (state is AuthInitialState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  50.getH(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      onPressed: () {
                        // showImageDialog(
                        //   context,
                        //   onChaneXFile: (ChangeImage changeImage) {
                        //     xFile = changeImage.xFile;
                        //     setState(() {});
                        //   },
                        // );
                      },
                      child: Container(
                        width: 200.w,
                        height: 200.h,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          // image: xFile != null
                          //     ? DecorationImage(
                          //         image: FileImage(File(xFile!.path)),
                          //         fit: BoxFit.cover,
                          //       )
                          //     : null,
                        ),
                      ),
                    ),
                  ),
                  16.getH(),
                  Text(
                    "REGISTER",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  50.getH(),
                  TextInputMyWidget(
                    hitText: 'Enter name',
                    textEditingController: nameController,
                  ),
                  TextInputMyWidget(
                    hitText: 'Enter email',
                    textEditingController: emailController,
                  ),
                  TextInputMyWidget(
                    hitText: 'Enter password',
                    textEditingController: passwordController,
                  ),
                  OkButton(
                    title: "Take a image",
                    onTab: () {
                      takeAnImage();
                    },
                  ),
                  60.getH(),
                  OkButton(
                    title: 'LOGIN',
                    onTab: () {
                      if (nameController.text.isEmpty &&
                          emailController.text.isEmpty &&
                          passwordController.text.isEmpty) {
                        _showSnackBar();
                      } else {
                        debugPrint('$imageUrl---------------------');
                        context.read<AuthBloc>().add(
                              AuthRegisterEvent(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                imageUrl: imageUrl,
                              ),
                            );
                      }
                    },
                  ),
                  50.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state is AuthSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> _getImageFromCamera() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image != null && context.mounted) {
      debugPrint("IMAGE PATH:${image.path}");
      storagePath = "files/images/${image.name}";
      imageUrl = await context.read<ImageViewModel>().uploadImage(
            pickedFile: image,
            storagePath: storagePath,
          );

      debugPrint("DOWNLOAD URL:$imageUrl");
    }
  }

  Future<void> _getImageFromGallery() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image != null && context.mounted) {
      debugPrint("IMAGE PATH:${image.path}");
      storagePath = "files/images/${image.name}";
      imageUrl = await context.read<ImageViewModel>().uploadImage(
            pickedFile: image,
            storagePath: storagePath,
          );

      debugPrint("DOWNLOAD URL:$imageUrl");
    }
  }

  takeAnImage() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.h),
              ListTile(
                onTap: () async {
                  _getImageFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo_album_outlined),
                title: const Text("Gallereyadan olish"),
              ),
              ListTile(
                onTap: () async {
                  _getImageFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Kameradan olish"),
              ),
              SizedBox(height: 24.h),
            ],
          );
        });
  }

  _showSnackBar({String title = "Empty input"}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        ),
      ),
    );
  }
}
