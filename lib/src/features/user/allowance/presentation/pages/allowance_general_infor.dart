// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gap/gap.dart';
// import 'package:iconamoon/iconamoon.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:uni_expense/src/features/user/allowance/presentation/pages/allowance_add_list.dart';
// import 'package:uni_expense/src/features/user/allowance/presentation/widgets/customappbar.dart';

// class AllowanceGeneralInformation extends StatefulWidget {
//   const AllowanceGeneralInformation({super.key});

//   @override
//   State<AllowanceGeneralInformation> createState() =>
//       _AllowanceGeneralInformationState();
// }

// class _AllowanceGeneralInformationState
//     extends State<AllowanceGeneralInformation> {
//   final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
//   String _enteredText = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//           image: 'appbar_aollowance.png', title: 'เบี้ยเลี้ยง'),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30),
//           child: Form(
//             key: _keyForm,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'ข้อมูลทั่วไป',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const Gap(20),
//                 // SizedBox(
//                 //   height: MediaQuery.of(context).devicePixelRatio * 8,
//                 // ),
//                 Text(
//                   'ชื่อรายการ',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.grey.shade600),
//                 ),
//                 const Gap(10),
//                 SizedBox(
//                   height: 40,
//                   width: double.infinity,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                             width: 2.0,
//                             color: Color.fromARGB(255, 252, 119, 119)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide(
//                             width: 2.0, color: Colors.grey.withOpacity(0.3)),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Gap(20),
//                 Text(
//                   'สถานที่เกิดค่าใช้จ่าย',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.grey.shade600),
//                 ),
//                 const Gap(10),
//                 Row(
//                   children: [
//                     OutlinedButton(onPressed: () {}, child: Text('ในประเทศ')),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.03,
//                     ),
//                     OutlinedButton(onPressed: () {}, child: Text('ต่างประเทศ')),
//                   ],
//                 ),
//                 const Gap(20),
//                 Text(
//                   'สกุลเงิน',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.grey.shade600),
//                 ),
//                 const Gap(10),
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(
//                           color: Colors.grey.withOpacity(0.3), width: 2)),
//                   height: 40,
//                   width: double.infinity,
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton(
//                       borderRadius: BorderRadius.circular(30),
//                       icon: Icon(
//                         IconaMoon.arrowDown2,
//                         color: Colors.grey.withOpacity(0.3),
//                       ),
//                       // iconSize: 36.0,
//                       padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).devicePixelRatio * 7.5,
//                         right: MediaQuery.of(context).devicePixelRatio * 3,
//                       ),
//                       isExpanded: true,
//                       value: 'THB',
//                       items: const [
//                         DropdownMenuItem(
//                           value: 'THB',
//                           child: Text('THB - ไทย'),
//                         ),
//                         DropdownMenuItem(
//                           value: 'Option 2',
//                           child: Text('Option 2'),
//                         ),
//                         DropdownMenuItem(
//                           value: 'Option 3',
//                           child: Text('Option 3'),
//                         ),
//                       ],
//                       onChanged: (value) {},
//                       // style: Theme.of(context).textTheme.title,
//                     ),
//                   ),
//                 ),
//                 const Gap(30),
//                 Divider(
//                   color: Colors.grey.shade300,
//                   height: 1,
//                 ),
//                 const Gap(20),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'รายการ',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     InkWell(
//                       borderRadius: BorderRadius.circular(30.0),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           PageTransition(
//                             duration: Durations.medium1,
//                             type: PageTransitionType.rightToLeft,
//                             child: const AllowanceAddList(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color(0xffff99ca),
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                             horizontal:
//                                 MediaQuery.of(context).devicePixelRatio * 7,
//                             vertical:
//                                 MediaQuery.of(context).devicePixelRatio * 2.5),
//                         // shape: Border.all(width: 2),
//                         // onPressed: () => {},
//                         // fillColor: ,
//                         child: Text(
//                           '+ เพิ่มรายการ',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 Padding(
//                   padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).devicePixelRatio * 1,
//                       bottom: MediaQuery.of(context).devicePixelRatio * 1),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.08,
//                     alignment: AlignmentDirectional.center,
//                     width: double.infinity,
//                     // color: Colors.red,
//                     child: Text(
//                       'ยังไม่มีรายการ',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey),
//                     ),
//                   ),
//                 ),
//                 Divider(
//                   color: Colors.grey.shade300,
//                   height: 1,
//                 ),
//                 const Gap(25),
//                 const Text(
//                   'สรุปรายการ',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const Gap(10),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'สรุปจำนวนวันเดินทาง',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey),
//                     ),
//                     Text(
//                       '0 บาท',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 const Gap(5),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'เบี้ยเลี้ยง/วัน',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey),
//                     ),
//                     Text(
//                       '0 บาท',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 const Gap(5),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'เบี้ยเลี้ยงตามอัตราราชการ',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey),
//                     ),
//                     Text(
//                       '0 บาท',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 const Gap(5),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'มูลค่าสุทธิรวม',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.black),
//                     ),
//                     Text(
//                       '0 บาท',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.black),
//                     ),
//                   ],
//                 ),
//                 const Gap(25),
//                 Divider(
//                   color: Colors.grey.shade300,
//                   height: 1,
//                 ),
//                 const Gap(25),
//                 const Text(
//                   'แนบไฟล์เอกสาร',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const Gap(25),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                         20), // Use BorderRadius.circular for rounded corners
//                     color: Color.fromRGBO(255, 234, 239, 0.29),
//                   ),
//                   // width: MediaQuery.of(context).size.width * 0.9,
//                   // height: MediaQuery.of(context).size.height * 0.17,
//                   width: double.infinity,
//                   height: 208,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/images/img_expense_pick.png",
//                         fit: BoxFit.fill,
//                       ),
//                       const Text('อัพโหลดไฟล์ที่นี่'),
//                       const Gap(5),
//                       ClipOval(
//                         child: Material(
//                           color: Color(0xffff99ca), // Button color
//                           child: InkWell(
//                             splashColor: Color(0xffff99ca), // Splash color
//                             onTap: () {},
//                             child: const SizedBox(
//                                 width: 56,
//                                 height: 56,
//                                 child: Icon(IconaMoon.share2,
//                                     color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Gap(25),
//                 Divider(
//                   color: Colors.grey.shade300,
//                   height: 1,
//                 ),
//                 const Gap(30),
//                 const Text(
//                   'หมายเหตุ (เพิ่มเติม)',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const Gap(20),
//                 SizedBox(
//                   // color: Colors.red,
//                   // height: 200,
//                   width: double.infinity,
//                   child: TextFormField(
//                     onChanged: (value) {
//                       setState(() {
//                         _enteredText = value;
//                       });
//                     },

//                     minLines: 2,
//                     maxLines: 5,
//                     // maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                     maxLength: 500,
//                     // style: ,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(500),
//                     ],
//                     decoration: InputDecoration(
//                       isDense: true,
//                       counterText: '${_enteredText.length.toString()} / ${500}',
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 16),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                             width: 2.0,
//                             color: Color.fromARGB(255, 252, 119, 119)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide(
//                             width: 2.0, color: Colors.grey.withOpacity(0.3)),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const Gap(20),
//                 Divider(
//                   color: Colors.grey.shade300,
//                   height: 1,
//                 ),
//                 const Gap(30),
//                 SizedBox(
//                   width: double.infinity,
//                   child: OutlinedButton.icon(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(
//                           width: 2, color: Color(0xffff99ca)), // สีขอบสีส้ม
//                     ),
//                     icon: const Icon(Icons.save_as, color: Color(0xffff99ca)),
//                     label: const Text(
//                       'บันทึกแบบร่าง',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xffff99ca), // สีข้อความสีส้ม
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Gap(10),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton.icon(
//                     label: const Text(
//                       'ส่งอนุมัติ',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // สีข้อความขาว
//                       ),
//                     ),
//                     icon: const Icon(
//                       Icons.send,
//                       color: Colors.white,
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Color(0xffff99ca), // สีปุ่มสีส้ม
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 const Gap(10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
