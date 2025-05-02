import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/course_playing/data/models/get_progress_of_student_model.dart';

class GetProgressOfStudentRepo {
  final ApiServices apiServices;
  GetProgressOfStudentRepo(this.apiServices);

  Future<Either<String, GetProgressOfStudentModel>> getProgressOfStudent(
    String path,
    String token,
  ) async {
    try {
      var response = await apiServices.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      var result = GetProgressOfStudentModel.fromJson(response);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.toString());
    }
  }
}