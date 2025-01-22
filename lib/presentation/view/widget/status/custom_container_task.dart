import 'package:flutter/material.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/di/di.dart';
import 'package:paseeta/presentation/cubit/status_cubit/status_cubit.dart';
import 'package:paseeta/presentation/view/widget/task/custom_card_gradview_card.dart';

class CustomContainerTask extends StatelessWidget {
  const CustomContainerTask({
    super.key,
    required this.data,
    required this.condetion,
  });
  final List data;
  final int condetion;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediawidth,
      height: context.mediaheight,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) =>
            data[index]['task_order_status'] == condetion
                ? CustomCardGridViewTask(
                    name: data[index]['user_name'],
                    price: data[index]['order_price'].toString(),
                    date: data[index]['created_at'],
                    address: data[index]['order_address'],
                    ontap: () {
                      getit<StatusCubit>().goToDetailsTask(data[index]);
                    },
                  )
                : const SizedBox(),
      ),
    );
  }
}
