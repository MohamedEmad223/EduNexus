import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/edit_profile/data/model/updata_user_model.dart';

class UpdateUserRepository {
  final ApiServices apiServices;

  UpdateUserRepository(this.apiServices);

  Future<Either<String, UpdateUserModel>> updateUser(
    String path,
    String token,
    Map<String, dynamic> data,
  ) async {
    try {
      await apiServices.patch(
        path,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      var result = UpdateUserModel.fromJson(data);
      log(result.toString());
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }
}
