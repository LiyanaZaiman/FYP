import 'package:flutter/material.dart';
import 'package:online_printing_service/view/widgets/bottom_bar.dart';
import 'package:online_printing_service/view/widgets/menu_drawer.dart';

import '../staff_page/staff_register_page.dart';
import 'register_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          extendBodyBehindAppBar: false,
      appBar: AppBar(
        //Start here
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Online Printing Service',
          style: TextStyle(
            color: Color(0xFF077bd7),
            fontSize: 23.5,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
          ),
        ),
      ),
    drawer: MenuDrawer(),
    body: 
    Column(
    children: [
       Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 40,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      physics: BouncingScrollPhysics(),
                      splashFactory: NoSplash.splashFactory,
                      splashBorderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: const Color(0xFF233142),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(
                          text: 'Admin',
                        ),
                        Tab(
                          text: 'Customer',
                        ),
                      ],
                    ),
                  ),
                ),
                // tab bar view here
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    controller: _tabController,
                    children: const [
                      // first tab bar view widget
                      Center(child: StaffRegisterPage()),
                      // second tab bar view widget
                      Center(child: RegisterPage()),
                    ],
                  ),
                ),
    ]
    ),
	);
  }
}