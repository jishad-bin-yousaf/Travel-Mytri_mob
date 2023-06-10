import 'dart:developer';

import 'package:hive/hive.dart';

import 'general_resp.dart';

part '../gen/hive_class_functions.g.dart';

@HiveType(typeId: 1)
class Token {
  @HiveField(0)
  String? token;
  @HiveField(1)
  bool? isUser;
  @HiveField(2)
  String? fullName;
  @HiveField(3)
  String? firstName;
  @HiveField(4)
  String? lastName;
  @HiveField(5)
  String? userId;
}

class UserData {
  String? fullName;
  String? firstName;
  String? lastName;
  String? userId;
}

Future<String> setToken(Token token) async {
  final tokenDB = await Hive.openBox<Token>("token_DB");

  log(tokenDB.length.toString());

  try {
    if (tokenDB.isEmpty) {
      tokenDB.add(token);
      log(tokenDB.length.toString());
      log(tokenDB.values.last.token.toString());

      // tokenDB.close();
    } else {
      log("Elseeeeeeee");
      log("Before clr " + tokenDB.length.toString());
      tokenDB.clear();
      log("after clr " + tokenDB.length.toString());
      tokenDB.add(token);

      log("after add " + tokenDB.length.toString());
      log(tokenDB.values.last.token.toString());
      //  getToken();
      return tokenDB.values.last.token ?? "";
    }
  } catch (e) {
    log(e.toString());
  }
  return '';
}

Future<Token> getToken() async {
  final tokenDB = await Hive.openBox<Token>("token_DB");
  print(tokenDB.length);
  try {
    final token = tokenDB.values.first;
    // log(tokenDB.values.first.token.toString());
    // tokenDB.close();

    return token;
  } catch (e) {
    // log(tokenDB.values.first.token.toString());
    tokenDB.close();

    log(e.toString());
  }
  // tokenDB.close();

  return Token();
}
