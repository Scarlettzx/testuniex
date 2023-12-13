import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconamoon/iconamoon.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:pinput/pinput.dart';
import 'package:uni_expense/src/components/models/typeprice_model.dart';
import 'package:uni_expense/src/features/user/expense/presentation/pages/expense.dart';
import 'package:uni_expense/src/features/user/expense/presentation/widgets/calender_page.dart';

import '../../../allowance/presentation/widgets/customappbar.dart';

class AddListExpense extends StatefulWidget {
  final TypePriceModel typeprice;
  const AddListExpense({super.key, required this.typeprice});

  @override
  State<AddListExpense> createState() => _AddListExpenseState();
}

class _AddListExpenseState extends State<AddListExpense> {
  // ? service = สินค้า/บริการ
  final serviceController = TextEditingController();
  // ? description = รายละเอียด
  final descriptionController = TextEditingController();
  // ? amout = จำนวน
  final amountController = TextEditingController();
  // ? unitPrice = ราคาต่อหน่วย
  final unitPriceController = TextEditingController();
  // ? taxpercent = ภาษี
  final taxPercentController = TextEditingController();
  // ? withholdingpercent = หักราคา ณ ที่จ่าย
  final withholdingpercentController = TextEditingController();
  // // ? ภาษี = ราคาต่อหน่วย
  // final texPercentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  DateTime? selectedDay;
  @override
  void initState() {
    super.initState();
    // checkTypepriceandSetdefault();
  }

  // Future<void> checkselectdate() async {
  //   if (selectedDate != null) {
  //     setState(() {
  //       selectedDay = selectedDate;
  //     });
  //   }
  // }

  // void checkTypepriceandSetdefault() {
  //   amountController.text = "1";
  //   unitPriceController.text = "0";
  //   withholdingpercentController.text = "0";
  //   if (widget.typeprice.type == "รวมภาษี" ||
  //       widget.typeprice.type == "แยกภาษี") {
  //     taxPercentController.text = "7";
  //   } else if (widget.typeprice.type == "ไม่มีภาษี") {
  //     taxPercentController.text = "0";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          image: "appbar_expenseandgood.png", title: 'ซื้อสินค้า/ค่าใช้จ่าย'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'เพิ่มรายการ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(15),
                Text(
                  'วันที่เอกสาร',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600),
                ),
                Gap(10),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio * 7),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(width: 4),
                        // Gap(0.2),
                        Text(
                          (selectedDay) != null
                              ? DateFormat.yMMMd('th').format(selectedDay!)
                              : 'Select a date',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          // alignment: Alignment.bottomLeft,
                          onPressed: () async {
                            selectedDate = await Navigator.push(
                              context,
                              PageTransition(
                                child: CalenderPage(selectedDay: selectedDay),
                                type: PageTransitionType.topToBottom,
                              ),
                            );
                            // checkselectdate();
                            // Update the state with the selected date
                          },
                          icon: Icon(
                            size: 20,
                            color: Colors.grey.withOpacity(0.6),
                            // color: Colors.grey.shade600,
                            IconaMoon.calendar2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // TextFormField(
                //     // style: ,

                //     // enabled: false,
                //     decoration: InputDecoration(
                //   // enabled: true,
                //   // fillColor:
                //   //     const Color.fromARGB(255, 237, 237, 237).withOpacity(0.5),
                //   // filled: true,

                //   // enabled: false,
                //   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                //   // focusedBorder: OutlineInputBorder(
                //   //   borderSide: const BorderSide(
                //   //       width: 2.0, color: Color.fromARGB(255, 252, 119, 119)),
                //   //   borderRadius: BorderRadius.circular(30),
                //   // ),
                //   // suffix: ,
                //   suffixIcon: GestureDetector(
                //     onTap: () {
                //       print('ues');
                //       Navigator.push(
                //           context,
                //           PageTransition(
                //               child: CalenderPage(),
                //               type: PageTransitionType.bottomToTop));
                //       // const
                //     },
                //     child: Icon(
                //       IconaMoon.calendar2,
                //     ),
                //   ),
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(30),
                //     borderSide: BorderSide(
                //         width: 2.0, color: Colors.grey.withOpacity(0.3)),
                //   ),
                //   // enabledBorder: OutlineInputBorder(
                //   //   borderRadius: BorderRadius.circular(30),
                //   //   borderSide: BorderSide(
                //   //       width: 2.0, color: Colors.grey.withOpacity(0.3)),
                //   // ),
                //   // ),
                //   // ),
                // )
                //     // )

                //     ),
                Gap(20),
                Text(
                  'สินค้า/บริการ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600),
                ),
                Gap(10),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: TextFormField(
                    // style: ,

                    decoration: InputDecoration(
                      // fillColor: const Color.fromARGB(255, 237, 237, 237)
                      //     .withOpacity(0.5),
                      // filled: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2.0,
                            color: Color.fromARGB(255, 252, 119, 119)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2.0, color: Colors.grey.withOpacity(0.3)),
                      ),
                    ),
                  ),
                ),
                Gap(20),
                Text(
                  'รายละเอียด',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600),
                ),
                Gap(10),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: TextFormField(
                    // style: ,
                    decoration: InputDecoration(
                      // fillColor: const Color.fromARGB(255, 237, 237, 237)
                      //     .withOpacity(0.5),
                      // filled: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2.0,
                            color: Color.fromARGB(255, 252, 119, 119)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2.0, color: Colors.grey.withOpacity(0.3)),
                      ),
                    ),
                  ),
                ),
                Gap(20),
                // ! AMOUT & UNITPRICE
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ! AMOUT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'จำนวน',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        Gap(10),
                        SizedBox(
                          height: 30,
                          width: 150,
                          child: TextFormField(
                            // style: ,
                            controller: amountController,
                            decoration: InputDecoration(
                              // fillColor: const Color.fromARGB(255, 237, 237, 237)
                              //     .withOpacity(0.5),
                              // filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2.0,
                                    color: Color.fromARGB(255, 252, 119, 119)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: Colors.grey.withOpacity(0.3)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(30),
                    // ! UNITPRICE
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ราคา/หน่วย',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        Gap(10),
                        SizedBox(
                          height: 30,
                          width: 150,
                          child: TextFormField(
                            // style: ,
                            controller: unitPriceController,
                            decoration: InputDecoration(
                              // fillColor: const Color.fromARGB(255, 237, 237, 237)
                              //     .withOpacity(0.5),
                              // filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2.0,
                                    color: Color.fromARGB(255, 252, 119, 119)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: Colors.grey.withOpacity(0.3)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Gap(20),
                  ],
                ),
                // ! TAXPERCENT & WITHHOLDINGPERCENT
                Gap(20),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ภาษี',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        Gap(10),
                        SizedBox(
                          height: 30,
                          width: 150,
                          child: TextFormField(
                            controller: taxPercentController,
                            // initialValue: taxPercentController.text,
                            // style: ,
                            decoration: InputDecoration(
                              // fillColor: const Color.fromARGB(255, 237, 237, 237)
                              //     .withOpacity(0.5),
                              // filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2.0,
                                    color: Color.fromARGB(255, 252, 119, 119)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: Colors.grey.withOpacity(0.3)),
                              ),
                              // Add a suffix icon with the percentage sign
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'หักราคา ณ ที่จ่าย',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        Gap(10),
                        SizedBox(
                          height: 30,
                          width: 150,
                          child: TextFormField(
                            // style: ,
                            controller: withholdingpercentController,
                            decoration: InputDecoration(
                              // fillColor: const Color.fromARGB(255, 237, 237, 237)
                              //     .withOpacity(0.5),
                              // filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2.0,
                                    color: Color.fromARGB(255, 252, 119, 119)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: Colors.grey.withOpacity(0.3)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Gap(20),
                  ],
                ),
                Gap(20),

                Text(
                  'มูลค่ารวมก่อนภาษี',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600),
                ),
                Gap(10),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: TextFormField(
                    // style: ,
                    readOnly: true,
                    decoration: InputDecoration(
                      // fillColor: const Color.fromARGB(255, 237, 237, 237)
                      //     .withOpacity(0.5),
                      // filled: true,

                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2.0,
                            color: Color.fromARGB(255, 252, 119, 119)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2.0, color: Colors.grey.withOpacity(0.3)),
                      ),
                    ),
                  ),
                ),
                // Gap(20),
                // Text(
                //   'หักราคา ณ ที่จ่าย',
                //   style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.normal,
                //       color: Colors.grey.shade600),
                // ),
                // Gap(10),
                // SizedBox(
                //   height: 30,
                //   width: double.infinity,
                //   child: TextFormField(
                //     // style: ,
                //     decoration: InputDecoration(
                //       // fillColor: const Color.fromARGB(255, 237, 237, 237)
                //       //     .withOpacity(0.5),
                //       // filled: true,
                //       contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //             width: 2.0,
                //             color: Color.fromARGB(255, 252, 119, 119)),
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30),
                //         borderSide: BorderSide(
                //             width: 2.0, color: Colors.grey.withOpacity(0.3)),
                //       ),
                //     ),
                //   ),
                // ),
                const Gap(50),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: 2, color: Color(0xffff99ca)), // สีขอบสีส้ม
                    ),
                    child: Text(
                      'ล้าง',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffff99ca), // สีข้อความสีส้ม
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'บันทึกรายการ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white, // สีข้อความขาว
                      ),
                    ),
                    // icon: Icon(
                    //   Icons.send,
                    //   color: Colors.white,
                    // ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffff99ca), // สีปุ่มสีส้ม
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const Expense(),
                              type: PageTransitionType.topToBottom));
                    },
                  ),
                ),
                const Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
