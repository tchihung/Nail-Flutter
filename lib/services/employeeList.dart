import 'package:nail/services/employee.dart';

class EmployeeList {
  List<Employee> employeeList;

  EmployeeList({required this.employeeList});
  int getLength() {
    return employeeList.length;
  }

  Employee getEmployeeByIndex(int index) {
    return employeeList[index];
  }

  bool getAllStatus() {
    for (Employee i in employeeList) {
      if (i.status == false) {
        return false;
      }
    }
    return true;
  }
}
