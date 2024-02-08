import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:nail/services/employee.dart';
import 'package:nail/services/employeeList.dart';
import 'package:nail/services/employee_service.dart';
import 'package:nail/screens/list_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late EmployeeList employeeList;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final employeeService = EmployeeService(
        apiUrl: 'https://run.mocky.io/v3/91589efb-813c-4dc8-b015-5732e41aad33');
    final employees = await employeeService.getEmployees();
    setState(() {
      employeeList = EmployeeList(employeeList: employees);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListScreen(
            employeeList: employeeList,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
