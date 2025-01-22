import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/shared/custom_back_ground_image.dart';
import 'package:paseeta/core/shared/custom_button_arrow_back.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/presentation/cubit/task_cubit/task_cubit.dart';
import 'package:paseeta/presentation/view/widget/task/custom_gridview_task.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  void initState() {
    getit<TaskCubit>().getTaskToDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: BlocProvider.value(
        value: getit<TaskCubit>(),
        child: Stack(
          children: [
            const CustomBackGroundImage(),
            Positioned(top: 8.h, child: const CustomBody()),
            Positioned(
                top: context.mediaheight / 15,
                child: const CustomButtonArrowBack(
                  iconData: Icons.arrow_back,
                )),
          ],
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomGridViewTask();
  }
}
