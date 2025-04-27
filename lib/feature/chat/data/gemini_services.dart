import 'dart:developer';

import 'package:dio/dio.dart';

class GeminiService {
  static const String _apiKey = 'AIzaSyBVvCLezslVKXrDty4gHdhXx7xdsBxkvv4';
  static const String _url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$_apiKey';

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<String> sendMessage(String message) async {
    try {
      final response = await _dio.post(
        _url,
        data: {
          'contents': [
            {
              'parts': [
                {
                  'text':
                      "You are EduNexus AI Assistant. Help users learn and answer their academic questions clearly.\nUser: $message",
                },
              ],
            },
          ],
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final text = data['candidates'][0]['content']['parts'][0]['text'];
        return text;
      } else {
        log('Failed with status: ${response.statusCode}');
        return 'Oops! Something went wrong. Please try again.';
      }
    } on DioException catch (e) {
      log('Dio error: $e');
      return 'Oops! Connection error. Please try again.';
    } catch (e) {
      log('Unknown error: $e');
      return 'Oops! Unexpected error. Please try again.';
    }
  }
}
