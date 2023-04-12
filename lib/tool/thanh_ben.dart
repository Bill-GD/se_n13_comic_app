import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class thanhben extends StatefulWidget {
  @override
  thanhben_state createState() => thanhben_state();

}
class thanhben_state extends State<thanhben>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Drawer(
        
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: null, 
        currentAccountPicture: CircleAvatar(/*backgroundImage: NetworkImage()*/),
        
        accountEmail: null,
        decoration: BoxDecoration(color: Color.fromARGB(255, 0, 255, 132)),
        /*Lấy data từ google hay gì đó*/
        ),
ListTile(
  leading: Icon(Icons.person, size: 50,),
  title: Text('Tài khoản'),
  onTap: () {},
),
ListTile(
  leading: Icon(Icons.wallet, size: 50,),
  title: Text('Thanh toán'),
    onTap: () {},
),
ListTile(
  leading: Icon(Icons.report, size: 50,),
  title: Text('Báo lỗi'),
  onTap: () {},
),

      ],
      )),
    );
  }
}