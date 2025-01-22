import 'package:supabase_flutter/supabase_flutter.dart';

class ConnectedSupabase {
  var supabase = Supabase.instance.client;

  selectAndFilter(table, namecolumn, valuecolumn) async {
    final response = await supabase
        .from(table)
        .select()
        .filter(namecolumn, "eq", valuecolumn);

    return response;
  }

  update(table, Map update, columneq, valueeq) async {
    final response =
        await supabase.from(table).update(update).eq(columneq, valueeq);
    return response;
  }

  selectEq(table, filterColumn, columnEq, filterValue, valueEq) async {
    final response = await supabase
        .from(table)
        .select()
        .filter(filterColumn, "eq", filterValue)
        .eq(columnEq, valueEq);
    return response;
  }

  selectEqEq(table, filterColumn, columnEq, columnEq2, filterValue, valueEq,
      valueEq2) async {
    final response = await supabase
        .from(table)
        .select()
        .filter(filterColumn, "eq", filterValue)
        .eq(columnEq, valueEq)
        .eq(columnEq2, valueEq2);
    return response;
  }

  select(table) async {
    var response = await supabase.from(table).select();
    return response;
  }

  insertdata(table, Map values, selectcolumn) async {
    var response =
        await supabase.from(table).insert(values).select(selectcolumn);
    return response;
  }
}
