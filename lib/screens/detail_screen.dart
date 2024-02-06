import 'package:flutter/material.dart';
import 'package:nail/services/employee.dart';

class DetailScreen extends StatefulWidget {
  Employee employee;
  List<Employee> employeeList;
  int index;
  DetailScreen(
      {required this.employee,
      required this.employeeList,
      required this.index});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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

  bool checkLeftButton() {
    return widget.index > 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: Text('Employee Detail'),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20.0,
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
                                  widget.employee =
                                      widget.employeeList[widget.index];
                                });
                              }
                            : null,
                        icon: Icon(Icons.arrow_circle_left_outlined)),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16.0),
                          child: Text(
                            '${widget.employee.name}',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    IconButton(
                        iconSize: 46,
                        onPressed: widget.index < widget.employeeList.length - 1
                            ? () {
                                setState(() {
                                  widget.index++;
                                  widget.employee =
                                      widget.employeeList[widget.index];
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
