class AppConstants {
  AppConstants._();
  static const String baseUrl =
      'https://rat-intent-hideously.ngrok-free.app/api/';
  static const String signUP = 'auth/register';
  static const String logIn = 'auth/login';
  static const String getAllCourses = 'courses';
  static const String token = '/token';
  static const String courseId = 'courseId';
  static const String lessonId = 'lessonId';
  static const String courses = 'courses';
  static const String lessons = 'lessons';
  static const String updateProfile = 'auth/me';
  static const String userId = '/userId';
  static String getCourseLessons(String courseId) {
    return 'courses/$courseId/lessons';
  }

  static String genrollCourseContent(String courseId) {
    return 'courses/$courseId/enroll';
  }

  static String getProgressOfStudent(String courseId) {
    return 'courses/$courseId/progress';
  }

  static String postCheckvideoFinish(String courseId, String lessonId) {
    return 'courses/$courseId/lessons/$lessonId/complete';
  }

  static const String myCourses = 'courses/mycourses';

  static const String onlineCardIdIntegrationId = '4125487';
  static const String mobileWalletIntegrationId = '5074299';

  static const String cardPaymentMethodIntegrationId = '5074299';
  static const String iFrameId = '783228';

  static const String apiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RnME1UUTRMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuSnd0MW5tRlQzcnpOYmpzOEFJZGpBd1BoS3piWnVVYWFCYTNFYUlnd19KcE12b3phVUh3cFBBUzZFX2pwU1VLeURyLVpSQlYzdVF1WlBMdmFQYkRMREE=';
}
