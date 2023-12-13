import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
import 'package:uni_expense/src/features/user/expense/domain/usecases/get_employeesallroles.dart';
// import 'package:bloc/bloc.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/get_employeesroleadmin.dart';

part 'expensegood_event.dart';
part 'expensegood_state.dart';

class ExpenseGoodBloc extends Bloc<ExpenseGoodEvent, ExpenseGoodState> {
  final GetEmployeesAllRoles getEmployeesAllrolesdata;
  final GetEmployeesRoleAdmin getEmployeesRoleadmin;
  List<EmployeesAllRolesEntity> empsallroleData = [];
  List<EmployeeRoleAdminEntity> empsroleadminData = [];
  ExpenseGoodBloc({
    required this.getEmployeesRoleadmin,
    required this.getEmployeesAllrolesdata,
  }) : super(ExpenseGoodInitial()) {
    on<GetEmployeesAllRolesDataEvent>((event, emit) async {
      emit(ExpenseGoodLoading());
      var resEmployeesAllroledata = await getEmployeesAllrolesdata();
      var resEmployeeRoleAdmin = await getEmployeesRoleadmin();
      resEmployeesAllroledata.fold((l) => emit(ExpenseGoodFailure(error: l)),
          (r) => empsallroleData = r);
      resEmployeeRoleAdmin.fold((l) => emit(ExpenseGoodFailure(error: l)),
          (r) => empsroleadminData = r);
      emit(
        ExpenseGoodFinish(
          empsallrole: empsallroleData,
          empsroleadmin: empsroleadminData,
        ),
      );
      //
    });
  }
}
