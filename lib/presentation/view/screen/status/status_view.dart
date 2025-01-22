import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/shared/custom_loading_app.dart';
import 'package:paseeta/core/shared/custom_no_data.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/presentation/cubit/status_cubit/status_cubit.dart';
import 'package:paseeta/presentation/view/widget/status/custom_container_task.dart';
import 'package:paseeta/presentation/view/widget/status/tabs.dart';
import 'package:quickalert/quickalert.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  @override
  void initState() {
    getit<StatusCubit>().allTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabs,
            dividerColor: ColorApp.primary,
            labelColor: ColorApp.black,
            indicatorColor: ColorApp.black,
          ),
        ),
        body: BlocProvider.value(
          value: getit<StatusCubit>(),
          child: const CustomBody(),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatusCubit, StatusState>(
      listener: (context, state) {
        if (state is StatusError) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: "ERROR",
            text: state.message,
          );
        }
      },
      builder: (context, state) {
        return state is StatusLoading
            ? const CustomLoadingApp()
            : state is StatusNoData
                ? const CustomNoData()
                : state is StatusSuccess
                    ? TabBarView(
                        children: [
                          CustomContainerTask(
                            data: state.data,
                            condetion: 1,
                          ),
                          CustomContainerTask(
                            data: state.data,
                            condetion: 2,
                          ),
                          CustomContainerTask(
                            data: state.data,
                            condetion: 3,
                          ),
                        ],
                      )
                    : const SizedBox();
      },
    );
  }
}
