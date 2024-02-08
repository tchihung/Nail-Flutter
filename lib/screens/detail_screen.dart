import 'package:flutter/material.dart';
import 'package:nail/services/employee.dart';
import 'package:nail/services/employeeList.dart';
import 'package:nail/screens/list_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class DetailScreen extends StatefulWidget {
  Employee employee;
  EmployeeList employeeList;
  int index;
  final Function() refreshList;
  DetailScreen(
      {required this.employee,
      required this.employeeList,
      required this.index,
      required this.refreshList});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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

  Widget detailElement(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            widget.employee.status ? Colors.green[100] : Colors.blue[100],
        appBar: AppBar(
          title: Text('Employee Detail'),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20.0,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              widget.refreshList();
              Navigator.pop(
                context,
                (employeeList: widget.employeeList),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 46,
                        onPressed: widget.index > 0
                            ? () {
                                setState(() {
                                  widget.index--;
                                  widget.employee = widget.employeeList
                                      .getEmployeeByIndex(widget.index);
                                });
                              }
                            : null,
                        icon: Icon(Icons.arrow_circle_left_outlined)),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.employee.status = !widget.employee.status;
                        });
                        showPopup(context);
                      },
                      child: Text(
                        '${widget.employee.name}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    IconButton(
                        iconSize: 46,
                        onPressed:
                            widget.index < widget.employeeList.getLength() - 1
                                ? () {
                                    setState(() {
                                      widget.index++;
                                      widget.employee = widget.employeeList
                                          .getEmployeeByIndex(widget.index);
                                    });
                                  }
                                : null,
                        icon: Icon(Icons.arrow_circle_right_outlined))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        detailElement('Id:', '${widget.employee.id}'),
                        detailElement('Amount:', '${widget.employee.amount}'),
                        detailElement('Deduct:', '${widget.employee.deduct}'),
                        detailElement(
                            'Commission:', '${widget.employee.commission}'),
                        detailElement('Promo:', '${widget.employee.promo}'),
                        detailElement('Tip:', '${widget.employee.tip}'),
                        detailElement(
                            'Tech total:', '${widget.employee.techTotal}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
