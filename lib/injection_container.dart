import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:uni_expense/src/features/user/expense/data/data_sources/expensegood_remote_datasource.dart';
import 'package:uni_expense/src/features/user/expense/data/repositories.dart/expensegood_repository_impl.dart';
import 'package:uni_expense/src/features/user/expense/domain/repositories/expensegood_repository.dart';
import 'src/features/user/expense/domain/usecases/usecases.dart';
import 'src/features/user/expense/presentation/bloc/expensegood_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! ExpenseGood
  // * Bloc
  sl.registerFactory(() => ExpenseGoodBloc(
        getEmployeesAllrolesdata: sl(),
        getEmployeesRoleadmin: sl(),
      ));
  // * Usecase
  sl.registerLazySingleton(() => GetEmployeesAllRoles(repository: sl()));
  sl.registerLazySingleton(() => GetEmployeesRoleAdmin(repository: sl()));
  // * Repository
  sl.registerLazySingleton<ExpenseGoodRepository>(
      () => ExpenseGoodRepositoryImpl(remoteDatasource: sl()));
  // * Data Source
  sl.registerLazySingleton<ExpenseGoodRemoteDatasource>(
      () => ExpenseGoodRemoteDatasourceImpl(client: sl()));
  // * External
  sl.registerLazySingleton(() => http.Client());
}
