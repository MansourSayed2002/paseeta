import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:paseeta/core/class/get_navigator.dart';
import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/core/enum/statusRequest.dart';
import 'package:paseeta/core/function/handling_data.dart';
import 'package:paseeta/domain/usecase/verifycode/check_verifycode.dart';
import 'package:quickalert/quickalert.dart';

part 'verifycode_state.dart';

class VerifycodeCubit extends Cubit<VerifycodeState> {
  VerifycodeCubit(this.checkVerifycodeUseCase) : super(VerifycodeInitial());

  late CheckVerifycodeUseCase checkVerifycodeUseCase;

  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController opt = TextEditingController();

  checkverifycode() async {
    statusrequest = Statusrequest.loading;
    var response = await checkVerifycodeUseCase.checkVerifyCode(
        SharedPreferencesApp.gethive('deliveryman_phone'), opt.text);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      SharedPreferencesApp.setstring('step', '2');
      GetNavigatorApp.offAllNamed("/HomeView");
    } else {
      QuickAlert.show(
        context: key.currentContext!,
        type: QuickAlertType.warning,
        title: 'Oops...',
        text: 'Sorry,There Is Error In Verify-Code',
      );
    }
  }
}
