abstract class RepoAbstraction {
  checkEmail(phone);
  updateverifycode(verifycode, phone);
  checkVerifyCode(phone, varifycode);
  selectTask(deliverymanId, date);
  changeStatusOrderToApproved(value, valueeq);
  changeStatusOrderToDelayOrCancel(var status, column, var value, valueeq);
  getAccounts(deliverymanId);
  getOrderIdNotSupplying(deliverymanId);
  supplingMoneyOfOrders(money, deliverymanId, orderCount, supplynumber);
  confirmSupply(taskOrderId, supplyingId);
  insertNewExpiry(expired, deliverymanId);
  refreshExpired(deliverymanId);
  getAllTasksToDay(deliverymanId, date);
}
