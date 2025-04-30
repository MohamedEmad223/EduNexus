import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/app_regex.dart';
import 'package:edunexus/core/helper/helper_methods.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/core/widgets/text_form_feild.dart';
import 'package:edunexus/feature/auth/login/cubit/cubit/login_cubit.dart';
import 'package:edunexus/feature/auth/login/views/widgets/do_not_have_an_account.dart';
import 'package:edunexus/feature/auth/login/views/widgets/lable_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormOfLoginScreen extends StatefulWidget {
  const FormOfLoginScreen({super.key});

  @override
  State<FormOfLoginScreen> createState() => _FormOfLoginScreenState();
}

class _FormOfLoginScreenState extends State<FormOfLoginScreen> {
  late LoginCubit loginCubit;
  bool _isObscure = true;
  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    loginCubit.emailController.dispose();
    loginCubit.passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          HelperMethods.showLoadingAlertDialog(context);
        } else if (state is LoginSuccess) {
          Navigator.pop(context);
          HelperMethods.showCustomSnackBarSuccess(
            context,
            'Login Success , Welcome!',
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.botNavBar,
            (route) => false,
          );
          state.loginModel?.token != null
              ? CacheHelper().saveSecuredData(
                key: AppConstants.token,
                value: state.loginModel!.token!,
              )
              : null;
          state.loginModel?.user?.sId != null
              ? CacheHelper().saveSecuredData(
                key: 'userId',
                value: state.loginModel!.user!.sId!,
              )
              : null;
        } else if (state is LoginError) {
          Navigator.pop(context);
          HelperMethods.showCustomSnackBarError(context, state.errorMessage!);
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: loginCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LableText(text: "Email"),
              SizedBox(height: 10.h),
              AppTextFormField(
                controller: loginCubit.emailController,
                keyboardType: TextInputType.emailAddress,

                hintText: "Enter your email",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              LableText(text: "Password"),
              SizedBox(height: 10.h),
              AppTextFormField(
                controller: loginCubit.passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: "Enter your password",
                isObscureText: _isObscure,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
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
                },
              ),
              SizedBox(height: 80.h),
              SizedBox(
                height: 55.h,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    if (loginCubit.formKey.currentState!.validate()) {
                      loginCubit.login(AppConstants.logIn, {
                        'email': loginCubit.emailController.text,
                        'password': loginCubit.passwordController.text,
                      });
                    }
                    CacheHelper().saveData(
                      key: 'email',
                      value: loginCubit.emailController.text,
                    );
                  },
                  color: AppColor.primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                  child: Text(
                    "Login",
                    style: AppTextStyle.poppins14BoldwhiteColor,
                  ),
                ),
              ),
              DoNotHaveAnAccount(
                text: "Register",
                onPressed:
                    () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/register',
                      (route) => false,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
