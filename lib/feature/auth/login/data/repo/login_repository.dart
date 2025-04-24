import 'package:dartz/dartz.dart';
import 'package:edunexus/core/error/api/exceptions/api_exception.dart';
import 'package:edunexus/core/networking/api_services.dart';
import 'package:edunexus/feature/auth/login/data/model/login_model.dart';

class LoginRepository {
  final ApiServices _apiServices;
  LoginRepository(this._apiServices);

  Future<Either<String,LoginModel>> login(String path, Map<String, dynamic> data) async {
    try {
      var response = await _apiServices.post(path, data: data);
      var result = LoginModel.fromJson(response);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.toString());
    }
  }
}