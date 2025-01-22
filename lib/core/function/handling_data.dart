import 'package:paseeta/core/enum/statusRequest.dart';

handlingData(response) {
  if (response is Statusrequest) {
    return response;
  } else {
    return Statusrequest.success;
  }
}
