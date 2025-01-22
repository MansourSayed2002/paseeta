import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/domain/usecase/detail_task/change_status_of_order_usecase.dart';
import 'package:paseeta/presentation/cubit/task_cubit/task_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

part 'details_task_state.dart';

class DetailsTaskCubit extends Cubit<DetailsTaskState> {
  DetailsTaskCubit(this.changeStatusOfOrderUsecase)
      : super(DetailsTaskInitial());

  late ChangeStatusOfOrderUsecase changeStatusOfOrderUsecase;
  TextEditingController reason = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  String? datetoday;

  changeStatusToApproved(var value, valueeq) async {
    await changeStatusOfOrderUsecase.changeStatusOrderToApproved(
        value, valueeq);
    Get.back();
    Get.back();
    getit<TaskCubit>().getTaskToDay();
  }

  changeStatusOrderToDelayOrCancel(status, column, var value, valueeq) async {
    await changeStatusOfOrderUsecase.changeStatusOrderToDelayOrCancel(
        status, column, value, valueeq);
    Get.back();
    Get.back();
    getit<TaskCubit>().getTaskToDay();
  }

  chooseToDelayDelivery() {
    showDatePicker(
      context: key.currentContext!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    ).then(
      (value) {
        datetoday = value.toString().split(" ").first;
      },
    );
  }

  validation(status, column, var value, valueeq) {
    var form = key.currentState;
    if (form!.validate()) {
      changeStatusOrderToDelayOrCancel(status, column, value, valueeq);
    } else {
      print("validate");
    }
  }

  callClient(phone) async {
    final url = Uri(scheme: 'tel', path: phone.toString());
    if (!await canLaunchUrl(Uri.parse(url.toString()))) {
      throw Exception('Could not launch $phone');
    } else {
      await launchUrl(url);
    }
  }
}
