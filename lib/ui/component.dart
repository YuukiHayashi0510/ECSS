import 'package:flutter/material.dart';
import 'package:support_company_selection/authentication/login.dart';
import 'package:support_company_selection/authentication/mypage.dart';
import 'package:support_company_selection/ui/topPage.dart';

int _selectedIndex=1;

Widget BottomNavBar() {
  return BottomNavigationBar(
    currentIndex: _selectedIndex,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'MyPage'),
    ],
  );
}