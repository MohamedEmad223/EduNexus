import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/home/data/model/lessone_model.dart';

class SpecialLessonRepository {
  final ApiServices apiServices;
  SpecialLessonRepository(this.apiServices);

  Future<Either<String, List<LessonModel>>> getAllCourses(
    String path,
    String token,
  ) async {
    try {
      var response = await apiServices.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final lesson = LessonModel.fromJson(response);

      return Right([lesson]);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }
}
