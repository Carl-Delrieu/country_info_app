import 'package:country_info_app/app.dart';
import 'package:country_info_app/data/remote/api_service.dart';
import 'package:country_info_app/data/remote/api_strings.dart';
import 'package:country_info_app/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();

  APIService.defaultClient().get(endpoint: APIStrings.endpoint);

  //runApp(const MyApp());
}
