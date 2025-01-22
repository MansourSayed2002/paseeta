import 'package:paseeta/core/class/shared_preferences.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class SupplyingMoneyOfOrderUsecase {
  SupplyingMoneyOfOrderUsecase(this.repoAbstraction);

  late RepoAbstraction repoAbstraction;

  supplyingMoney(money, orderCount, supplynumber) async {
    var deliverymanId = SharedPreferencesApp.gethive('deliveryman_id');
    List orderid = await repoAbstraction.getOrderIdNotSupplying(deliverymanId);
    if (orderid.isNotEmpty) {
      List supplyingId = await repoAbstraction.supplingMoneyOfOrders(
          money, deliverymanId, orderCount, supplynumber);

      if (supplyingId.isNotEmpty) {
        confirmSupplyTask(orderid, supplyingId);
      }
      insertexpiry(deliverymanId);
    }
  }

  insertexpiry(deliverymanId) async {
    var newExpiry =
        DateTime.now().add(const Duration(days: 1)).toString().split(" ").first;
    await repoAbstraction.insertNewExpiry(newExpiry, deliverymanId);
  }

  confirmSupplyTask(orderid, supplyingId) async {
    for (var i = 0; i < orderid.length; i++) {
      repoAbstraction.confirmSupply(
          orderid[i]['task_order_id'], supplyingId.first['supplying_id']);
    }
  }
}
