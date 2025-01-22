import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/function/sum_total.dart';
import 'package:paseeta/core/shared/custom_loading_app.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';
import 'package:paseeta/presentation/cubit/reports_cubit/reports_cubit.dart';

import 'package:paseeta/presentation/view/widget/reports/custom_account_card.dart';
import 'package:paseeta/presentation/view/widget/reports/enter_supply_number.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getit<ReportsCubit>()..getAccount(),
      child: Scaffold(
        appBar: AppBar(),
        body: const CustomBody(),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportsCubit, ReportsState>(
      listener: (context, state) {
        if (state is ReportsError) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: "ERROR",
            text: state.message,
          );
        }
      },
      builder: (context, state) {
        return state is ReportsLoading
            ? const CustomLoadingApp()
            : Form(
                key: getit<ReportsCubit>().key,
                child: SizedBox(
                  width: context.mediawidth,
                  height: context.mediaheight,
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomAccountsCard(
                            count: state is ReportsSuccess
                                ? "${state.data.first['task_count']}"
                                : "0",
                            title: 'المهام',
                            color: ColorApp.darkblue,
                          ),
                          CustomAccountsCard(
                            count: state is ReportsSuccess
                                ? sumTotal(state.data.first['total_price'],
                                        state.data.first['total_shipping'])
                                    .toString()
                                : "0",
                            title: 'المال',
                            color: ColorApp.lightblue,
                          ),
                        ],
                      ),
                      const EnterSupplyNumber(),
                      Padding(
                        padding: EdgeInsets.all(10.0.r),
                        child: ActionSlider.standard(
                          toggleColor: ColorApp.primary,
                          action: (controller) async {
                            if (state is ReportsSuccess) {
                              QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  title: StringApp.supplying,
                                  text: StringApp.sure,
                                  onConfirmBtnTap: () async {
                                    controller.loading();
                                    await Future.delayed(
                                        const Duration(seconds: 3));
                                    getit<ReportsCubit>().validation(
                                        sumTotal(
                                            state.data.first['total_price'],
                                            state.data.first['total_shipping']),
                                        state.data.first['task_count']);
                                    controller.success();
                                  });
                            }
                          },
                          child: Text(
                            StringApp.supplying,
                            style: TextstyleApp.black30blod
                                .copyWith(fontSize: 25.0.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
