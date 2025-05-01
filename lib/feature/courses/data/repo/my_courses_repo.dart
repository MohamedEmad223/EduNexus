
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';

class MyCoursesRepo {
  final ApiServices apiServices;
  MyCoursesRepo(this.apiServices);
  Future<Either<String,List< AllCoursesModel>>> getMyCourses(
    String path,
    String token,
  ) async {
    try {
      var response = await apiServices.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      var result = AllCoursesModel.fromJsonList(response);
      log(result.toString());
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }

}
