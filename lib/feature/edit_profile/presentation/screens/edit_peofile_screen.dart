import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/app_regex.dart';
import 'package:edunexus/core/helper/helper_methods.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/core/widgets/text_form_feild.dart';
import 'package:edunexus/feature/edit_profile/cubit/cubit/updateuser_cubit.dart';
import 'package:edunexus/feature/edit_profile/presentation/widgets/image_container_widgets.dart';
import 'package:edunexus/feature/home/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late UpdateuserCubit updateuserCubit;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    updateuserCubit = context.read<UpdateuserCubit>();
    
  }

  clear() {
    updateuserCubit.nameController.clear();
    updateuserCubit.emailController.clear();
    updateuserCubit.passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: AppTextStyle.poppins16w600primaryColor,
        ),
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
      ),
      body: SafeArea(
        child: BlocListener<UpdateuserCubit, UpdateuserState>(
          listener: (context, state) {
            if (state is UpdateuserLoading) {
              HelperMethods.showLoadingAlertDialog(context);
            }
            if (state is UpdateuserSuccess) {
              Navigator.pop(context);
              HelperMethods.showCustomSnackBarSuccess(
                context,
                "update success",
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
            }
            if (state is UpdateuserError) {
              Navigator.pop(context);
              HelperMethods.showCustomSnackBarError(
                context,
                state.errorMessage,
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
              child: Form(
                key: updateuserCubit.formKey,
                child: Column(
                  children: [
                    ImageContainerWidgets(),
                    SizedBox(height: 50.h),
                    AppTextFormField(
                      hintText: 'Enter your name',
                      controller: updateuserCubit.nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Name";
                        } else if (AppRegex.isNameVaild(value)) {}
                      },
                      backgroundColor: AppColor.lightPinkColor,
                    ),
                    SizedBox(height: 20.h),

                    AppTextFormField(
                      controller: updateuserCubit.emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Enter your email",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        } else if (AppRegex.isEmailValid(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                      backgroundColor: AppColor.lightPinkColor,
                    ),
                    SizedBox(height: 20.h),

                    AppTextFormField(
                      hintText: "Enter your password",
                      isObscureText: !_isObscure,
                      suffixIcon: InkWell(
                        onTap:
                            () => setState(() {
                              _isObscure = !_isObscure;
                            }),
                        child:
                            _isObscure
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } else if (AppRegex.isPasswordValid(value)) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                      backgroundColor: AppColor.lightPinkColor,
                    ),
                    SizedBox(height: 50.h),
                    SizedBox(
                      height: 55.h,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (updateuserCubit.formKey.currentState!
                              .validate()) {
                            updateuserCubit
                                .updateUser(AppConstants.updateProfile, {
                                  'name': updateuserCubit.nameController.text,
                                  'email': updateuserCubit.emailController.text,
                                });
                          }
                        },
                        color: AppColor.primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.sp),
                        ),
                        child: Text(
                          "Update",
                          style: AppTextStyle.poppins14BoldwhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
