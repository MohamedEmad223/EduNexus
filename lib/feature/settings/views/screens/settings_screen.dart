import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart' show CacheHelper;
import 'package:edunexus/core/networking/dio_handler.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/edit_profile/cubit/cubit/updateuser_cubit.dart';
import 'package:edunexus/feature/edit_profile/data/repos/update_user_repository.dart';
import 'package:edunexus/feature/edit_profile/presentation/screens/edit_peofile_screen.dart';
import 'package:edunexus/feature/settings/views/widgets/edit_row_widget.dart';
import 'package:edunexus/feature/settings/views/widgets/information_container_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings', style: AppTextStyle.poppins16w600primaryColor),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InformationContainerSettings(),
          SizedBox(height: 200.h),
          EditRowWidget(
            text: 'Edit Profile',
            imagePath: AppImages.editIcon,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => BlocProvider(
                        create:
                            (context) => UpdateuserCubit(
                              UpdateUserRepository(DioHandler()),
                            ),
                        child: EditProfileScreen(),
                      ),
                ),
              );
            },
          ),
          SizedBox(height: 20.h),

          EditRowWidget(
            text: 'log Out',
            imagePath: AppImages.logOutIcon,
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => Center(
                      child: AlertDialog(
                        content: const Text('Do you want to log out?'),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed:
                                    () => Navigator.pop(context), // Cancel
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  CacheHelper().deleteSecuredData(
                                    key: AppConstants.token,
                                  );
                                  CacheHelper().deleteSecuredData(key: 'name');
                                  CacheHelper().deleteSecuredData(key: 'email');
                                  CacheHelper().deleteSecuredData(
                                    key: 'userId',
                                  );
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
