import 'package:flutter_sr/core/providers/boolean_provider.dart';
import 'package:flutter_sr/core/providers/benefit_provider.dart';
import 'package:flutter_sr/core/providers/navigation_provider.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/core/services/mail_service.dart';
import 'package:get_it/get_it.dart';

import '../core/providers/auth_provider.dart';
import '../core/providers/user_provider.dart';
import '../core/services/benefit_service.dart';
import '../core/services/auth_service.dart';
import '../core/services/user_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => BenefitService());
  locator.registerLazySingleton(() => MailService());

  locator.registerFactory(() => AuthProvider());
  locator.registerFactory(() => UserProvider());
  locator.registerFactory(() => NavigationProvider());
  locator.registerFactory(() => SingleValueProvider());
  locator.registerFactory(() => BooleanProvider());
  locator.registerFactory(() => BenefitProvider());
}
