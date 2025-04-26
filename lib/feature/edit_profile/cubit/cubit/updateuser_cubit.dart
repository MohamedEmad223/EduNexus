import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/edit_profile/data/model/updata_user_model.dart';
import 'package:edunexus/feature/edit_profile/data/repos/update_user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'updateuser_state.dart';

class UpdateuserCubit extends Cubit<UpdateuserState> {
  UpdateuserCubit(this.updateUserRepository) : super(UpdateuserInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UpdateUserRepository updateUserRepository;

  Future<void> updateUser(String path, Map<String, dynamic> data) async {
    emit(UpdateuserLoading());
    final token = await CacheHelper().getSecuredData(key: AppConstants.token);
    final result = await updateUserRepository.updateUser(path, token!, data);
    result.fold(
      (error) => emit(UpdateuserError(errorMessage: error)),
      (updateUserModel) =>
          emit(UpdateuserSuccess(updateUserModel: updateUserModel)),
    );
  }
}
