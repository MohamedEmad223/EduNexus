import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/certificate/data/model/user_certificate_model.dart';

class UserCertificateRepo {
  final ApiServices apiServices;
  UserCertificateRepo( this.apiServices);

  Future<Either<String, UserCertificateModel>> getAllLessons(
    String path,
    String token,
  ) async {
    try {
      var response = await apiServices.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      var result = UserCertificateModel.fromJson(response);
      log(result.toString());
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message??'');
    }
  }
}
