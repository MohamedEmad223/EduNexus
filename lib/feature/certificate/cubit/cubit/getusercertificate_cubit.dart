import 'package:bloc/bloc.dart';
import 'package:edunexus/feature/certificate/data/model/user_certificate_model.dart';
import 'package:meta/meta.dart';

part 'getusercertificate_state.dart';

class GetusercertificateCubit extends Cubit<GetusercertificateState> {
  GetusercertificateCubit() : super(GetusercertificateInitial());
}
