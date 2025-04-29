import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';

class PayMobManager {
  final dio = Dio();

  Future<String> getToken() async {
    try {
      Response response = await dio.post(
        'https://accept.paymob.com/api/auth/tokens',
        data: {"api_key": AppConstants.apiKey},
      );
      return response.data['token'];
    } catch (e) {
      log('Error: ${e.toString()}');
      throw Exception('Failed to retrieve token');
    }
  }

  Future<String> getOrderId({
    required String token,
    required String amount,
  }) async {
    try {
      Response response = await dio.post(
        'https://accept.paymob.com/api/ecommerce/orders',
        data: {
          "auth_token": token,
          "delivery_needed": "true",
          "amount_cents": amount,
          "currency": "EGP",
          "items": [],
        },
      );
      return response.data['id'];
    } catch (e) {
      log('Error: ${e.toString()}');
      throw Exception('Failed to retrieve order ID');
    }
  }

  Future<String> getPaymentKey({
    required String token,
    required String orderId,
    required String amount,
  }) async {
    
    
    Response response = await dio.post(
      'https://accept.paymob.com/api/acceptance/payment_keys',
      data: {
        "auth_token": token,
        "amount_cents": "100",
        "expiration": 3600,
        "order_id": orderId,
        "integration_id": 4539675,
        "billing_data": {
          "apartment": "803",
          "email": CacheHelper().getData(key: 'email'),
          "floor": "NA",
          "first_name": CacheHelper().getData(key: 'name'),
          "street": "NA",
          "building": "12",
          "phone_number": "01000000000",
          "shipping_method": "PKG",
          "postal_code": "12345",
          "city": "Cairo",
          "country": "Egypt",
          "last_name": "Ali",
          "state": "Cairo",
        },
      },
    );
    return response.data['token'];
  }

  Future<String> patWithPayMob(int amount) async {
    try {
      String token = await getToken();
      String orderId = await getOrderId(token: token, amount: (100 * amount).toString());
      String paymentKey = await getPaymentKey(
        token: token,
        orderId: orderId.toString(),
        amount: (100 * amount).toString(),
      );
      return paymentKey;
    } catch (e) {
      log('Error: ${e.toString()}');
      throw Exception('Failed to process payment');
    }
  }
}
