import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:paseeta/core/class/get_navigator.dart';
import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/domain/usecase/Home/check_expire_usecase.dart';
import 'package:paseeta/domain/usecase/Home/refresh_expired_date.dart';
import 'package:paseeta/presentation/view/screen/profile/profile_view.dart';
import 'package:paseeta/presentation/view/screen/reports/reports_view.dart';
import 'package:paseeta/presentation/view/screen/settings/settings_view.dart';
import 'package:paseeta/presentation/view/screen/status/status_view.dart';
import 'package:paseeta/presentation/view/screen/task/task_view.dart';
import 'package:quickalert/quickalert.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.checkExpireUsecase, this.refreshExpiredDate)
      : super(HomeInitial());

  late CheckExpireUsecase checkExpireUsecase;

  late RefreshExpiredDate refreshExpiredDate;

  GlobalKey<FormState> key = GlobalKey<FormState>();

  checkExpire() {
    checkExpireUsecase.checkExpireAccount();
  }

  gototaskpage() {
    if (SharedPreferencesApp.gethive('expired') == "0") {
      GetNavigatorApp.to(() => const TaskView());
    } else if (SharedPreferencesApp.gethive('expired') == "2") {
      QuickAlert.show(
        context: key.currentContext!,
        type: QuickAlertType.error,
        title: StringApp.opps,
        text: StringApp.sentence2,
      );
    } else {
      QuickAlert.show(
        context: key.currentContext!,
        type: QuickAlertType.error,
        title: StringApp.opps,
        text: StringApp.sentence,
      );
    }
  }

  refreshExpired() async {
    await refreshExpiredDate.refreshexpiredData();
    checkExpire();
  }

  gotosettingpage() {
    GetNavigatorApp.to(() => const SettingsView());
  }

  gotostatuspage() {
    GetNavigatorApp.to(() => const StatusView());
  }

  gotoprofilepage() {
    GetNavigatorApp.to(() => const ProfileView());
  }

  gotoreportspage() {
    GetNavigatorApp.to(() => const ReportsView());
  }
}
