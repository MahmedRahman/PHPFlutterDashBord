import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class BaseDataTable extends GetView {
  BaseDataTable({
    required this.columnsName,
    required this.rowsName,
    required this.data,
    this.onDeletePressed,
    this.onUpdatePressed,
    this.onShowPressed,
  });
  List data;
  List<String> columnsName;
  List<String> rowsName;

  void Function(dynamic item)? onDeletePressed;
  void Function()? onUpdatePressed;
  void Function()? onShowPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: DataTable(
          columns: List.generate(columnsName.length, (index) {
            return DataColumn(
              label: Text(
                columnsName.elementAt(index).toString(),
              ),
            );
          }),
          rows: List.generate(
            data.length,
            (i) {
              return DataRow(
                cells: List.generate(
                  rowsName.length,
                  (j) {
                    if (rowsName.elementAt(j).toString() == "") {
                      return DataCell(
                        Row(
                          children: [
                            GetUtils.isNull(onDeletePressed)
                                ? SizedBox()
                                : IconButton(
                                    onPressed: () {
                                      onDeletePressed!(data[i]);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                            GetUtils.isNull(onUpdatePressed)
                                ? SizedBox()
                                : IconButton(
                                    onPressed: onUpdatePressed,
                                    icon: Icon(Icons.edit),
                                  ),
                            GetUtils.isNull(onShowPressed)
                                ? SizedBox()
                                : IconButton(
                                    onPressed: onShowPressed,
                                    icon: Icon(Icons.view_agenda),
                                  ),
                          ],
                        ),
                      );
                    }
                    return DataCell(
                      Text(data[i]["${rowsName.elementAt(j).toString()}"].toString()),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
