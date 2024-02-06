import 'package:flutter/material.dart';
import 'package:nail/screens/detail_screen.dart';
import 'package:nail/services/employee.dart';
import 'package:nail/services/employee_service.dart';

class ListScreen extends StatefulWidget {
  List<Employee> employeeList;
  ListScreen({required this.employeeList});
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
                itemCount: widget.employeeList.length,
                itemBuilder: (context, index) {
                  Employee employee = widget.employeeList[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Name: ${employee.name}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'Amount: ${employee.amount} | Tech Total: ${employee.techTotal}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                employee: employee,
                                employeeList: widget.employeeList,
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
