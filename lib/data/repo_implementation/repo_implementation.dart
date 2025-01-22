import 'package:paseeta/data/api/connected_supabase.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';

class RepoImplementation extends RepoAbstraction {
  RepoImplementation(this.connectedSupabase);
  late ConnectedSupabase connectedSupabase;
  @override
  checkEmail(phone) async {
    final response = await connectedSupabase.selectAndFilter(
      'deliveryman',
      "deliveryman_phone",
      phone,
    );
    return response;
  }

  @override
  refreshExpired(deliverymanId) async {
    var response = await connectedSupabase.supabase
        .from('deliveryman')
        .select('deliveryman_expired')
        .filter("deliveryman_id", "eq", deliverymanId);
    return response;
  }

  @override
  insertNewExpiry(expired, deliverymanId) async {
    final response = await connectedSupabase.update(
        'deliveryman',
        {
          "deliveryman_expired": expired,
        },
        "deliveryman_id",
        deliverymanId);
    return response;
  }

  @override
  updateverifycode(verifycode, phone) async {
    final response = await connectedSupabase.update(
        'deliveryman',
        {
          "deliveryman_verifycode": verifycode,
        },
        "deliveryman_phone",
        phone);
    return response;
  }

  @override
  checkVerifyCode(phone, verifycode) async {
    final response = await connectedSupabase.selectEq(
      'deliveryman',
      "deliveryman_phone",
      "deliveryman_verifycode",
      phone,
      verifycode,
    );
    return response;
  }

  @override
  selectTask(deliverymanId, date) async {
    var response = await connectedSupabase.selectEqEq(
        'taskview',
        'task_deliveryman_id',
        "task_date",
        "task_order_status",
        deliverymanId,
        date,
        0);
    return response;
  }

  @override
  changeStatusOrderToApproved(var value, valueeq) async {
    var response = await connectedSupabase.update(
        'task',
        {
          "task_order_status": value,
        },
        "task_id",
        valueeq);
    return response;
  }

  @override
  changeStatusOrderToDelayOrCancel(
      var status, column, var value, valueeq) async {
    var response = await connectedSupabase.update(
        'task',
        {
          "task_order_status": status,
          column: value,
        },
        "task_id",
        valueeq);
    return response;
  }

  @override
  getAccounts(deliverymanId) async {
    var response = await connectedSupabase.selectAndFilter(
        'accountview', "task_deliveryman_id", deliverymanId);

    return response;
  }

  @override
  getOrderIdNotSupplying(deliverymanId) async {
    var response = await connectedSupabase.supabase
        .from('taskview')
        .select("task_order_id")
        .filter('task_deliveryman_id', 'eq', deliverymanId)
        .eq("task_order_status", 1)
        .eq("task_supplying", 0);

    return response;
  }

  @override
  supplingMoneyOfOrders(money, deliverymanId, orderCount, supplynumber) async {
    final response = connectedSupabase.insertdata(
        'supplying',
        {
          "supplying_money": money,
          "supplying_deliveryman": deliverymanId,
          "supplying_order_count": orderCount,
          "supplying_number": supplynumber,
        },
        "supplying_id");
    return response;
  }

  @override
  confirmSupply(taskOrderId, supplyingId) async {
    await connectedSupabase.update(
        'task',
        {
          "task_supplying": supplyingId,
        },
        "task_order_id",
        taskOrderId);
  }

  @override
  getAllTasksToDay(deliverymanId, date) async {
    var response = await connectedSupabase.selectEq(
        "taskview", "task_deliveryman_id", "task_date", deliverymanId, date);
    return response;
  }
}
