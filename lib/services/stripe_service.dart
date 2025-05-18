import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StripeService {
  static String publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  static String secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? '';
  static const String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';

  static Future<void> initialize() async {
    Stripe.publishableKey = publishableKey;
    await Stripe.instance.applySettings();
  }

  static Future<Map<String, dynamic>> createPaymentIntent(double amount, String currency) async {
    try {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $secretKey';
      dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

      final response = await dio.post(
        _paymentApiUrl,
        data: {
          'amount': (amount * 100).toInt().toString(), // Convert to cents
          'currency': currency,
          'payment_method_types[]': 'card'
        },
      );

      return response.data;
    } catch (err) {
      throw Exception('Failed to create payment intent: $err');
    }
  }

  static Future<void> makePayment({
    required double amount,
    required String currency,
    required Function(String) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      // Create payment intent
      final paymentIntent = await createPaymentIntent(amount, currency);

      // Get and validate client secret
      final clientSecret = paymentIntent['client_secret'];
      if (clientSecret == null || clientSecret is! String) {
        throw Exception('Failed to get valid client secret from payment intent');
      }

      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'TutorsPlan',
          style: ThemeMode.system,
          
        ),
      );

      // Present payment sheet
      await Stripe.instance.presentPaymentSheet();

      // Payment successful
      onSuccess('Payment completed successfully');
    } catch (err) {
      if (err is StripeException) {
        onError(err.error.localizedMessage ?? 'An error occurred during payment');
      } else {
        onError('An error occurred: $err');
      }
    }
  }
}
