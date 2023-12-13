// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:iconamoon/iconamoon.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:uni_expense/src/features/user/allowance/presentation/pages/allowance_general_infor.dart';
// import 'package:uni_expense/src/features/user/allowance/presentation/widgets/customappbar.dart';

// import '../../../expense/presentation/widgets/calender_page.dart';

// class AllowanceAddList extends StatefulWidget {
//   const AllowanceAddList({super.key});

//   @override
//   State<AllowanceAddList> createState() => _AllowanceAddListState();
// }

// class _AllowanceAddListState extends State<AllowanceAddList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           CustomAppBar(image: 'appbar_aollowance.png', title: "เบี้ยเลี้ยง"),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'เพิ่มรายการ',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Gap(20),
//             Text(
//               'วันที่เริ่มต้น',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.grey.shade600),
//             ),
//             const Gap(10),
//             Container(
//               height: 40,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 2.0,
//                   color: Colors.grey.withOpacity(0.3),
//                 ),
//                 borderRadius: BorderRadius.circular(35),
//               ),
//               width: double.infinity,
//               child: Padding(
//                 padding: EdgeInsets.only(
//                     left: MediaQuery.of(context).devicePixelRatio * 7),
//                 child: Row(
//                   // crossAxisAlignment: CrossAxisAlignment,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // SizedBox(width: 4),
//                     // Gap(0.2),
//                     const Text('mew'),
//                     IconButton(
//                       // alignment: Alignment.bottomLeft,
//                       onPressed: () {
//                         // Navigator.push(
//                         //     context,
//                         //     PageTransition(
//                         //         child: CalenderPage(),
//                         //         type: PageTransitionType.bottomToTop));
//                       },
//                       icon: Icon(
//                         size: 20,
//                         color: Colors.grey.withOpacity(0.6),
//                         // color: Colors.grey.shade600,
//                         IconaMoon.calendar2,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const Gap(20),
//             Text(
//               'วันที่สิ้นสุด',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.grey.shade600),
//             ),
//             const Gap(10),
//             Container(
//               height: 40,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 2.0,
//                   color: Colors.grey.withOpacity(0.3),
//                 ),
//                 borderRadius: BorderRadius.circular(35),
//               ),
//               width: double.infinity,
//               child: Padding(
//                 padding: EdgeInsets.only(
//                     left: MediaQuery.of(context).devicePixelRatio * 7),
//                 child: Row(
//                   // crossAxisAlignment: CrossAxisAlignment,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // SizedBox(width: 4),
//                     // Gap(0.2),
//                     const Text('mew'),
//                     IconButton(
//                       // alignment: Alignment.bottomLeft,
//                       onPressed: () {
//                         // Navigator.push(
//                         //     context,
//                         //     PageTransition(
//                         //         child: CalenderPage(),
//                         //         type: PageTransitionType.bottomToTop));
//                       },
//                       icon: Icon(
//                         size: 20,
//                         color: Colors.grey.withOpacity(0.6),
//                         // color: Colors.grey.shade600,
//                         IconaMoon.calendar2,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const Gap(20),
//             Text(
//               'รายละเอียด',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.grey.shade600),
//             ),
//             Gap(10),
//             SizedBox(
//               height: 40,
//               width: double.infinity,
//               child: TextFormField(
//                 // style: ,
//                 decoration: InputDecoration(
//                   // fillColor: const Color.fromARGB(255, 237, 237, 237)
//                   //     .withOpacity(0.5),
//                   // filled: true,
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                         width: 2.0, color: Color.fromARGB(255, 252, 119, 119)),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(
//                         width: 2.0, color: Colors.grey.withOpacity(0.3)),
//                   ),
//                 ),
//               ),
//             ),
//             const Gap(20),
//             Text(
//               'จำนวนเงิน',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.grey.shade600),
//             ),
//             Gap(10),
//             SizedBox(
//               height: 40,
//               width: double.infinity,
//               child: TextFormField(
//                 // style: ,
//                 decoration: InputDecoration(
//                   // fillColor: const Color.fromARGB(255, 237, 237, 237)
//                   //     .withOpacity(0.5),
//                   // filled: true,
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                         width: 2.0, color: Color.fromARGB(255, 252, 119, 119)),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(
//                         width: 2.0, color: Colors.grey.withOpacity(0.3)),
//                   ),
//                 ),
//               ),
//             ),
//             // Spacer(),
//             const Gap(110),
//             Container(
//               width: double.infinity,
//               child: OutlinedButton(
//                 onPressed: () {},
//                 style: OutlinedButton.styleFrom(
//                   side: BorderSide(
//                       width: 2, color: Color(0xffff99ca)), // สีขอบสีส้ม
//                 ),
//                 child: Text(
//                   'ล้าง',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Color(0xffff99ca), // สีข้อความสีส้ม
//                   ),
//                 ),
//               ),
//             ),
//             const Gap(5),
//             Container(
//               width: double.infinity,
//               child: ElevatedButton(
//                 child: Text(
//                   'บันทึกรายการ',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.white, // สีข้อความขาว
//                   ),
//                 ),
//                 // icon: Icon(
//                 //   Icons.send,
//                 //   color: Colors.white,
//                 // ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xffff99ca), // สีปุ่มสีส้ม
//                 ),
//                 onPressed: () {
//                   // Navigator.pop(context)
//                   Navigator.push(
//                       context,
//                       PageTransition(
//                           child: const AllowanceGeneralInformation(),
//                           type: PageTransitionType.topToBottom));
//                 },
//               ),
//             ),
//             const Gap(30),
//           ],
//         ),
//       ),
//     );
//   }
// }
