import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma7fazty/layout/cubit/states.dart';
import 'package:ma7fazty/shared/component/component.dart';

import '../layout/cubit/cubit.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletlCubit,WalletStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text('الايرادات السابقة',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27,fontFamily: 'Noto',letterSpacing: 3),),
            centerTitle: true,backgroundColor: Colors.green[900],elevation: 10.0,shadowColor: Colors.blue,toolbarHeight: 75,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(WalletlCubit.get(context).income.isEmpty)
                Center(child: Text('لايوجد عمليات سابقة',style: TextStyle(color: Colors.grey,fontSize: 35),)),
              if(WalletlCubit.get(context).income.isNotEmpty)
                ListItem(tasks: WalletlCubit.get(context).income  ),            ],
          ),
        );
      },
    );
  }
}
