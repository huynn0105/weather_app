import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:weather_app/utils/data_state.dart';
import 'package:weather_app/utils/internet_connection_utils.dart';

abstract class BaseApiRepository {
  /// This method is responsible of handling the given `request`, in which
  /// it returns generic based `DataState`.
  ///
  /// Returns `DataSuccess` that holds the generic data `T` if the response
  /// is successfully recieved.
  ///
  /// Returns `DataFailed` that holds a `DioError` instance if any error occurs
  /// while sending the request or recieving the response.
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    if (await InternetConnectionUtils.checkConnection()) {
      try {
        final httpResponse = await request();
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess<T>(httpResponse.data);
        } else {
          throw DioException(
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          );
        }
      } on DioException catch (error) {
        String message = 'An unknown error has occurred';
        if (error.response != null) {
          message = error.response!.data['error']['message'];
        }

        return DataFailed(errorMessage: message);
      }
    } else {
      return const DataFailed(
        errorMessage:
            'No Internet connection\nPlease check your internet connection and try again',
      );
    }
  }
}
