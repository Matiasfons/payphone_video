import 'package:payphone/cancelado.dart';
import 'package:payphone/checkout.dart';
import 'package:payphone/principal.dart';

getRoutes() {
  return {
    "/principal": (context) => PrincipalPage(),
    "/cancelado": (context) => CanceladoPage(),
  };
}
