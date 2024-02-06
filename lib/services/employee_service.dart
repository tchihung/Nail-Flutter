import 'dart:convert';
import 'package:http/http.dart' as http;
import 'employee.dart';

class EmployeeService {
  final String apiUrl;

  EmployeeService({required this.apiUrl});

  Future<List<Employee>> getEmployees() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      String cleanedJson = response.body.replaceAll(RegExp(r',\s*}'), '}');
      final List<dynamic> data = json.decode(cleanedJson)['data'];
      return data.map((e) => Employee.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }
}
