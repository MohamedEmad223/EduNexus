import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/certificate/data/model/user_certificate_model.dart';
import 'package:edunexus/feature/certificate/data/repo/user_certificate_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'getusercertificate_state.dart';

class GetusercertificateCubit extends Cubit<GetusercertificateState> {
  GetusercertificateCubit(this.userCertificateRepo)
    : super(GetusercertificateInitial());

  final UserCertificateRepo userCertificateRepo;

  Future<void> getUserCertificate(String path) async {
    emit(GetusercertificateLoading());
    final token = await CacheHelper().getSecuredData(key: AppConstants.token)??'';
    final result = await userCertificateRepo.getAllLessons(path, token);
    result.fold(
      (error) => emit(GetusercertificateFailure(error: error)),
      (userCertificateModel) => emit(
        GetusercertificateSuccess(userCertificateModel: userCertificateModel),
      ),
    );
  }
}
