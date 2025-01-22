import 'package:get/get.dart';

validationField(int min, int max, String type, String value) {
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "برجاء ادخال رقم الهاتف الصحيح";
    }
  }

  if (type == "reason") {
    if (!GetUtils.isAlphabetOnly(value)) {
      return "برجاء ادخال السبب";
    }
  }

  if (value.isEmpty) {
    return "لا يمكن ترك الحقل فارغ";
  } else if (value.length > max) {
    return "لا يمكن ان يكون محتوي الحقل اكبر من $max";
  } else if (value.length < min) {
    return "لا يمكن ان يكون محتوي الحقل اصغر من $min";
  }
}
