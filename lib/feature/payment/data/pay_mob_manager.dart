import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edunexus/core/helper/app_constants.dart';

class PayMobManager {
  final dio = Dio();
  Future<String> getPaymentKey(int amount, String currency) async {
    try {
      String authenticationToken = await _getAuthenticationToken();
      int orderId = await _getOrderId(
        authanticationToken: authenticationToken,
        amount: (amount * 100).toString(),
        currency: currency,
      );
      String paymentKey = await _getPaymentKey(
        authanticationToken: authenticationToken,
        amount: (amount * 100).toString(),
        orderId: orderId.toString(),
        currency: currency,
      );
      return paymentKey;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get payment key');
    }
  }

  Future<String> _getAuthenticationToken() async {
    final Response response = await dio.post(
      'https://accept.paymob.com/api/auth/tokens',
      data: {"api_key": AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      throw Exception('Failed to get authentication token');
    }
  }

  Future<int> _getOrderId({
    required String authanticationToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/ecommerce/orders",
      data: {
        "auth_token": authanticationToken,
        "amount_cents": amount, //  >>(STRING)<<
        "currency": currency, //Not Req
        "delivery_needed": "false",
        "items": [],
      },
    );
    return response.data["id"]; //INTGER
  }

  Future<String> _getPaymentKey({
    required String authanticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/acceptance/payment_keys",
      data: {
        //ALL OF THEM ARE REQIERD
        "expiration": 3600,

        "auth_token": authanticationToken, //From First Api
        "order_id": orderId, //From Second Api  >>(STRING)<<
        "integration_id":
            AppConstants
                .cardPaymentMethodIntegrationId, //Integration Id Of The Payment Method

        "amount_cents": amount,
        "currency": currency,

        "billing_data": {
          //Have To Be Values
          "first_name": "Clifford",
          "last_name": "Nicolas",
          "email": "claudette09@exa.com",
          "phone_number": "+86(8)9135210487",

          //Can Set "NA"
          "apartment": "NA",
          "floor": "NA",
          "street": "NA",
          "building": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "EG",
          "state": "NA",
        },
      },
    );
    return response.data["token"];
  }
}
