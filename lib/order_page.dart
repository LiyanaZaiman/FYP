import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:online_printing_service/data/models/get_product_size.dart';
import 'package:online_printing_service/view/payment.dart';
import 'package:online_printing_service/view/widgets/bottom_bar.dart';
//import 'package:online_printing_service/view/order_details.dart';
import 'package:online_printing_service/view/widgets/menu_drawer.dart';
import 'package:online_printing_service/view/customer_details.dart';
import '../../controllers/order_controller.dart';
import '../../di/service_locator.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/main_controller.dart';
import '../controllers/view_controller.dart';
import '../data/models/get_product_name.dart';
import '../data/models/get_product_sided.dart';
import '../networking/api/user_api.dart';
import 'widgets/form_error.dart';
//import 'package:online_printing_service/'

//enum ColourMode { blackwhite, colour }

const List<String> paperOrientation = <String>['Potrait', 'Horizontal'];
const List<String> staplersrsOrNot = <String>['No-staplers', 'With-staplers'];
const List<String> sortedOrNot = <String>['Sorted', 'Unsorted'];

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);
  @override
  State<OrderPage> createState() => _OrderPageState();
}

final view = getIt<ViewController>();
final userApi = getIt.get<UserApi>();

class _OrderPageState extends State<OrderPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  String? _character;

  //String? size;
  GetProductSize? paperSize;
  List<GetProductSize> productSize = [];

  //String? sided;
  GetProductSide? paperSided;
  List<GetProductSide>? productSided = [];

  GetProductName? service;
  List<GetProductName> productName = [];

  String? productId;
  String? price;
  double totalAmount = 0;

  FilePickerResult? result;
  File? fileUp;
  double? totalDisplay;

  final orderController = getIt<OrderController>();
  final mainController = getIt<MainController>();

  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'GlobalFormKey #price ');

  final List<String?> errors = [];

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    // orderController.printingServiceController = "NormalPaper";
    _character = "blackwhite";
    price = "0.10";
    view.getProductName().then((value) {
      setState(() {
        productName = value;
        service = value[1];
      });
    });
    view.getProductSize().then((value) {
      setState(() {
        productSize = value;
        paperSize = value[0];
      });
    });
    view.getProductSide().then((value) {
      setState(() {
        productSided = value;
        paperSided = value[0];
      });
    });
    super.initState();
  }

  double _calculatePrice() {
    double prices = double.parse(price!);
    int set = int.parse(orderController.setController.text);
    if (set == null) {
      set = 0;
    }
    print(totalAmount);
    setState(() {
      totalAmount = prices * set;
    });

    return totalAmount;
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //int selectedValue = 0; // declare a variable to hold the selected value
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: screenSize.width < 1000
            ? AppBar(
                //Start here
                iconTheme: IconThemeData(color: Colors.blue),
                elevation: 0,
                backgroundColor: Colors.white.withOpacity(_opacity),
                title: Text(
                  'Online Printing Service',
                  style: TextStyle(
                    color: Color(0xFF077bd7),
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
              )
            : PreferredSize(
                //To make the screen responsive. From Web sie to Moble App size
                preferredSize: Size(screenSize.width, 70),
                child: SizedBox(),
                //TopBarContents(_opacity),
              ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              //OrderDetails(key: _orderDetailsKey),
              Card(
                color: Colors.white70,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 700,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Order Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //File Upload
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    result =
                                        await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      File file =
                                          File(result!.files.single.path!);
                                      setState(() {
                                        fileUp = file;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.5),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    //textStyle: TextStyle()
                                  ),
                                  child: Text("Choose File"))),
                          if (result != null)
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.4)),
                                ),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: result?.files.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return Text(
                                          result?.files[index].name ?? '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal));
                                    }),
                              ),
                            ),
                          if (result == null)
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.4)),
                                ),
                                child: Text(
                                  'No file chosen',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Form(
                        key: formKey,
                        child: Column(children: [
                          //Type of service
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('Type of Service'),
                              ),
                              //Dropdown list
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                      DropdownButtonFormField<GetProductName>(
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return "*Required.";
                                    //   }
                                    //   return null;
                                    // },
                                    value: service,
                                    isExpanded: true,
                                    onChanged: (GetProductName? newValue) {
                                      setState(() {
                                        service = newValue;
                                        orderController
                                                .printingServiceController =
                                            json
                                                .encode(service!.name)
                                                .replaceAll("\"", "");

                                        print("Service type here " +
                                            json
                                                .encode(service!.name)
                                                .replaceAll("\"", ""));
                                        print("Services" + service!.name);
                                        icon:
                                        const Icon(Icons.arrow_downward);
                                        underline:
                                        Container(
                                          height: 2, //color: Colors.blueGrey
                                        );
                                      });
                                      orderController
                                          .passIDPrice(
                                              context,
                                              orderController
                                                  .printingServiceController,
                                              paperSize!.size,
                                              _character.toString(),
                                              paperSided!.sided)
                                          .then((value) {
                                        setState(() {
                                          price = value['price'];
                                          productId = value['productId'];
                                        });
                                        print("Price >>> " + price!);
                                        print("Product ID >>> " + productId!);
                                      });
                                    },
                                    items: productName
                                        .map<DropdownMenuItem<GetProductName>>(
                                            (GetProductName value) {
                                      return DropdownMenuItem<GetProductName>(
                                        value: value,
                                        child: Text(value.name),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Paper Size
                          Row(
                            children: [
                              Padding(
                                //alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                child: Text('Paper Size:'),
                              ),
                              //Dropdown list
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                      DropdownButtonFormField<GetProductSize>(
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return "*Required.";
                                    //   }
                                    //   return null;
                                    // },

                                    value: paperSize,
                                    isExpanded: true,
                                    onChanged: (GetProductSize? newValue) {
                                      print("Size here " + newValue!.size);
                                      //This is called when the user selects an item.
                                      setState(() {
                                        paperSize = newValue;

                                        icon:
                                        const Icon(Icons.arrow_downward);
                                        underline:
                                        Container(
                                            height: 2, color: Colors.blueGrey);
                                      });
                                      orderController
                                          .passIDPrice(
                                              context,
                                              orderController
                                                  .printingServiceController,
                                              paperSize!.size,
                                              _character.toString(),
                                              paperSided!.sided)
                                          .then((value) {
                                        setState(() {
                                          price = value['price'];
                                          productId = value['productId'];
                                        });
                                        print("Price >>> " + price!);
                                        if (formKey.currentState!.validate()) {
                                          _calculatePrice();
                                        }
                                      });
                                    },
                                    items: productSize
                                        .map<DropdownMenuItem<GetProductSize>>(
                                            (GetProductSize value) {
                                      return DropdownMenuItem<GetProductSize>(
                                        value: value,
                                        child: Text(value.size),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Radio Button Colour MOde
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  value: "blackwhite",
                                  title: Text('Black & White'),
                                  groupValue: _character,
                                  onChanged: (value) {
                                    setState(() {
                                      _character = value;
                                    });
                                    print("Value here : " + value!.toString());
                                    orderController
                                        .passIDPrice(
                                            context,
                                            orderController
                                                .printingServiceController,
                                            paperSize!.size,
                                            _character.toString(),
                                            paperSided!.sided)
                                        .then((value) {
                                      setState(() {
                                        price = value['price'];
                                        productId = value['productId'];
                                      });
                                      print("Price >>> " + price!);
            
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  value: "colour",
                                  title: Text('Colour'),
                                  groupValue: _character,
                                  onChanged: (value) {
                                    setState(() {
                                      _character = value;
                                    });
                                    print("Value here : " + value!.toString());
                                    orderController
                                        .passIDPrice(
                                            context,
                                            orderController
                                                .printingServiceController,
                                            paperSize!.size,
                                            _character!,
                                            paperSided!.sided)
                                        .then((value) {
                                      setState(() {
                                        price = value['price'];
                                        productId = value['productId'];
                                      });
                                      print("Price >>> " + price!);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          //Print One Sided
                          Row(
                            children: [
                              Padding(
                                  //alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  child: Text('Print One Sided')),
                              //Dropdown List
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                      DropdownButtonFormField<GetProductSide>(
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return "*Required.";
                                    //   }
                                    //   return null;
                                    // },
                                    value: paperSided,
                                    isExpanded: true,
                                    onChanged: (GetProductSide? newValue) {
                                      print("Type of side here " +
                                          newValue!.toString());
                                      //This is called when the user selects an item.
                                      setState(() {
                                        paperSided = newValue;
                                        //sided  = paperSided.toString();
                                        icon:
                                        const Icon(Icons.arrow_downward);
                                        underline:
                                        Container(
                                            height: 2, color: Colors.blueGrey);
                                      });
                                      orderController
                                          .passIDPrice(
                                              context,
                                              orderController
                                                  .printingServiceController,
                                              paperSize!.size,
                                              _character.toString(),
                                              paperSided!.sided)
                                          .then((value) {
                                        setState(() {
                                          price = value['price'];
                                          productId = value['productId'];
                                        });
                                        print("Price >>> " + price!);
                                        if (formKey.currentState!.validate()) {
                                          _calculatePrice();
                                        }
                                      });
                                    },
                                    items: productSided!
                                        .map<DropdownMenuItem<GetProductSide>>(
                                            (GetProductSide value) {
                                      return DropdownMenuItem<GetProductSide>(
                                          value: value,
                                          child: Text(value.sided));
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Potrait Orientation
                          Row(
                            children: [
                              Padding(
                                //alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                child: Text('Paper Orientation'),
                              ),
                              //Dropdown list
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton<String>(
                                    value:
                                        orderController.orientationController,
                                    isExpanded: true,
                                    onChanged: (String? value) {
                                      //This is called when the user selects an item.
                                      setState(() {
                                        orderController.orientationController =
                                            value!;
                                        icon:
                                        const Icon(Icons.arrow_downward);
                                        underline:
                                        Container(
                                            height: 2, color: Colors.blueGrey);
                                      });
                                    },
                                    items: paperOrientation
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //No staplers
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('Staplers'),
                                // child: TextField(
                                //   //controller: paperSize,
                                // decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                // labelText: 'Staplers',
                                // prefixIcon: Icon(Icons.pages),
                                //   ),
                                // ),
                              ),
                              //Dropdown list
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton<String>(
                                    value: orderController.staplersController,
                                    isExpanded: true,
                                    onChanged: (String? value) {
                                      //This is called when the user selects an item.
                                      setState(() {
                                        orderController.staplersController =
                                            value!;
                                        icon:
                                        const Icon(Icons.arrow_downward);
                                        underline:
                                        Container(
                                            height: 2, color: Colors.blueGrey);
                                      });
                                    },
                                    items: staplersrsOrNot
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Sorted
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('Sorted'),
                                // child: TextField(
                                //   //controller: paperSize,
                                // decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                // labelText: 'Sorted',
                                // prefixIcon: Icon(Icons.pages),
                                //   ),
                                // ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton<String>(
                                    value: orderController.sortedController,
                                    isExpanded: true,
                                    onChanged: (String? value) {
                                      //This is called when the user selects an item.
                                      setState(() {
                                        orderController.sortedController =
                                            value!;
                                        icon:
                                        const Icon(Icons.arrow_downward);
                                        underline:
                                        Container(
                                            height: 2, color: Colors.blueGrey);
                                      });
                                    },
                                    items: sortedOrNot
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Number of Set
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required.";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                if (formKey.currentState!.validate()) {
                                  _calculatePrice();
                                } else {
                                  totalAmount = 0;
                                  _calculatePrice();
                                }
                              },
                              controller: orderController.setController,
                              decoration: InputDecoration(
                                labelText: 'Number of Set',
                                prefixIcon: Icon(Icons.book),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          //Pages per sheet
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required.";
                                }
                                return null;
                              },
                              controller: orderController.sheetController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Pages per sheet',
                                prefixIcon: Icon(Icons.pages),
                              ),
                            ),
                          ),
                          //Collection Date
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required.";
                                }
                                return null;
                              },
                              controller: orderController.collectDateController,
                              decoration: InputDecoration(
                                labelText: 'Collection Date',
                                icon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime.now(), //get today's date
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(pickedDate);
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(formattedDate);
                                  setState(() {
                                    orderController.collectDateController.text =
                                        formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ),
                          ),
                          //Notes
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: orderController.notesController,
                              decoration: InputDecoration(
                                labelText: 'Notes (optional)',
                                prefixIcon: Icon(Icons.note),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          FormError(
                            errors: errors,
                          ),
                        ]),
                      ),
                      //Price
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 56,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.money),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Price : RM " + double.parse(price!.toString()).toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              //Customer Details Form
              CustomerDetails(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Total Amount : RM" +
                          double.parse(totalAmount.toString())
                              .toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //Order Button
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: Text('Order Now'),
                      onPressed: () {
                        if (fileUp != null) {
                          orderController.order(productId!, fileUp!, context, totalAmount);
                        } else {
                          print("No file");
                        }
                        ;
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentPage()));
                        } else {
                          mainController.showFieldAlert(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              BottomBar(),
            ],
          ),
        ));
  }
}


// child: DropdownButtonFormField<String>(
                                  //   validator: (value) {
                                  //     if (value == null || value.isEmpty) {
                                  //       return "*Required.";
                                  //     }
                                  //     return null;
                                  //   },
                                  //   value: "NormalPaper",
                                  //   isExpanded: true,
                                  //   onChanged: (String? service) {
                                  //     print("Service here " + service!);
                                  //     //This is called when the user selects an item.
                                  //     setState(() {
                                  //       orderController
                                  //               .printingServiceController =
                                  //           service;
                                  //       icon:
                                  //       const Icon(Icons.arrow_downward);
                                  //       underline:
                                  //       Container(
                                  //         height: 2, //color: Colors.blueGrey
                                  //       );
                                  //     });
                                  //     orderController
                                  //         .passIDPrice(
                                  //             context,
                                  //             orderController
                                  //                 .printingServiceController,
                                  //             paperSize!,
                                  //             _character.toString(),
                                  //             paperSided!)
                                  //         .then((value) {
                                  //       setState(() {
                                  //         price = value;
                                  //       });
                                  //       print("Price >>> " + price!);
                                  //     });
                                  //   },
                                  //   items: service
                                  //       .map<DropdownMenuItem<String>>(
                                  //           (String service) {
                                  //     return DropdownMenuItem(
                                  //         value: service, child: Text(service));
                                  //   }).toList(),
                                  // ),