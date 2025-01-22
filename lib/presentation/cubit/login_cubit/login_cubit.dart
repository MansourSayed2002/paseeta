import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paseeta/core/class/get_navigator.dart';
import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/enum/statusRequest.dart';
import 'package:paseeta/core/function/handling_data.dart';
import 'package:paseeta/domain/usecase/login/check_email_usecase.dart';
import 'package:paseeta/domain/usecase/login/create_and_send_verify_code.dart';
import 'package:paseeta/presentation/view/screen/auth/verifycode_view.dart';
import 'package:quickalert/quickalert.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.checkEmailUsecase, this.createAndSendVerifyCode)
      : super(LoginInitial());

  late CheckEmailUsecase checkEmailUsecase;
  late CreateAndSendVerifyCode createAndSendVerifyCode;
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  Statusrequest statusrequest = Statusrequest.none;
  bool obscure = true;

  hiddenpassword() {
    obscure == true ? obscure = false : obscure = true;
    emit(LoginInitial());
  }

  logIn() async {
    statusrequest = Statusrequest.loading;
    final response = await checkEmailUsecase.checkemailUse(phone.text);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      savedata(response);
      createAndSendVerifyCode.createAndSendVerifyCode(phone.text);
      GetNavigatorApp.to(() => const VerifyCodeview());
    } else {
      QuickAlert.show(
        context: key.currentContext!,
        type: QuickAlertType.error,
        title: StringApp.opps,
        text: StringApp.phonesure,
      );
    }
  }

  savedata(response) {
    SharedPreferencesApp.sethive(
        'deliveryman_id', response[0]['deliveryman_id']);
    SharedPreferencesApp.sethive(
        'deliveryman_name', response[0]['deliveryman_name']);
    SharedPreferencesApp.sethive(
        'deliveryman_phone', response[0]['deliveryman_phone']);
    SharedPreferencesApp.sethive(
        'deliveryman_egoogle', response[0]['deliveryman_egoogle']);
    SharedPreferencesApp.sethive(
        'deliveryman_expired', response[0]['deliveryman_expired']);
  }

  validation() {
    final form = key.currentState;
    if (form!.validate()) {
      logIn();
    } else {
      print('validate');
    }
  }
}
