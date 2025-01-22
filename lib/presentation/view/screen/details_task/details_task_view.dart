import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/sum_total.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/presentation/cubit/details_task_cubit/details_task_cubit.dart';
import 'package:paseeta/presentation/view/widget/details_task/card_info_fianancial_accounts.dart';
import 'package:paseeta/presentation/view/widget/details_task/card_info_order.dart';

class DetailsTaskView extends StatelessWidget {
  const DetailsTaskView({super.key, required this.task});

  final Map task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getit<DetailsTaskCubit>(),
      child: Scaffold(
        backgroundColor: ColorApp.white,
        appBar: AppBar(backgroundColor: ColorApp.white),
        body: Form(
          key: getit<DetailsTaskCubit>().key,
          child: CustomBody(
            task: task,
          ),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.task});
  final Map task;
  @override
  Widget build(BuildContext context) {
    var controller = getit<DetailsTaskCubit>();
    return ListView(
      children: [
        CardInfoOrder(
          condition: task['task_order_status'],
          name: task['user_name'],
          address: task['order_address'],
          office: task['office_name'],
          phone: task['user_phone'],
          confirmapproved: () =>
              controller.changeStatusToApproved(1, task['task_id']),
          confirmcancel: () =>
              controller.changeStatusToApproved(3, task['task_id']),
          confirmdelay: () {
            if (controller.datetoday != null) {
              controller.changeStatusOrderToDelayOrCancel(
                  2, "task_delay_date", controller.datetoday, task['task_id']);
            }
          },
        ),
        CardInfoFinancialAccounts(
          price: task['order_price'].toString(),
          shipping: task['order_shipping'].toString(),
          total:
              sumTotal(task['order_price'], task['order_shipping']).toString(),
        ),
      ],
    );
  }
}
