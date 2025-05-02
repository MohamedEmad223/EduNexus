import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/course_playing/data/models/video_check_model.dart';

class VideoCheckRepo {
  final ApiServices apiServices;
  VideoCheckRepo(this.apiServices);

  Future<Either<String, CheckVideoModel>> checkVideo(
    String path,
    String token,
  ) async {
    try {
      var response = await apiServices.post(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      var result = CheckVideoModel.fromJson(response);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.toString());
    }
  }
}
