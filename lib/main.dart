import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/core/routes/app_rotes.dart';
import 'package:edunexus/edu_neuxus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool? showOnBoarding;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper cacheHelper = CacheHelper();
  await cacheHelper.init();
  final token = await CacheHelper().getSecuredData(key: AppConstants.token);
  runApp(EduNeuxus(appRoutes: AppRoutes(), isLoggedIn: token != null));
  ScreenUtil.ensureScreenSize();
  showOnBoarding = CacheHelper().getData(key: 'first_time_run');

  CacheHelper().saveData(key: 'first_time_run', value: true);
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['assets/fonts/poppins'], license);
  });
}
// Wallet Number: 01010101010