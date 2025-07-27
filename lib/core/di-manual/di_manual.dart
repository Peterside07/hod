import 'package:get_it/get_it.dart';
import 'package:hodtech/features/dashboard/notifier/dashboard_notifier.dart';
import 'package:hodtech/features/devotional/notifier/devotional_notifier.dart';
import 'package:hodtech/features/home/notifier/home_notifier.dart';

GetIt getIt = GetIt.instance;

void setUpDependecies() async {

  getIt.registerLazySingleton(() => DashBoardNotifier());
  getIt.registerLazySingleton(() => HomeNotifier());
  getIt.registerLazySingleton(() => DevotionalNotifier());
  
}
