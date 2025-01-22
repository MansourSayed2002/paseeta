import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/shared/custom_loading_app.dart';
import 'package:paseeta/core/shared/custom_no_data.dart';
import 'package:paseeta/presentation/cubit/task_cubit/task_cubit.dart';
import 'package:paseeta/presentation/view/widget/task/custom_card_gradview_card.dart';
import 'package:quickalert/quickalert.dart';

class CustomGridViewTask extends StatefulWidget {
  const CustomGridViewTask({super.key});

  @override
  State<CustomGridViewTask> createState() => _CustomGridViewTaskState();
}

class _CustomGridViewTaskState extends State<CustomGridViewTask> {
  @override
  Widget build(BuildContext context) {
    var controller = getit<TaskCubit>();
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (BuildContext context, TaskState state) {
        if (state is TaskError) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: "ERROR",
            text: state.message,
          );
        }
      },
      builder: (context, state) {
        return state is TaskLoading
            ? const CustomLoadingApp()
            : state is TaskNoData
                ? const CustomNoData()
                : SizedBox(
                    width: context.mediawidth,
                    height: context.mediaheight / 1,
                    child: ReorderableListView.builder(
                      header: Text("${controller.task.length}"),
                      itemCount: controller.task.length,
                      itemBuilder: (context, index) => controller.task[index]
                                  ['task_order_status'] ==
                              0
                          ? CustomCardGridViewTask(
                              key: Key("$index"),
                              name: controller.task[index]['user_name'],
                              price: controller.task[index]['order_price']
                                  .toString(),
                              date: controller.task[index]['created_at'],
                              address: controller.task[index]['order_address'],
                              ontap: () {
                                getit<TaskCubit>()
                                    .goToDetailsOfTask(controller.task[index]);
                              },
                            )
                          : const CustomNoData(),
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          controller.onReboard(oldIndex, newIndex);
                        });
                      },
                    ),
                  );
      },
    );
  }
}
