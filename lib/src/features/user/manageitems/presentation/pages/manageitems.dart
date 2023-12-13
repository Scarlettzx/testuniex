// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:uni_expense/src/features/user/allowance/presentation/widgets/customappbar.dart';
// import 'package:intl/intl.dart';
// import 'package:uni_expense/src/features/user/manageitems/presentation/pages/mangeitems_add_list.dart';

// class ManageItems extends StatefulWidget {
//   const ManageItems({super.key});

//   @override
//   State<ManageItems> createState() => _ManageItemsState();
// }

// class _ManageItemsState extends State<ManageItems> {
//   // Mock data
//   final List<Map<String, dynamic>> myproducts = [
//     {
//       'id': '001',
//       'topic': 'ค่าเดินทาง',
//       'status': 5,
//       'amount': 4000,
//     },
//     {
//       'id': '002',
//       'topic': 'ค่าเดินทาง',
//       'status': 3,
//       'amount': 4000,
//     },
//     {
//       'id': '003',
//       'topic': 'ค่าเดินทาง',
//       'status': 2,
//       'amount': 4000,
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 7,
//       child: Scaffold(
//           appBar: CustomAppBar(tabs: [
//             Tab(
//               text: 'ทั้งหมด',
//             ),
//             Tab(
//               text: 'อาหาร',
//             ),
//             Tab(
//               text: 'ชอปปิง',
//             ),
//             Tab(
//               text: 'ความบันเทิง',
//             ),
//             Tab(
//               text: 'ไลฟ์สไตล์',
//             ),
//             Tab(
//               text: 'ท่องเที่ยว',
//             ),
//             Tab(
//               text: 'สุขภาพ',
//             ),
//           ], image: "appbar_manageitems.png", title: 'จัดการรายการ'),
//           body: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(30.0),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         PageTransition(
//                           duration: Durations.medium1,
//                           type: PageTransitionType.rightToLeft,
//                           child: const ManageItemsAddList(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       // color: Colors.amber,
//                       decoration: BoxDecoration(
//                         color: Color(0xffff99ca),
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           horizontal:
//                               MediaQuery.of(context).devicePixelRatio * 6,
//                           vertical:
//                               MediaQuery.of(context).devicePixelRatio * 3),
//                       // shape: Border.all(width: 2),
//                       // onPressed: () => {},
//                       // fillColor: ,
//                       child: Text(
//                         '+ เพิ่มรายการ',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 15),
//                 // padding: const EdgeInsets.symmetric(horizontal: 30),
//                 // color: Colors.amber,
//                 child: const TabBar(
//                   splashFactory: NoSplash.splashFactory,
//                   splashBorderRadius: BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                   // indicatorWeight: 4,
//                   // automaticIndicatorColorAdjustment: trueF
//                   // dividerColor: Colors.amber,
//                   // dividerHeight: 20,
//                   // padding: const EdgeInsets.symmetric(horizontal: 10),
//                   isScrollable: true,
//                   tabs: [
//                     Tab(
//                       text: 'ทั้งหมด',
//                     ),
//                     Tab(
//                       text: 'แบบร่าง',
//                     ),
//                     Tab(
//                       text: 'รออนุมัติ',
//                     ),
//                     Tab(
//                       text: 'อยู่ระหว่างดำเนินการ',
//                     ),
//                     Tab(
//                       text: 'รอการแก้ไข',
//                     ),
//                     Tab(
//                       text: 'เสร็จสมบูรณ์',
//                     ),
//                     Tab(
//                       text: 'ไม่อนุมัติ',
//                     ),
//                   ],
//                   indicatorColor: Colors.pink,
//                   labelColor: Colors.pink,
//                   tabAlignment: TabAlignment.start,
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(
//                           left: 15, right: 15, top: 10, bottom: 10),
//                       // color: Colors.amber,
//                       alignment: Alignment.topLeft,
//                       child: ListView.builder(
//                           // the number of items in the list
//                           itemCount: myproducts.length,

//                           // display each item of the product list
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(bottom: 10),
//                               child: Column(
//                                 children: [
//                                   ListTile(
//                                     title: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text('ID: ${myproducts[index]['id']}'),
//                                         getStatusWidget(
//                                             myproducts[index]["status"]),
//                                       ],
//                                     ),

//                                     subtitle: Padding(
//                                       padding: const EdgeInsets.only(top: 8),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text('เรื่อง'),
//                                               Text(
//                                                   ' ${myproducts[index]['topic']}'),
//                                             ],
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 8),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text('จำนวนเงิน'),
//                                                 Text(
//                                                     '${NumberFormat.decimalPattern().format(myproducts[index]['amount'])} บาท'),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     // You can add more widgets or customize the ListTile as needed
//                                   ),
//                                   Divider(
//                                     color: Colors.grey.shade300,
//                                     height: 1,
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                     ),
//                     Container(
//                       child: const Text('ชอปปิง'),
//                     ),
//                     Container(
//                       child: const Text('ความบันเทิง'),
//                     ),
//                     Container(
//                       child: const Text('ไลฟ์สไตล์'),
//                     ),
//                     Container(
//                       child: const Text('ท่องเที่ยว'),
//                     ),
//                     Container(
//                       child: const Text('สุขภาพ'),
//                     ),
//                     Container(
//                       child: const Text('สุขภาพ'),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }

// // Function to get status text based on status value
// Widget getStatusWidget(int status) {
//   String statusText;
//   Color statusColor;

//   switch (status) {
//     case 5:
//       statusText = 'เสร็จสมบูรณ์';
//       statusColor = Colors.green;
//       break;
//     case 3:
//       statusText = 'ระหว่างดำเนินการ';
//       statusColor = Colors.yellow;
//       break;
//     case 2:
//       statusText = 'รออนุมัติ';
//       statusColor = Colors.yellow;
//       break;
//     default:
//       statusText = 'ไม่ทราบสถานะ';
//       statusColor = Colors.red;
//   }

//   // Create a container with the specified color
//   return Container(
//     padding: EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       color: statusColor,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Text(
//       statusText,
//       style: TextStyle(
//         fontSize: 10,
//         fontWeight: FontWeight.w900,
//       ),
//     ),
//   );
// }
