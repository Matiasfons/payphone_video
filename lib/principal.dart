import 'package:flutter/material.dart';
import 'package:payphone/checkout.dart';
import 'package:payphone/connections.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  String link = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            link.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            var response = await Connections().generateLinkPayPhone(
                                112,
                                12,
                                100,
                                "123asd",
                                "USD",
                                "Por pago de servicios",
                                "BN4vF0cWgskF6KZLonhVVglYk0A0a2pIb5zSWMHeSrHhEPSGNpMrJVGZn9rm2OxxV-6iMHJN3PNb62_HQACFaA0bhgBJYVZ11TJ-rtlQ24rjft21fdZay-6NYEOEbOgkfug5xDVqsR99XsXkFM6yJjw3AwmHFO4Eox0mny4zsbP2uYUJwA5Chi7AC3vQ6Jjt-Q7TXOenjWTlB-9eb2FaQBFTTKmwbvSyKknhmKgHHZt_V9sr1XwXZMO2Vh2LJKE5_yH32EIkJew5QU8C_BUgAQOmq9Ob5zqIHkik_KNEtmPz0YzzD7GHRarjlySJLOpQKSxCxg");

                            setState(() {
                              link = response;
                            });
                          },
                          child: Text("Generar Link y mostrar checkout"))
                    ],
                  )
                : CheckoutPage(
                    success: () async {
                      print("Completado");
                    },
                    cancel: () async {
                      print("cancelado");
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/cancelado", (route) => false);
                    },
                    expirado: () async {
                      print("expirado");
                    },
                    url: link,
                    width: 600,
                    height: 700,
                  )
          ],
        ),
      ),
    ));
  }
}
