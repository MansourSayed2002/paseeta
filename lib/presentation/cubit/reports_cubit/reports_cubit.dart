import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:paseeta/domain/usecase/reports/accounts_deliveryman_usecase.dart';
import 'package:paseeta/domain/usecase/reports/supplying_money_of_order_usecase.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(
      this.accountsDeliverymanUsecase, this.supplyingMoneyOfOrderUsecase)
      : super(ReportsInitial());

  late AccountsDeliverymanUsecase accountsDeliverymanUsecase;

  late SupplyingMoneyOfOrderUsecase supplyingMoneyOfOrderUsecase;

  TextEditingController supplyNumber = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  List accounts = [];

  getAccount() async {
    try {
      var response = await accountsDeliverymanUsecase.getAccounts();
      accounts = response;
      if (accounts.isNotEmpty) {
        emit(ReportsSuccess(accounts));
      } else {
        emit(ReportsNoData());
      }
    } catch (e) {
      emit(ReportsError(e.toString()));
    }
  }

  supplying(money, ordercount) async {
    emit(ReportsLoading());
    try {
      await supplyingMoneyOfOrderUsecase.supplyingMoney(
        money,
        ordercount,
        supplyNumber.text,
      );
      supplyNumber.clear();
      getAccount();
    } catch (e) {
      ReportsError(e.toString());
    }
  }

  validation(money, ordercount) {
    final form = key.currentState;
    Get.back();
    if (form!.validate()) {
      supplying(money, ordercount);
    } else {
      print('validate');
    }
  }
}
