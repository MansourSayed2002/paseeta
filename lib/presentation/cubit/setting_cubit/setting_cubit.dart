import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paseeta/domain/usecase/setting/log_out_usecase.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.logOutUsecase) : super(SettingInitial());

  late LogOutUsecase logOutUsecase;

  logOut() {
    logOutUsecase.logOut();
  }
}
