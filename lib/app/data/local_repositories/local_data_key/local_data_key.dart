import 'dart:convert';

import 'package:base/app/core/utils/my_log.dart';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/models/base_model.dart';

// part of 'package:base/app/data/local_repositories/local_repository.dart';

/**
 * add prefix for specify the data type.
 * b: bool
 * i: int
 * d: double
 * s: String
 * o: Object ==> save as json String
 */
enum LocalDataKey {
  //clear all,
  clearAll,
  sAppLocale,
  bFirstTimeOpenApp,
  sThemes,
}
