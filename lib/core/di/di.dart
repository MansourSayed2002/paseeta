import 'package:get_it/get_it.dart';
import 'package:paseeta/data/api/connected_supabase.dart';
import 'package:paseeta/data/repo_implementation/repo_implementation.dart';
import 'package:paseeta/domain/repo_abstract/repo_abstraction.dart';
import 'package:paseeta/domain/usecase/Home/check_expire_usecase.dart';
import 'package:paseeta/domain/usecase/Home/refresh_expired_date.dart';
import 'package:paseeta/domain/usecase/detail_task/change_status_of_order_usecase.dart';
import 'package:paseeta/domain/usecase/login/check_email_usecase.dart';
import 'package:paseeta/domain/usecase/reports/accounts_deliveryman_usecase.dart';
import 'package:paseeta/domain/usecase/reports/supplying_money_of_order_usecase.dart';
import 'package:paseeta/domain/usecase/setting/log_out_usecase.dart';
import 'package:paseeta/domain/usecase/status/get_all_tasks_to_day_usecase.dart';
import 'package:paseeta/domain/usecase/task/date_now_usecase.dart';
import 'package:paseeta/domain/usecase/task/get_task_usecase.dart';
import 'package:paseeta/domain/usecase/verifycode/check_verifycode.dart';
import 'package:paseeta/domain/usecase/login/create_and_send_verify_code.dart';
import 'package:paseeta/domain/usecase/onboarding/next_onboarding_page_usecase.dart';
import 'package:paseeta/presentation/cubit/details_task_cubit/details_task_cubit.dart';
import 'package:paseeta/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:paseeta/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:paseeta/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:paseeta/presentation/cubit/reports_cubit/reports_cubit.dart';
import 'package:paseeta/presentation/cubit/setting_cubit/setting_cubit.dart';
import 'package:paseeta/presentation/cubit/status_cubit/status_cubit.dart';
import 'package:paseeta/presentation/cubit/task_cubit/task_cubit.dart';
import 'package:paseeta/presentation/cubit/verifycode_cubit/verifycode_cubit.dart';

final getit = GetIt.instance;

Future<void> setupgetit() async {
//==============================DATABASE SUPABASE===============================
  getit.registerLazySingleton<ConnectedSupabase>(() => ConnectedSupabase());
//==================================REPO========================================
  getit.registerLazySingleton<RepoAbstraction>(
      () => RepoImplementation(getit()));

//==================================USECASE=====================================

  getit.registerLazySingleton<NextOnboardingPageUseCase>(
      () => NextOnboardingPageUseCase());

  getit.registerLazySingleton<CheckEmailUsecase>(
      () => CheckEmailUsecase(getit()));

  getit.registerLazySingleton<CreateAndSendVerifyCode>(
      () => CreateAndSendVerifyCode(getit()));

  getit.registerLazySingleton<CheckVerifycodeUseCase>(
      () => CheckVerifycodeUseCase(getit()));

  getit.registerLazySingleton<CheckExpireUsecase>(() => CheckExpireUsecase());

  getit.registerLazySingleton<LogOutUsecase>(() => LogOutUsecase());

  getit.registerLazySingleton<DateNowUsecase>(() => DateNowUsecase());

  getit.registerLazySingleton<GetTaskUsecase>(() => GetTaskUsecase(getit()));

  getit.registerLazySingleton<GetAllTasksToDayUsecase>(
      () => GetAllTasksToDayUsecase(getit()));

  getit.registerLazySingleton<RefreshExpiredDate>(
      () => RefreshExpiredDate(getit()));

  getit.registerLazySingleton<SupplyingMoneyOfOrderUsecase>(
      () => SupplyingMoneyOfOrderUsecase(getit()));

  getit.registerLazySingleton<AccountsDeliverymanUsecase>(
      () => AccountsDeliverymanUsecase(getit()));

  getit.registerLazySingleton<ChangeStatusOfOrderUsecase>(
      () => ChangeStatusOfOrderUsecase(getit()));

//================================CUBIT STAEMANAGEMENT==========================

  getit.registerLazySingleton(() => OnboardingCubit(getit()));

  getit.registerLazySingleton(() => LoginCubit(getit(), getit()));

  getit.registerLazySingleton(() => VerifycodeCubit(getit()));

  getit.registerLazySingleton(() => HomeCubit(getit(), getit()));

  getit.registerLazySingleton(() => SettingCubit(getit()));

  getit.registerLazySingleton(() => DetailsTaskCubit(getit()));

  getit.registerLazySingleton(() => TaskCubit(getit(), getit()));

  getit.registerLazySingleton(() => ReportsCubit(getit(), getit()));

  getit.registerLazySingleton(() => StatusCubit(getit()));
}
