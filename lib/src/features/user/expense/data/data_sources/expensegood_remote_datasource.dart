import 'package:http/http.dart' as http;
import 'package:uni_expense/src/core/constant/network_api.dart';
import 'package:uni_expense/src/features/user/expense/data/models/employeesallroles_model.dart';
import 'package:uni_expense/src/features/user/expense/domain/entities/employees_allroles.dart';

import '../../../../../core/error/exception.dart';
import '../models/employeesroleadmin_model.dart';

abstract class ExpenseGoodRemoteDatasource {
  Future<List<EmployeesAllRolesModel>> getEmployeesAllRoles();
  Future<List<EmployeesRoleAdminModel>> getEmployeesRoleAdmin();
}

class ExpenseGoodRemoteDatasourceImpl implements ExpenseGoodRemoteDatasource {
  final http.Client client;
  ExpenseGoodRemoteDatasourceImpl({required this.client});

  @override
  Future<List<EmployeesAllRolesModel>> getEmployeesAllRoles() async {
    final response = await client.get(
      Uri.parse(
        "${NetworkAPI.baseURL}/api/employees-allRoles",
      ),
      headers: {
        'x-access-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlcyI6MiwiaWRDb21wYW55IjoxLCJpZFJvbGUiOjEsImlhdCI6MTcwMTIyNjgwNSwiZXhwIjoxNzAzODE4ODA1fQ.2LbsLlMRxs3PIdnZyPPlZ8xl44MwvKNslwa3WqHPpYY'
      },
    );
    if (response.statusCode == 200) {
      return employeesAllRolesModelFromJson(response.body);
    } else {
      throw ServerException(message: "Server error occurred");
    }
  }

  @override
  Future<List<EmployeesRoleAdminModel>> getEmployeesRoleAdmin() async {
    final response = await client.get(
      Uri.parse(
        "${NetworkAPI.baseURL}/api/employees-roleAdmin",
      ),
      headers: {
        'x-access-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlcyI6MiwiaWRDb21wYW55IjoxLCJpZFJvbGUiOjEsImlhdCI6MTcwMTIyNjgwNSwiZXhwIjoxNzAzODE4ODA1fQ.2LbsLlMRxs3PIdnZyPPlZ8xl44MwvKNslwa3WqHPpYY'
      },
    );
    if (response.statusCode == 200) {
      return employeesRoleAdminFromJson(response.body);
    } else {
      throw ServerException(message: "Server error occurred");
    }
  }
}
