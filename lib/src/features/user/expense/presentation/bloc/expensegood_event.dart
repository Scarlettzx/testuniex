part of 'expensegood_bloc.dart';

// @immutable
abstract class ExpenseGoodEvent extends Equatable {
  const ExpenseGoodEvent();
}

class GetEmployeesAllRolesDataEvent extends ExpenseGoodEvent {
  @override
  List<Object?> get props => [];
  // final List<EmployeesAllRolesEntity> empsallrole;
  // const GetEmployeesAllRolesDataEvent({required this.empsallrole});
  // @override
  // List<Object?> get props => [empsallrole];
}

class GetEmployeesRoleAdminDataEvent extends ExpenseGoodEvent {
  @override
  List<Object?> get props => [];
}
