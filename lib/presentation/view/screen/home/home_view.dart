import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/image/image_app.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';
import 'package:paseeta/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:paseeta/presentation/view/widget/home/custom_appbar.dart';
import 'package:paseeta/presentation/view/widget/home/custom_gridview_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).checkExpire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: getit<HomeCubit>().key,
      backgroundColor: ColorApp.white,
      appBar: PreferredSize(
          preferredSize: Size(context.mediawidth, context.mediaheight / 6),
          child: const CustomAppBar()),
      body: RefreshIndicator(
          onRefresh: () async {
            getit<HomeCubit>().refreshExpired();
          },
          child: const CustomBody()),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = getit<HomeCubit>();
    return Container(
      width: context.mediawidth,
      padding: EdgeInsets.symmetric(horizontal: 10.0.r),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 5.0.h),
            child: Text(
              'مرحبا\n${SharedPreferencesApp.gethive('deliveryman_name')}',
              style: TextstyleApp.black30blod
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 5,
            ),
            children: [
              CustomGridViewCard(
                color: ColorApp.lightgreen,
                image: ImageApp.task,
                title: StringApp.task,
                ontap: () {
                  controller.gototaskpage();
                },
              ),
              CustomGridViewCard(
                color: ColorApp.darkblue,
                image: ImageApp.profile,
                title: StringApp.profile,
                ontap: () {
                  controller.gotoprofilepage();
                },
              ),
              CustomGridViewCard(
                color: ColorApp.pink,
                image: ImageApp.status,
                title: StringApp.status,
                ontap: () {
                  controller.gotostatuspage();
                },
              ),
              CustomGridViewCard(
                color: ColorApp.primary,
                image: ImageApp.reports,
                title: StringApp.reports,
                ontap: () {
                  controller.gotoreportspage();
                },
              ),
              CustomGridViewCard(
                color: ColorApp.lightblue,
                image: ImageApp.setting,
                title: StringApp.setting,
                ontap: () {
                  controller.gotosettingpage();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
