import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/navbar_cubit.dart';
import 'custom_bottom_nav_bar_dash.dart';
import 'custom_bottom_nav_bar_dot.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarCubit(),
      child: BlocConsumer<NavbarCubit, NavbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NavbarCubit.get(context);

          return Scaffold(
            bottomNavigationBar: CustomBottomNavBarDot(
              onChange: (index) {
                cubit.changeBottomNavBar(index);
              },
              defaultSelectedIndex: 0,
              backgroundColor: Colors.grey.shade100,
              radius: 25,
              showLabel: false,
              textList: [
                'Home',
                'Camera',
                'Messenger',
                'User',
              ],
              iconList: [
                Icons.home_outlined,
                Icons.camera,
                Icons.mail_outline,
                Icons.person_outline,
              ],
            ),
            appBar: AppBar(
              title: Center(
                child: Text(
                  'News',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            extendBody: true,
            body: Container(
              child: Center(
                child: Text('Hello from Item ${cubit.currentIndex}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
