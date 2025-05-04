import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/auth/register/data/model/sign_up_model.dart';

class SignUpRepository {
  final ApiServices _apiServices;

  SignUpRepository(this._apiServices);

  Future<Either<String, SignUpModel>> signUp(
    String path,
    Map<String, dynamic> data,
  ) async {
    try {
      var response = await _apiServices.post(path, data: data);
      var result = SignUpModel.fromJson(response);

      log(result.toString());
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message??'');
    }
  }
}
