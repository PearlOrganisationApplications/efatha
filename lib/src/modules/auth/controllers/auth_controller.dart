import 'package:dio/dio.dart';
import 'package:efatha_tv/src/modules/auth/views/otp_view.dart';
import 'package:efatha_tv/src/modules/dashboard/views/dashboard_view.dart';
import 'package:efatha_tv/src/modules/index/views/index_view.dart';
import 'package:efatha_tv/utils/app.toast.dart';
import 'package:efatha_tv/utils/dio.client.dart';
import 'package:efatha_tv/utils/dio.error.handelr.dart';
import 'package:flutter/material.dart';

import 'package:efatha_tv/src/routes/app_routes.dart';
import 'package:get/get.dart' hide FormData;

class AuthController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailControllerForgot = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otp = TextEditingController();
  RxBool isLoginLoading = false.obs;
  DioClient dioClient = DioClient();
  RxBool isLoading = false.obs;
  RxBool isSignupLoading = false.obs;
  // Form controllers (simulated)
  final email = ''.obs;
  final password = ''.obs;
  final name = ''.obs;

  void login() async {
    isLoginLoading.value = true;
    try {
      final response = await dioClient.post(
        '/login',
        data: {
          'email': emailController.text.trim().toString(),
          'password': passwordController.text.trim().toString(),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        AppToast.success("login successfully");
        Get.offAll(() => DashboardView());
      } else {
        throw Exception(response.data['message'] ?? "something went wrong ");
      }
    } on DioException catch (e) {
      final msg = AppDioErrorHandler.getErrorMessage(e);
      throw Exception(msg.toString());
    } catch (e) {
      AppToast.failed(e.toString());
    } finally {
      isLoginLoading.value = false;
    }
  }

  Future<void> register() async {
    isSignupLoading.value = true;
    try {
      final response = await dioClient.post(
        '/signup-request',
        data: {
          "confirmPassword": passwordController.text.trim().toString(),
          //  'name': nameController.text,
          'password': passwordController.text.trim().toString(),
          'email': emailController.text.trim().toString(),
        },
      );
      print("Request Body:");
      print({
        "confirmPassword": passwordController.text,
        "password": passwordController.text,
        "email": emailController.text,
      });
      print(response.data.toString());
      print("😀😀😀😂");
      if (response.statusCode == 200 || response.statusCode == 201) {
        AppToast.success("OTP Sent to email ${emailController.text.trim()}");
        Get.to(OtpView());
      } else {
        throw Exception(response.data['message'] ?? "something went wrong ");
      }
    } on DioException catch (e) {
      final msg = AppDioErrorHandler.getErrorMessage(e);
      throw Exception(msg.toString());
    } catch (e) {
      AppToast.failed(e.toString());
    } finally {
      isSignupLoading.value = false;
    }
  }

  Future<void> verifyOtp() async {
    if (emailController.text.isEmpty) {
      AppToast.failed("please enter the email ");
      return;
    }
    isLoading.value = true;

    try {
      final response = await dioClient.post(
        '/verify-signup',
        queryParameters: {
          "otp": otp.text,
          "email": emailController.text.trim(),
        },
      );

      print("Response:");
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppToast.success("OTP verified. Please login");

        // Navigate to login screen
        //  Get.offAll(LoginView());
      } else {
        AppToast.failed(response.data['message'] ?? "Something went wrong");
      }
    } on DioException catch (e) {
      final msg = AppDioErrorHandler.getErrorMessage(e);

      AppToast.failed(msg);

      print("Dio Error: $msg");
    } catch (e) {
      AppToast.failed(e.toString());

      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  RxBool isForgotLoading = false.obs;
  Future<void> forgotPassword() async {
    try {
      isForgotLoading.value = true;
      final response = await dioClient.post(
        "/forgot-password",
        queryParameters: {
          "email": emailControllerForgot.text.trim().toString(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppToast.success(
          response.data['message'] ??
              "OTP sent to ${emailControllerForgot.text}",
        );
      } else {
        throw Exception(response.data['message'] ?? "Somthing went wrong");
      }
    } on DioException catch (e) {
      final msg = AppDioErrorHandler.getErrorMessage(e);
      throw Exception(msg);
    } catch (e) {
      AppToast.failed(e.toString());
    } finally {
      isForgotLoading.value = false;
    }
  }
}
