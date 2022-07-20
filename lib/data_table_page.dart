import 'package:custom_data_table/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataTablePage extends StatefulWidget {
  const DataTablePage({super.key});

  @override
  State<DataTablePage> createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  @override
  Widget build(BuildContext context) {
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
                      _buildData(title: dummyTableData[i].name),
                      _buildData(title: dummyTableData[i].phone),
                      _buildData(title: dummyTableData[i].age),
                      _buildData(title: dummyTableData[i].email, flex: 2),
                      _buildData(
                          title: dummyTableData[i].address, flex: 3, right: 0),
                    ],
                  );
                },
                separatorBuilder: (c, j) {
                  return const SizedBox(height: 20);
                },
                itemCount: dummyTableData.length,
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
                children: const [
                  Text(
                    '1 - 8  of 100',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '< 1 >',
                    style: TextStyle(
                      fontSize: 16,
                    ),
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
          right: right ?? 15,
        ),
        child: Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
          right: right ?? 15,
        ),
        child: Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
