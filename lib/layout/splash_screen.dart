import 'package:flutter/material.dart';
import 'package:ma7fazty/layout/home_layout.dart';

class WalletSplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 4),
          ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())
      ),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.PNG"),
            ],
          ),
        ],
      ),
    );
  }
}