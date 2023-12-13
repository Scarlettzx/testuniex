// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:gap/gap.dart';
import 'package:iconamoon/iconamoon.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
// import 'package:multiple_search_selection/helpers/search_controller.dart';
// import 'package:multiple_search_selection/multiple_search_selection.dart';
import 'package:page_transition/page_transition.dart';
import 'package:searchfield/searchfield.dart';
import 'package:uni_expense/injection_container.dart';
import 'package:uni_expense/src/features/user/expense/presentation/bloc/expensegood_bloc.dart';
import 'package:uni_expense/src/features/user/expense/presentation/pages/add_list_expense.dart';

import '../../../../../components/concurrency.dart';
import '../../../../../components/models/concurrency_model,.dart';
import '../../../../../components/models/typeprice_model.dart';
import '../../../../../components/typeprice.dart';
import '../../../allowance/presentation/widgets/customappbar.dart';
// import '../../domain/entities/entities.dart';
// import '../../domain/entities/entities.dart';

class Expense extends StatefulWidget {
  const Expense({
    super.key,
  });

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  List<String> locationexpensel = ['ในประเทศ', 'ต่างประเทศ'];
  late int _tabTextIndexSelected;
  late ConcurrencyModel _selectedCurrency;
  late TypePriceModel _selectedTypeprice;
  List<ConcurrencyModel> currencies = [];
  List<TypePriceModel> datatypeprice = [];
  // final MultipleSearchController controller = MultipleSearchController();
  // final MultiSelectController _controller = MultiSelectController();
  final expenseGoodBloc = sl<ExpenseGoodBloc>();
  List<String> selectedValues = [];
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  // late ScrollController _scrollController;
  // Color _bgColor = Colors.white;
  // Color _textColor = Colors.black;
  List<String> nameaudit = [];
  // static const kExpandedHeight = 200.0;
  var currentLength = 0;
  bool isFocused = true;
  String _enteredText = '';
  @override
  void initState() {
    super.initState();
    _tabTextIndexSelected = 0;
    // _loadCurrencies();
    // _loadTypePrice();
    expenseGoodBloc.add(GetEmployeesAllRolesDataEvent());
    // _scrollController = ScrollController()
    //   ..addListener(() {
    //     setState(() {
    //       _bgColor = _isSliverAppBarExpanded ? Colors.pink : Colors.white;
    //       _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
    //     });
    //   });
  }

  void _loadCurrencies() async {
    final jsonContent = await DefaultAssetBundle.of(context)
        .loadString('assets/json/concurrency.json');
    setState(() {
      currencies = loadConcurrencyData(jsonContent);
      _selectedCurrency = currencies.first; // Set a default currency
    });
  }

  void _loadTypePrice() async {
    final jsonContent = await DefaultAssetBundle.of(context)
        .loadString('assets/json/typeprice.json');
    setState(() {
      datatypeprice = loadTypePriceData(jsonContent);
      _selectedTypeprice = datatypeprice.first; // Set a default currency
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
            image: "appbar_expenseandgood.png", title: 'ซื้อสินค้า/ค่าใช้จ่าย'),
        body: BlocProvider(
          create: (_) => expenseGoodBloc,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _keyForm,
              child: BlocBuilder<ExpenseGoodBloc, ExpenseGoodState>(
                builder: (BuildContext context, ExpenseGoodState state) {
                  if (state is ExpenseGoodInitial) {
                    return Text(
                      "ไม่พบข้อมูล",
                      // style: TextStyle(),
                    );
                  } else if (state is ExpenseGoodLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ExpenseGoodFinish) {
                    // Define your options list
                    // print(state.empsallrole?.length);
                    // expenseGoodBloc
                    //     .add(GetEmployeesAllRolesDataEvent as ExpenseGoodEvent);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 5,
                        ),
                        Text(
                          'ข้อมูลทั่วไป',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Text(
                          'ชื่อรายการ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),
                        SizedBox(
                          height: 40,
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
                                    width: 2.0,
                                    color: Colors.grey.withOpacity(0.3)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Text(
                          'ผู้อนุมัติ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),

                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: SearchField(
                            // focusNode: focus,

                            suggestionState: Suggestion.expand,
                            scrollbarDecoration: ScrollbarDecoration(
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(2),
                                        bottom: Radius.circular(2)),
                                    side: BorderSide(
                                        width: 1, color: Colors.red)),
                                thumbColor: Colors.grey),
                            itemHeight: 50,
                            emptyWidget: Container(
                              alignment: Alignment.center,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.grey.shade300),
                                // padding: EdgeInsets.only(right: 8, top: 8, bottom: 8),
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 8.0, // soften the shadow
                                    spreadRadius: 20.0, //extend the shadow
                                    offset: Offset(
                                      2.0,
                                      5.0,
                                    ),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Text('ไม่พบข้อมูล'),
                            ),
                            suggestions: state.empsallrole!
                                .map((e) => SearchFieldListItem(
                                    "${e.firstnameTh}  ${e.lastnameTh}",
                                    // "${e.idEmployees}",
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${e.firstnameTh}  ${e.lastnameTh}"),
                                    )))
                                .toList(),
                            // style: ,
                            suggestionsDecoration: SuggestionDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.grey.shade300),
                              padding:
                                  EdgeInsets.only(right: 8, top: 8, bottom: 8),
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 8.0, // soften the shadow
                                  spreadRadius: 20.0, //extend the shadow
                                  offset: Offset(
                                    2.0,
                                    5.0,
                                  ),
                                ),
                              ],
                            ),

                            searchInputDecoration: InputDecoration(
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
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Text(
                          'CC ถึง',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),

                        MultiSelectDropDown(
                          // inputDecoration: ,
                          // selectedOptions: [],
                          // optionSeparator: ,
                          onOptionSelected: (options) {
                            // Extract email addresses from selected values and update the list
                            setState(() {
                              selectedValues = options
                                  .map((item) {
                                    if (item.value != null) {
                                      // Assuming email is included in the label
                                      // Split the label and extract the email part
                                      final email = item.label.split('\n')[1];
                                      return email.trim();
                                    }
                                    return null;
                                  })
                                  .whereType<String>() // Filter out null values
                                  .toList();
                            });
                            // Dismiss the focus of the MultiSelectDropDown
                            FocusScope.of(context).unfocus();
                            // Dismiss the focus of the MultiSelectDropDown
                            // FocusScope.of(context).unfocus();
                            // Print selected email addresses for debugging
                            debugPrint(selectedValues.toString());
                          },
                          showClearIcon: true,
                          // controller: _controller,
                          // onOptionSelected: (options) {
                          //   debugPrint(options.toString());
                          // },
                          options: state.empsallrole!
                              .map((employee) => ValueItem(
                                  label:
                                      '${employee.firstnameTh!}  ${employee.lastnameTh} \n${employee.email}',
                                  value: employee.firstnameTh! +
                                      employee.lastnameTh!))
                              .toList(),
                          maxItems: 3,
                          // disabledOptions: const [
                          //   ValueItem(label: 'Option 1', value: '1')
                          // ],
                          searchEnabled: true,
                          borderRadius: 30,
                          selectionType: SelectionType.multi,
                          chipConfig: const ChipConfig(
                              wrapType: WrapType.scroll, autoScroll: true),
                          dropdownHeight: 300,
                          optionTextStyle: const TextStyle(fontSize: 16),
                          selectedOptionIcon: const Icon(Icons.check_circle),
                        ),
                        // Text(
                        //   'ผู้อนุมัติ',
                        //   style: TextStyle(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.normal,
                        //       color: Colors.grey.shade600),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).devicePixelRatio * 4,
                        // ),

//                         SizedBox(
//                           height: 40,
//                           width: double.infinity,
//                           child: SearchField(
//                             // comparator: ,
//                             // focusNode: focus,

//                             suggestionState: Suggestion.expand,
//                             scrollbarDecoration: ScrollbarDecoration(
//                                 shape: BeveledRectangleBorder(
//                                     borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(2),
//                                         bottom: Radius.circular(2)),
//                                     side: BorderSide(
//                                         width: 1, color: Colors.red)),
//                                 thumbColor: Colors.grey),
//                             itemHeight: 50,
//                             emptyWidget: Container(
//                               alignment: Alignment.center,
//                               height: 70,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     width: 2, color: Colors.grey.shade300),
//                                 // padding: EdgeInsets.only(right: 8, top: 8, bottom: 8),
//                                 // shape: BoxShape.circle,
//                                 borderRadius: BorderRadius.circular(15),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.white,
//                                     blurRadius: 8.0, // soften the shadow
//                                     spreadRadius: 20.0, //extend the shadow
//                                     offset: Offset(
//                                       2.0,
//                                       5.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text('ไม่พบข้อมูล'),
//                             ),
//                             // onSuggestionTap: ,
// // suggestionItemDecoration: SuggestionDecoration( ),
//                             suggestions: state.empsallrole!
//                                 .map((e) => SearchFieldListItem(

//                                     "${e.firstnameTh}  ${e.lastnameTh}",
//                                     // "${e.idEmployees}",
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                               "${e.firstnameTh}  ${e.lastnameTh}"),
//                                           Text(
//                                               "${e.email}"),
//                                         ],
//                                       ),
//                                     )))
//                                 .toList(),
//                             // style: ,
//                             suggestionsDecoration: SuggestionDecoration(
//                               border: Border.all(
//                                   width: 2, color: Colors.grey.shade300),
//                               padding:
//                                   EdgeInsets.only(right: 8, top: 8, bottom: 8),
//                               // shape: BoxShape.circle,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.white,
//                                   blurRadius: 8.0, // soften the shadow
//                                   spreadRadius: 20.0, //extend the shadow
//                                   offset: Offset(
//                                     2.0,
//                                     5.0,
//                                   ),
//                                 ),
//                               ],
//                             ),

//                             searchInputDecoration: InputDecoration(
//                               // fillColor: const Color.fromARGB(255, 237, 237, 237)
//                               //     .withOpacity(0.5),
//                               // filled: true,

//                               contentPadding:
//                                   const EdgeInsets.symmetric(horizontal: 16),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     width: 2.0,
//                                     color: Color.fromARGB(255, 252, 119, 119)),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide(
//                                     width: 2.0,
//                                     color: Colors.grey.withOpacity(0.3)),
//                               ),
//                             ),
//                           ),
//                         ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),

                        // MultipleSearchSelection<EmployeesAllRolesEntity>(
                        //     clearSearchFieldOnSelect: true,
                        //     searchFieldTextStyle:
                        //         TextStyle(fontFamily: 'kanit'),
                        //     selectAllButton: ElevatedButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         "เลือกทั้งหมด",
                        //         style: TextStyle(
                        //             color: Colors.white, fontSize: 17),
                        //       ),
                        //       style: ElevatedButton.styleFrom(
                        //           backgroundColor: const Color(0xff6FC9E4)),
                        //     ),
                        //     clearAllButton: ElevatedButton(
                        //       onPressed: () {},
                        //       child: Text("ล้างทั้งหมด",
                        //           style: TextStyle(
                        //               color: Colors.white, fontSize: 17)),
                        //       style: ElevatedButton.styleFrom(
                        //           backgroundColor: const Color(0xffE793B8)),
                        //     ),
                        //     items: state.empsallrole!,
                        //     searchFieldInputDecoration: InputDecoration(
                        //       contentPadding: EdgeInsets.all(15),
                        //       hintText: "ค้นหาหัวหน้างาน",
                        //       border: const OutlineInputBorder(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(5))),
                        //     ),
                        //     fieldToCheck: (c) {
                        //       return c.firstnameTh!;
                        //     },
                        //     itemBuilder: (manager, index) {
                        //       return Padding(
                        //         padding: const EdgeInsets.all(6.0),
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(10),
                        //             color: Colors.white,
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //               vertical: 10.0,
                        //               horizontal: 12,
                        //             ),
                        //             child: ListTile(
                        //               title: Text(
                        //                   "${manager.firstnameTh!} ${manager.lastnameTh!}"),
                        //               subtitle: Text(manager.email!),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     enableSuggestions: true,
                        //     pickedItemBuilder: (manager) {
                        //       return Container(
                        //         decoration: BoxDecoration(
                        //           color: Colors.grey.shade300,
                        //           border: Border.all(color: Colors.transparent),
                        //           borderRadius: BorderRadius.circular(20),
                        //         ),
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               Text(
                        //                 "${manager.firstnameTh!} ${manager.lastnameTh!}",
                        //                 style: TextStyle(fontSize: 16),
                        //               ),
                        //               const SizedBox(
                        //                 width: 5,
                        //               ),
                        //               const Icon(
                        //                 Icons.cancel,
                        //                 size: 20,
                        //                 color: Colors.grey,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     },

                        //     // onTapShowedItem: () {},
                        //     // onTapClearAll: () {
                        //     //   setState(() {
                        //     //     selectedManager.clear();
                        //     //   });
                        //     // },
                        //     // onTapSelectAll: () {
                        //     //   setState(() {
                        //     //     selectedManager.clear();
                        //     //     selectedManager = [...widget.managerData];
                        //     //   });
                        //     // },
                        //     // onPickedChange: (items) {},
                        //     // onItemAdded: (item) {
                        //     //   setState(() {
                        //     //     selectedManager.add(item);
                        //     //   });
                        //     // },
                        //     // onItemRemoved: (item) {
                        //     //   setState(() {
                        //     //     selectedManager.removeWhere((element) =>
                        //     //         element.idEmployees == item.idEmployees);
                        //     //   });
                        //     // },
                        //     sortShowedItems: true,
                        //     sortPickedItems: true,
                        //     fuzzySearch: FuzzySearch.none,
                        //     itemsVisibility: ShowedItemsVisibility.alwaysOn,
                        //     title: Text(
                        //       'CC ถึงหัวหน้า',
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //     showSelectAllButton: false,
                        //     maximumShowItemsHeight: 200),
                        // SizedBox(
                        //   height: 40,
                        //   width: double.infinity,
                        //   child: TextFormField(
                        //     // style: ,
                        //     decoration: InputDecoration(
                        //       // fillColor: const Color.fromARGB(255, 237, 237, 237)
                        //       //     .withOpacity(0.5),
                        //       // filled: true,
                        //       contentPadding:
                        //           const EdgeInsets.symmetric(horizontal: 16),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             width: 2.0,
                        //             color: Color.fromARGB(255, 252, 119, 119)),
                        //         borderRadius: BorderRadius.circular(30),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(30),
                        //         borderSide: BorderSide(
                        //             width: 2.0,
                        //             color: Colors.grey.withOpacity(0.3)),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Text(
                          'ผู้ตรวจสอบ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),

                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: SearchField(
                            // focusNode: focus,

                            suggestionState: Suggestion.expand,
                            scrollbarDecoration: ScrollbarDecoration(
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(2),
                                        bottom: Radius.circular(2)),
                                    side: BorderSide(
                                        width: 1, color: Colors.red)),
                                thumbColor: Colors.grey),
                            itemHeight: 50,
                            emptyWidget: Container(
                              alignment: Alignment.center,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.grey.shade300),
                                // padding: EdgeInsets.only(right: 8, top: 8, bottom: 8),
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 8.0, // soften the shadow
                                    spreadRadius: 20.0, //extend the shadow
                                    offset: Offset(
                                      2.0,
                                      5.0,
                                    ),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Text('ไม่พบข้อมูล'),
                            ),
                            suggestions: state.empsroleadmin!
                                .map((e) => SearchFieldListItem(
                                    "${e.firstnameTh}  ${e.lastnameTh}",
                                    // "${e.idEmployees}",
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${e.firstnameTh}  ${e.lastnameTh}"),
                                    )))
                                .toList(),
                            // style: ,
                            suggestionsDecoration: SuggestionDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.grey.shade300),
                              padding:
                                  EdgeInsets.only(right: 8, top: 8, bottom: 8),
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 8.0, // soften the shadow
                                  spreadRadius: 20.0, //extend the shadow
                                  offset: Offset(
                                    2.0,
                                    5.0,
                                  ),
                                ),
                              ],
                            ),

                            searchInputDecoration: InputDecoration(
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
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Text(
                          'สถานที่เกิดค่าใช้จ่าย',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),

// Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                        FlutterToggleTab(
                          width: MediaQuery.of(context).devicePixelRatio *
                              20, // width in percent
                          borderRadius: 30,
                          height: MediaQuery.of(context).devicePixelRatio * 15,
                          selectedIndex: _tabTextIndexSelected,
                          selectedBackgroundColors: [Color(0xffff99ca)],
                          selectedTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                          unSelectedTextStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          labels: locationexpensel,
                          selectedLabelIndex: (index) {
                            setState(() {
                              // print("before");
                              // print(_tabTextIndexSelected);
                              // print(_selectedCurrency.code);
                              _tabTextIndexSelected = index;
                              // _selectedCurrency = currencies[0];
                              // print("behind");
                              // print(_tabTextIndexSelected);
                              // print(_selectedCurrency.code);
                            });
                          },
                          isScroll: false,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Text(
                          'สกุลเงิน',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),
                        CurrencyDropdown(
                          currencies: currencies,
                          selectedCurrency: _selectedCurrency,
                          onCurrencyChanged: (newCurrency) {
                            setState(() {
                              _selectedCurrency = newCurrency;
                            });
                          },
                        ),

                        Visibility(
                          visible: !(_selectedCurrency.code == 'TH'),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).devicePixelRatio * 8,
                              ),
                              Text(
                                'อัตราการแลกเปลี่ยน ( บาท ต่อ 1 ${_selectedCurrency.unit})',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade600),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).devicePixelRatio * 4,
                              ),
                              SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: TextFormField(
                                  // style: ,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    // FilteringTextInputFormatter.allow(
                                    //   RegExp(r'^\d{0,2}$'),
                                    // ),
                                  ],
                                  initialValue: '1',
                                  //  maxLength: 2,
                                  decoration: InputDecoration(
                                    // fillColor: const Color.fromARGB(255, 237, 237, 237)
                                    //     .withOpacity(0.5),
                                    // filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2.0,
                                          color: Color.fromARGB(
                                              255, 252, 119, 119)),
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
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Text(
                          'ประเภทราคา',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),
                        CustomDropdownTypePrice(
                          items: datatypeprice,
                          selectedValue: _selectedTypeprice,
                          onChanged: (TypePriceModel? newValue) {
                            setState(() {
                              _selectedTypeprice = newValue!;
                            });
                          },
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(30),
                        //       border: Border.all(
                        //           color: Colors.grey.withOpacity(0.3),
                        //           width: 2)),
                        //   // color: Colors.red,
                        //   height: 40,
                        //   width: double.infinity,
                        //   child: DropdownButtonHideUnderline(
                        //     child: DropdownButton(
                        //       borderRadius: BorderRadius.circular(30),
                        //       icon: Icon(
                        //         IconaMoon.arrowDown2,
                        //         color: Colors.grey.withOpacity(0.3),
                        //       ),
                        //       // iconSize: 36.0,
                        //       padding: EdgeInsets.only(
                        //         left: MediaQuery.of(context).devicePixelRatio *
                        //             7.5,
                        //         right:
                        //             MediaQuery.of(context).devicePixelRatio * 3,
                        //       ),
                        //       isExpanded: true,
                        //       value: 'THB',
                        //       items: [
                        //         DropdownMenuItem(
                        //           value: 'THB',
                        //           child: Text('THB - ไทย'),
                        //         ),
                        //         DropdownMenuItem(
                        //           value: 'Option 2',
                        //           child: Text('Option 2'),
                        //         ),
                        //         DropdownMenuItem(
                        //           value: 'Option 3',
                        //           child: Text('Option 3'),
                        //         ),
                        //       ],
                        //       onChanged: (value) {},
                        //       // style: Theme.of(context).textTheme.title,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'รายการ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(30.0),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Durations.extralong1,
                                    type: PageTransitionType.rightToLeft,
                                    child: AddListExpense(
                                        typeprice: _selectedTypeprice),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffff99ca),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context)
                                            .devicePixelRatio *
                                        7,
                                    vertical: MediaQuery.of(context)
                                            .devicePixelRatio *
                                        2.5),
                                // shape: Border.all(width: 2),
                                // onPressed: () => {},
                                // fillColor: ,
                                child: Text(
                                  '+ เพิ่มรายการ',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio * 1,
                              bottom:
                                  MediaQuery.of(context).devicePixelRatio * 1),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            alignment: AlignmentDirectional.center,
                            width: double.infinity,
                            // color: Colors.red,
                            child: Text(
                              'ยังไม่มีรายการ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        Text(
                          'สรุปรายการ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'มูลค่ารวม',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            Text(
                              '0 บาท',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'ภาษีมูลค่าเพิ่มรวม',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            Text(
                              '0 บาท',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'หัก ณ ที่จ่ายรวม',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            Text(
                              '0 บาท',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'มูลค่าสุทธิรวม',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              '0 บาท',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        Text(
                          'แนบไฟล์เอกสาร',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Use BorderRadius.circular for rounded corners
                            color: Color.fromRGBO(255, 234, 239, 0.29),
                          ),
                          // width: MediaQuery.of(context).size.width * 0.9,
                          // height: MediaQuery.of(context).size.height * 0.17,
                          width: double.infinity,
                          height: 208,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/img_expense_pick.png",
                                fit: BoxFit.fill,
                              ),
                              Text('อัพโหลดไฟล์ที่นี่'),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).devicePixelRatio * 3,
                              ),
                              ClipOval(
                                child: Material(
                                  color: Color(0xffff99ca), // Button color
                                  child: InkWell(
                                    splashColor:
                                        Color(0xffff99ca), // Splash color
                                    onTap: () {},
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(IconaMoon.share2,
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        Text(
                          'หมายเหตุ (เพิ่มเติม)',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        Container(
                          // color: Colors.red,
                          // height: 200,
                          width: double.infinity,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _enteredText = value;
                              });
                            },

                            minLines: 3,
                            maxLines: 5,
                            // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            maxLength: 500,
                            // style: ,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(500),
                            ],
                            decoration: InputDecoration(
                              // counterStyle: TextStyle(
                              //   height: double,
                              // ),
                              // counter: Offstage(),

                              // counter: SizedBox.shrink(),
                              // suffixText:
                              //     '${textLength.toString()}/${maxLength.toString()}',
                              // counterText: "",
                              isDense: true,
                              // Display the number of entered characters
                              // counter: SizedBox.expand(),
                              counterText:
                                  '${_enteredText.length.toString()} / ${500}',
                              // style counter text
                              // counterStyle:
                              //     TextStyle(fontSize: 22, color: Colors.purple),
                              // fillColor: const Color.fromARGB(255, 237, 237, 237)
                              //     .withOpacity(0.5),
                              // filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
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
                          //       child: TextField(
                          //         maxLength: 250,
                          //         buildCounter: (_,
                          //                 {required currentLength,
                          //                 maxLength,
                          //                 required isFocused}) =>
                          //             Padding(
                          //           padding: const EdgeInsets.only(left: 16.0),
                          //           child: Container(
                          //               alignment: Alignment.bottomRight,
                          //               child: Text("$currentLength/$maxLength")),
                          //         ),
                        ),
                        const Gap(20),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1,
                        ),
                        const Gap(30),
                        Container(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 2,
                                  color: Color(0xffff99ca)), // สีขอบสีส้ม
                            ),
                            icon: Icon(Icons.save_as, color: Color(0xffff99ca)),
                            label: Text(
                              'บันทึกแบบร่าง',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffff99ca), // สีข้อความสีส้ม
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            label: Text(
                              'ส่งอนุมัติ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // สีข้อความขาว
                              ),
                            ),
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffff99ca), // สีปุ่มสีส้ม
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    );
                  } else if (state is ExpenseGoodFailure) {
                    return const Text("error");
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
      // body: CustomScrollView(
      //   physics: const BouncingScrollPhysics(),
      //   controller: _scrollController,
      //   slivers: [
      //     SliverAppBar(
      //         leading: IconButton(
      //           icon: Icon(IconaMoon.arrowLeft2, color: _textColor),
      //           onPressed: () => Navigator.of(context).pop(PageTransition(
      //               duration: Durations.extralong4,
      //               type: PageTransitionType.leftToRight,
      //               child: Expense())),
      //         ),
      //         stretch: true,
      //         // strec
      //         // shape: RoundedRectangleBorder(
      //         //   borderRadius: BorderRadius.only(
      //         //       bottomLeft:
      //         //           Radius.circular(70) // Adjust the radius as needed
      //         //       ),
      //         // ),
      //         // titleTextStyle: TextStyle(
      //         //   color: _textColor,
      //         // ),
      //         pinned: true,
      //         floating: true,
      //         snap: true,
      //         expandedHeight: kExpandedHeight,
      //         backgroundColor: _bgColor,
      //         flexibleSpace: FlexibleSpaceBar(
      //           background: Image.asset(
      //             "assets/images/Rectangle.png",
      //             // repeat: ImageRepeat.noRepeat,
      //             fit: BoxFit.fill,
      //           ),
      //           // collapseMode: CollapseMode.parallax,
      //           stretchModes: const [StretchMode.zoomBackground],
      //           // Stack(
      //           //   children: [
      //           //     Container(
      //           //       decoration: const BoxDecoration(
      //           //         image: DecorationImage(
      //           //           image: AssetImage("assets/images/Rectangle.png"),
      //           //           repeat: ImageRepeat.noRepeat,
      //           //           fit: BoxFit.cover,
      //           //         ),
      //           //       ),
      //           //     ),
      //           //   ],
      //           // ),

      //           title:
      //               // top: MediaQuery.of(context).devicePixelRatio * 60,
      //               // left: MediaQuery.of(context).devicePixelRatio * 8,
      //               Text(
      //             // textScaleFactor: 1,
      //             'ซื้อสินค้า/ค่าใช้จ่าย',
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //                 color: _textColor),
      //           ),
      //           // ),
      //         )
      //         // ]
      //         ),
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(
      //             horizontal: MediaQuery.of(context).devicePixelRatio * 8,
      //             vertical: MediaQuery.of(context).devicePixelRatio * 10),
      //         child: Form(
      //           key: _keyForm,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'ข้อมูลทั่วไป',
      //                 style: TextStyle(
      //                     fontSize: 16, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 8,
      //               ),
      //               Text(
      //                 'ชื่อรายการ',
      //                 style: TextStyle(
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.normal,
      //                     color: Colors.grey.shade600),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 4,
      //               ),
      //               SizedBox(
      //                 height: 40,
      //                 width: double.infinity,
      //                 child: TextFormField(
      //                   // style: ,
      //                   decoration: InputDecoration(
      //                     // fillColor: const Color.fromARGB(255, 237, 237, 237)
      //                     //     .withOpacity(0.5),
      //                     // filled: true,
      //                     contentPadding:
      //                         const EdgeInsets.symmetric(horizontal: 16),
      //                     focusedBorder: OutlineInputBorder(
      //                       borderSide: const BorderSide(
      //                           width: 2.0,
      //                           color: Color.fromARGB(255, 252, 119, 119)),
      //                       borderRadius: BorderRadius.circular(30),
      //                     ),
      //                     enabledBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(30),
      //                       borderSide: BorderSide(
      //                           width: 2.0,
      //                           color: Colors.grey.withOpacity(0.3)),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 8,
      //               ),
      //               Text(
      //                 'สถานที่เกิดค่าใช้จ่าย',
      //                 style: TextStyle(
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.normal,
      //                     color: Colors.grey.shade600),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 4,
      //               ),
      //               Row(
      //                 children: [
      //                   ElevatedButton(
      //                       onPressed: () {}, child: Text('ในประเทศ')),
      //                   SizedBox(
      //                     width: MediaQuery.of(context).size.width * 0.03,
      //                   ),
      //                   ElevatedButton(
      //                       onPressed: () {}, child: Text('ต่างประเทศ')),
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 8,
      //               ),
      //               Text(
      //                 'สกุลเงิน',
      //                 style: TextStyle(
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.normal,
      //                     color: Colors.grey.shade600),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 4,
      //               ),
      //               // DropdownButton(
      //               //   // padding: const EdgeInsets.symmetric(horizontal: 16),
      //               //   borderRadius: BorderRadius.circular(30),
      //               //   icon: Icon(Icons.arrow_drop_down),
      //               //   iconSize: 36.0,
      //               //   underline: SizedBox(),
      //               //   style: TextStyle(
      //               //     color: Colors.red,
      //               //     fontSize: 24.0,
      //               //   ),
      //               //   value: 'Option 1',
      //               //   items: [
      //               //     DropdownMenuItem(
      //               //       value: 'Option 1',
      //               //       child: Text('Option 1'),
      //               //     ),
      //               //     DropdownMenuItem(
      //               //       value: 'Option 2',
      //               //       child: Text('Option 2'),
      //               //     ),
      //               //     DropdownMenuItem(
      //               //       value: 'Option 3',
      //               //       child: Text('Option 3'),
      //               //     ),
      //               //   ],
      //               //   onChanged: (value) {
      //               //     // Do something with the selected value
      //               //   },
      //               // ),
      //               Container(
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(30),
      //                     border: Border.all(
      //                         color: Colors.grey.withOpacity(0.3), width: 2)),
      //                 // color: Colors.red,
      //                 height: 40,
      //                 width: double.infinity,
      //                 child: DropdownButtonHideUnderline(
      //                   child: DropdownButton(
      //                     borderRadius: BorderRadius.circular(30),
      //                     icon: Icon(
      //                       IconaMoon.arrowDown2,
      //                       color: Colors.grey.withOpacity(0.3),
      //                     ),
      //                     // iconSize: 36.0,
      //                     padding: EdgeInsets.only(
      //                       left:
      //                           MediaQuery.of(context).devicePixelRatio * 7.5,
      //                       right:
      //                           MediaQuery.of(context).devicePixelRatio * 3,
      //                     ),
      //                     isExpanded: true,
      //                     value: 'THB',
      //                     items: [
      //                       DropdownMenuItem(
      //                         value: 'THB',
      //                         child: Text('THB - ไทย'),
      //                       ),
      //                       DropdownMenuItem(
      //                         value: 'Option 2',
      //                         child: Text('Option 2'),
      //                       ),
      //                       DropdownMenuItem(
      //                         value: 'Option 3',
      //                         child: Text('Option 3'),
      //                       ),
      //                     ],
      //                     onChanged: (value) {},
      //                     // style: Theme.of(context).textTheme.title,
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 8,
      //               ),
      //               Divider(
      //                 color: Colors.grey.shade300,
      //                 height: 1,
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 8,
      //               ),
      //               Row(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     'รายการ',
      //                     style: TextStyle(
      //                         fontSize: 16, fontWeight: FontWeight.bold),
      //                   ),
      //                   InkWell(
      //                     borderRadius: BorderRadius.circular(30.0),
      //                     onTap: () {
      //                       Navigator.push(
      //                         context,
      //                         PageTransition(
      //                           duration: Durations.extralong1,
      //                           type: PageTransitionType.rightToLeft,
      //                           child: AddListExpense(),
      //                         ),
      //                       );
      //                     },
      //                     child: Container(
      //                       decoration: BoxDecoration(
      //                         color: Color(0xffff99ca),
      //                         borderRadius: BorderRadius.circular(30.0),
      //                       ),
      //                       padding: EdgeInsets.symmetric(
      //                           horizontal:
      //                               MediaQuery.of(context).devicePixelRatio *
      //                                   7,
      //                           vertical:
      //                               MediaQuery.of(context).devicePixelRatio *
      //                                   2.5),
      //                       // shape: Border.all(width: 2),
      //                       // onPressed: () => {},
      //                       // fillColor: ,
      //                       child: Text(
      //                         '+ เพิ่มรายการ',
      //                         style: TextStyle(color: Colors.white),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),

      //               Padding(
      //                 padding: EdgeInsets.only(
      //                     top: MediaQuery.of(context).devicePixelRatio * 1,
      //                     bottom:
      //                         MediaQuery.of(context).devicePixelRatio * 1),
      //                 child: Container(
      //                   height: MediaQuery.of(context).size.height * 0.08,
      //                   alignment: AlignmentDirectional.center,
      //                   width: double.infinity,
      //                   // color: Colors.red,
      //                   child: Text(
      //                     'ยังไม่มีรายการ',
      //                     style: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.grey),
      //                   ),
      //                 ),
      //               ),
      //               Divider(
      //                 color: Colors.grey.shade300,
      //                 height: 1,
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 10,
      //               ),
      //               Text(
      //                 'สรุปรายการ',
      //                 style: TextStyle(
      //                     fontSize: 16, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 4,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'มูลค่ารวม',
      //                     style: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.grey),
      //                   ),
      //                   Text(
      //                     '0 บาท',
      //                     style: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.grey),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 1,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'ภาษีมูลค่าเพิ่มรวม',
      //                     style: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.grey),
      //                   ),
      //                   Text(
      //                     '0 บาท',
      //                     style: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.grey),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 1,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'หัก ณ ที่จ่ายรวม',
      //                     style: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.grey),
      //                   ),
      //                   Text(
      //                     '0 บาท',
      //                     style: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.grey),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 1,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'มูลค่าสุทธิรวม',
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.black),
      //                   ),
      //                   Text(
      //                     '0 บาท',
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.black),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 10,
      //               ),
      //               Divider(
      //                 color: Colors.grey.shade300,
      //                 height: 1,
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 10,
      //               ),
      //               Text(
      //                 'แนบไฟล์เอกสาร',
      //                 style: TextStyle(
      //                     fontSize: 16, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 10,
      //               ),
      //               Container(
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(
      //                       20), // Use BorderRadius.circular for rounded corners
      //                   color: Color.fromRGBO(255, 234, 239, 0.29),
      //                 ),
      //                 // width: MediaQuery.of(context).size.width * 0.9,
      //                 // height: MediaQuery.of(context).size.height * 0.17,
      //                 width: double.infinity,
      //                 height: 208,
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Image.asset(
      //                       "assets/images/img_expense_pick.png",
      //                       fit: BoxFit.fill,
      //                     ),
      //                     Text('อัพโหลดไฟล์ที่นี่'),
      //                     SizedBox(
      //                       height:
      //                           MediaQuery.of(context).devicePixelRatio * 3,
      //                     ),
      //                     ClipOval(
      //                       child: Material(
      //                         color: Color(0xffff99ca), // Button color
      //                         child: InkWell(
      //                           splashColor:
      //                               Color(0xffff99ca), // Splash color
      //                           onTap: () {},
      //                           child: SizedBox(
      //                               width: 56,
      //                               height: 56,
      //                               child: Icon(IconaMoon.share2,
      //                                   color: Colors.white)),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 10,
      //               ),
      //               Divider(
      //                 color: Colors.grey.shade300,
      //                 height: 1,
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 10,
      //               ),
      //               Text(
      //                 'หมายเหตุ (เพิ่มเติม)',
      //                 style: TextStyle(
      //                     fontSize: 16, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).devicePixelRatio * 10,
      //               ),
      //               Container(
      //                 // color: Colors.red,
      //                 // height: 200,
      //                 width: double.infinity,
      //                 child: TextFormField(
      //                   onChanged: (value) {
      //                     setState(() {
      //                       _enteredText = value;
      //                     });
      //                   },

      //                   minLines: 3,
      //                   maxLines: 5,
      //                   // maxLengthEnforcement: MaxLengthEnforcement.enforced,
      //                   maxLength: 500,
      //                   // style: ,
      //                   inputFormatters: [
      //                     LengthLimitingTextInputFormatter(500),
      //                   ],
      //                   decoration: InputDecoration(
      //                     // counterStyle: TextStyle(
      //                     //   height: double,
      //                     // ),
      //                     // counter: Offstage(),

      //                     // counter: SizedBox.shrink(),
      //                     // suffixText:
      //                     //     '${textLength.toString()}/${maxLength.toString()}',
      //                     // counterText: "",
      //                     isDense: true,
      //                     // Display the number of entered characters
      //                     // counter: SizedBox.expand(),
      //                     counterText:
      //                         '${_enteredText.length.toString()} / ${500}',
      //                     // style counter text
      //                     // counterStyle:
      //                     //     TextStyle(fontSize: 22, color: Colors.purple),
      //                     // fillColor: const Color.fromARGB(255, 237, 237, 237)
      //                     //     .withOpacity(0.5),
      //                     // filled: true,
      //                     contentPadding: const EdgeInsets.symmetric(
      //                         horizontal: 16, vertical: 16),
      //                     focusedBorder: OutlineInputBorder(
      //                       borderSide: const BorderSide(
      //                           width: 2.0,
      //                           color: Color.fromARGB(255, 252, 119, 119)),
      //                       borderRadius: BorderRadius.circular(30),
      //                     ),
      //                     enabledBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(30),
      //                       borderSide: BorderSide(
      //                           width: 2.0,
      //                           color: Colors.grey.withOpacity(0.3)),
      //                     ),
      //                   ),
      //                 ),
      //                 //       child: TextField(
      //                 //         maxLength: 250,
      //                 //         buildCounter: (_,
      //                 //                 {required currentLength,
      //                 //                 maxLength,
      //                 //                 required isFocused}) =>
      //                 //             Padding(
      //                 //           padding: const EdgeInsets.only(left: 16.0),
      //                 //           child: Container(
      //                 //               alignment: Alignment.bottomRight,
      //                 //               child: Text("$currentLength/$maxLength")),
      //                 //         ),
      //               ),
      //               const Gap(20),
      //               Divider(
      //                 color: Colors.grey.shade300,
      //                 height: 1,
      //               ),
      //               const Gap(30),
      //               Container(
      //                 width: double.infinity,
      //                 child: OutlinedButton.icon(
      //                   onPressed: () {},
      //                   style: OutlinedButton.styleFrom(
      //                     side: BorderSide(
      //                         width: 2,
      //                         color: Color(0xffff99ca)), // สีขอบสีส้ม
      //                   ),
      //                   icon: Icon(Icons.save_as, color: Color(0xffff99ca)),
      //                   label: Text(
      //                     'บันทึกแบบร่าง',
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.bold,
      //                       color: Color(0xffff99ca), // สีข้อความสีส้ม
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               const Gap(10),
      //               Container(
      //                 width: double.infinity,
      //                 child: ElevatedButton.icon(
      //                   label: Text(
      //                     'ส่งอนุมัติ',
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.white, // สีข้อความขาว
      //                     ),
      //                   ),
      //                   icon: Icon(
      //                     Icons.send,
      //                     color: Colors.white,
      //                   ),
      //                   style: ElevatedButton.styleFrom(
      //                     primary: Color(0xffff99ca), // สีปุ่มสีส้ม
      //                   ),
      //                   onPressed: () {},
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     // Add more Slivers as needed
      //   ],
      // ),
      // ),
    );
  }
}
