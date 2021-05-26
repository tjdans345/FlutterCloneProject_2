import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loading_page.dart';
import 'login_page.dart';
import 'tab_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('root_page created');
    return _handleCurrentScreen();
  }

  Widget _handleCurrentScreen() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          //연결 상태가 기다리는 중이라면 로딩 페이지를 반환
          if (snapShot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            if (snapShot.hasData) {
              return TabPage(snapShot.data);
            }
            return LoginPage();
          }
        });
  }
}
