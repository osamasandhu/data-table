import 'package:custom_data_table/data_table_page.dart';

class DataTableModel {
  String name;
  String age;
  String address;
  String phone;
  String email;

  DataTableModel(
      {required this.phone,
      required this.email,
      required this.name,
      required this.address,
      required this.age});
}

List<DataTableModel> dummyTableData = [
  DataTableModel(
    name: 'Osama Sandhu',
    age: '22',
    phone: '03182220646',
    address:
        '86/A near masjid al haq  Garden city stadium chowk vehari road Multan',
    email: 'osamasandhu3636@gmail.com',
  )
];
