import 'package:custom_data_table/data_control.dart';
import 'package:custom_data_table/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reusables/reusables.dart';

ValueController valueController = ValueController();

class DataTablePage extends ControlledWidget<ValueController> {
  DataTablePage({
    Key? key,
  }) : super(key: key, controller: valueController);

  @override
  State<DataTablePage> createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage>
    with ControlledStateMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.controller.pageNumber.toString());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: _buildTableTitleRow(),
            ),
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                itemBuilder: (c, i) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildData(
                        title: tableData[i].name,
                      ),
                      _buildData(title: tableData[i].phone),
                      _buildData(
                        title: tableData[i].age,
                      ),
                      _buildData(title: tableData[i].email, flex: 2),
                      _buildData(
                        title: tableData[i].address,
                        flex: 3,
                        right: 0,
                      ),
                    ],
                  );
                },
                separatorBuilder: (c, j) {
                  return const SizedBox(height: 20);
                },
                itemCount: tableData.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '${valueController.dataFrom} - ${widget.controller.dataTo}  of 100',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      widget.controller.decrement();
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  SizedBox(
                    width: 25,
                    child: Center(
                      child: Text(
                        widget.controller.pageNumber.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.controller.increment();
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableTitleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleTable(
          title: 'Name',
        ),
        _buildTitleTable(
          title: 'Phone',
        ),
        _buildTitleTable(
          title: 'Age',
        ),
        _buildTitleTable(title: 'Email', flex: 2),
        _buildTitleTable(title: 'Address', flex: 3, right: 0),
      ],
    );
  }

  Widget _buildTitleTable({required String title, int? flex, double? right}) {
    return Expanded(
      flex: flex ?? 1,
      child: Padding(
        padding: EdgeInsets.only(
          right: right ?? 20,
        ),
        child: Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildData({required String title, int? flex, double? right}) {
    return Expanded(
      flex: flex ?? 1,
      child: Padding(
        padding: EdgeInsets.only(
          right: right ?? 20,
        ),
        child: Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// class DataTablePage extends StatefulWidget {
//   const DataTablePage({super.key});
//
//   @override
//   State<DataTablePage> createState() => _DataTablePageState();
// }
//
// class _DataTablePageState extends State<DataTablePage> {
//   int pageNumber = 1;
//   int dataFrom = 1;
//   int dataTo = 10;
//
//   increment() {
//     if (pageNumber < 10) {
//       pageNumber++;
//       setState(() {});
//     }
//     if (dataTo < 100) {
//       dataTo = dataTo + 10;
//       setState(() {});
//     }
//     if (dataFrom < 90) {
//       dataFrom = dataFrom + 10;
//       setState(() {});
//     }
//   }
//
//   decrement() {
//     if (pageNumber > 1) {
//       pageNumber--;
//       setState(() {});
//     }
//     if (dataTo > 1) {
//       dataTo = dataTo - 10;
//       setState(() {});
//     }
//     if (dataFrom > 10) {
//       dataFrom = dataFrom - 10;
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.all(30),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.grey.withOpacity(0.2),
//         ),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 20,
//               ),
//               decoration: const BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: _buildTableTitleRow(),
//             ),
//             Expanded(
//               child: ListView.separated(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                 itemBuilder: (c, i) {
//                   return Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildData(
//                         title: tableData[i].name,
//                       ),
//                       _buildData(title: tableData[i].phone),
//                       _buildData(
//                         title: tableData[i].age,
//                       ),
//                       _buildData(title: tableData[i].email, flex: 2),
//                       _buildData(
//                         title: tableData[i].address,
//                         flex: 3,
//                         right: 0,
//                       ),
//                     ],
//                   );
//                 },
//                 separatorBuilder: (c, j) {
//                   return const SizedBox(height: 20);
//                 },
//                 itemCount: tableData.length,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 20,
//               ),
//               decoration: const BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(20),
//                   bottomLeft: Radius.circular(20),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     '$dataFrom - $dataTo  of 100',
//                     style: const TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: decrement,
//                     icon: const Icon(Icons.chevron_left),
//                   ),
//                   SizedBox(
//                     width: 25,
//                     child: Center(
//                       child: Text(
//                         pageNumber.toString(),
//                         style: const TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: increment,
//                     icon: const Icon(Icons.chevron_right),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTableTitleRow() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildTitleTable(
//           title: 'Name',
//         ),
//         _buildTitleTable(
//           title: 'Phone',
//         ),
//         _buildTitleTable(
//           title: 'Age',
//         ),
//         _buildTitleTable(title: 'Email', flex: 2),
//         _buildTitleTable(title: 'Address', flex: 3, right: 0),
//       ],
//     );
//   }
//
//   Widget _buildTitleTable({required String title, int? flex, double? right}) {
//     return Expanded(
//       flex: flex ?? 1,
//       child: Padding(
//         padding: EdgeInsets.only(
//           right: right ?? 20,
//         ),
//         child: Text(
//           title,
//           style: GoogleFonts.abel(
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildData({required String title, int? flex, double? right}) {
//     return Expanded(
//       flex: flex ?? 1,
//       child: Padding(
//         padding: EdgeInsets.only(
//           right: right ?? 20,
//         ),
//         child: Text(
//           title,
//           style: GoogleFonts.abel(
//             fontWeight: FontWeight.w400,
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }
// }
