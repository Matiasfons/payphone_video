import "dart:convert";

import "package:http/http.dart" as http;

class Connections {
  generateLinkPayPhone(amount, tax, amountWithTax, clientTransactionId,
      currency, reference, token) async {
    var response = await http.post(
        Uri.parse('https://pay.payphonetodoesposible.com/api/Links'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({
          "amount": amount,
          "tax": tax,
          "amountWithTax": amountWithTax,
          "clientTransactionId": clientTransactionId,
          "currency": currency,
          "reference": reference,
          "expireIn": 1
        }));
    var decode = json.decode(response.body);

    return decode;
  }
}
