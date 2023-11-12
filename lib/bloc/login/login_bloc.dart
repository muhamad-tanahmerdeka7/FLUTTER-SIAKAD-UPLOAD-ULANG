import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muhamad_flutter_siakad_app/data/datasource/auth_remote_datasource.dart';
import 'package:muhamad_flutter_siakad_app/data/models/request/auth_request_model.dart';
import 'package:muhamad_flutter_siakad_app/data/models/response/auth_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      final response = await AuthRemoteDatasource().login(event.requestModel);
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
