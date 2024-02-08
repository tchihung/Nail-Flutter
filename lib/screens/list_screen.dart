import 'package:flutter/material.dart';
import 'package:nail/screens/detail_screen.dart';
import 'package:nail/services/employee.dart';
import 'package:nail/services/employee_service.dart';
import 'package:nail/services/employeeList.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ListScreen extends StatefulWidget {
  EmployeeList employeeList;
  ListScreen({required this.employeeList});
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  void refreshList() {
    setState(() {});
  }

  void showPopup(BuildContext context) {
    if (widget.employeeList.getAllStatus()) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.bottomSlide,
        title: 'Notification',
        desc: 'All reports are confirmed!',
        btnOkOnPress: () {},
      )..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: Text('The list of Employee'),
          automaticallyImplyLeading: false,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView.builder(
                itemCount: widget.employeeList.getLength(),
                itemBuilder: (context, index) {
                  Employee employee =
                      widget.employeeList.getEmployeeByIndex(index);

                  return Column(
                    children: [
                      Container(
                        color: employee.status ? Colors.green[100] : null,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  'Name: ${employee.name}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    'Amount: ${employee.amount}\nTech Total: ${employee.techTotal.toStringAsFixed(2)}'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        employee: employee,
                                        employeeList: widget.employeeList,
                                        index: index,
                                        refreshList: refreshList,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Checkbox(
                              value: employee.status, // Giá trị của checkbox
                              onChanged: (bool? value) {
                                setState(() {
                                  employee.status = value ?? false;
                                });
                                showPopup(context);
                              },
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
