library app_layer;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Project imports:
import '../app/managers/shared_pref_manager.dart';
import '../data/login/api/login_api.dart';
import '../data/login/repositories/login_repository_impl.dart';
import '../domain/login/repositories/login_repository.dart';
import '../firebase/firebase_options.dart' as prod;
import '../firebase/firebase_options_dev.dart' as dev;
import '../firebase/firebase_options_staging.dart' as staging;
import '../presentation/home/home_route.dart';
import '../presentation/list_user/list_user_route.dart';
import '../presentation/login/login_route.dart';

part 'core/enum.dart';
part 'di/injection.dart';
part 'managers/theme_manager.dart';
part 'managers/color_manager.dart';
part 'managers/style_manager.dart';
part 'managers/config_manager.dart';
part 'route/app_routing.dart';
part 'utils/session_utils.dart';
part 'utils/navigation_util.dart';
