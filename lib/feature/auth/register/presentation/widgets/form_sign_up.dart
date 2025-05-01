
import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/app_regex.dart';
import 'package:edunexus/core/helper/helper_methods.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/core/widgets/text_form_feild.dart';
import 'package:edunexus/feature/auth/login/views/widgets/lable_text.dart';
import 'package:edunexus/feature/auth/register/cubit/cubit/signup_cubit.dart';
import 'package:edunexus/feature/auth/register/presentation/widgets/drop_down_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({super.key});

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  late SignupCubit signupCubit;
  bool _isObscure = true;
  String? selectedRole;

  @override
  void initState() {
    signupCubit = BlocProvider.of<SignupCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    signupCubit.nameController.dispose();
    signupCubit.roleController.dispose();
    signupCubit.emailController.dispose();
    signupCubit.passwordController.dispose();
    signupCubit.formKey.currentState?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          HelperMethods.showLoadingAlertDialog(context);
        } else if (state is SignupSuccess) {
          Navigator.pop(context);
          HelperMethods.showCustomSnackBarSuccess(context, 'Sign Up Success');
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.login,
            (route) => false,
          );
        } else if (state is SignupError) {
          Navigator.pop(context);
          HelperMethods.showCustomSnackBarError(context, state.errorMessage!);
        }
      },
      child: Form(
        key: signupCubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              hintText: "Enter your name",
              controller: signupCubit.nameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your Name";
                } else if (AppRegex.isNameVaild(value)) {
                  return "Name must be at least 3 characters long";
                }
              },
            ),
            SizedBox(height: 20.h),
            LableText(text: "Email"),
            SizedBox(height: 10.h),
            AppTextFormField(
              hintText: "Enter your email",
              controller: signupCubit.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                }
              },
            ),
            SizedBox(height: 20.h),
            LableText(text: "Password"),
            SizedBox(height: 10.h),
            AppTextFormField(
              hintText: "Enter your password",
              controller: signupCubit.passwordController,
              keyboardType: TextInputType.visiblePassword,
              isObscureText: _isObscure,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.primaryColor,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                } else if (AppRegex.isPasswordValid(value)) {
                  return "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character";
                }
              },
            ),
            SizedBox(height: 20.h),
            LableText(text: "Role"),
            SizedBox(height: 10.h),
            DropDownWidgets(
              onRoleSelected: (role) {
                setState(() {
                  selectedRole = role;
                });
              },
            ),
            SizedBox(height: 50.h),
            SizedBox(
              height: 55.h,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  if (signupCubit.formKey.currentState!.validate()) {
                    signupCubit.signUp(AppConstants.signUP, {
                      'name': signupCubit.nameController.text,
                      'email': signupCubit.emailController.text,
                      'password': signupCubit.passwordController.text,
                      'role': selectedRole!,
                    });
                    CacheHelper().saveData(
                      key: 'name',
                      value: signupCubit.nameController.text,
                    );
                    CacheHelper().saveData(
                      key: 'email',
                      value: signupCubit.emailController.text,
                    );
                  }
                },
                color: AppColor.primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.sp),
                ),
                child: Text(
                  "Register",
                  style: AppTextStyle.poppins14BoldwhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
