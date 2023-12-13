part of 'expensegood_bloc.dart';

// @immutable
abstract class ExpenseGoodState extends Equatable {
  const ExpenseGoodState();
}

class ExpenseGoodInitial extends ExpenseGoodState {
  @override
  List<Object?> get props => [];
}

class ExpenseGoodLoading extends ExpenseGoodState {
  @override
  List<Object?> get props => [];
}

class ExpenseGoodFinish extends ExpenseGoodState {
  final List<EmployeesAllRolesEntity>? empsallrole;
  final List<EmployeeRoleAdminEntity>? empsroleadmin;
  const ExpenseGoodFinish({this.empsroleadmin, this.empsallrole});
  @override
  List<Object?> get props => [empsallrole, empsroleadmin];
}

class ExpenseGoodFailure extends ExpenseGoodState {
  final Failure error;
  const ExpenseGoodFailure({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
