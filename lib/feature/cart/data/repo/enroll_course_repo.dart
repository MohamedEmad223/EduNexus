import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/cart/data/model/enroll_course_model.dart';

class EnrollCourseRepo {
  final ApiServices apiServices;
  EnrollCourseRepo(this.apiServices);

  Future<Either<String, EnrollCourseModel>> enrollCourse(
    String path,
    String token,
  ) async {
    try {
      var response = await apiServices.post(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      var result = EnrollCourseModel.fromJson(response);
      log(result.toString());
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }
}
