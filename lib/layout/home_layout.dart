import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma7fazty/layout/cubit/cubit.dart';
import 'package:ma7fazty/layout/cubit/states.dart';
import 'package:ma7fazty/module/add_process.dart';
import 'package:ma7fazty/module/income_screen.dart';
import 'package:ma7fazty/module/outcome_screen.dart';
import 'package:ma7fazty/shared/component/component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletlCubit,WalletStates>(
      listener: (context,state){},
      builder: (context,state){
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('محفظتى',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Noto',letterSpacing: 3),),
              centerTitle: true,backgroundColor: Colors.blue[900],elevation: 10.0,shadowColor: Colors.blue,toolbarHeight: 75,
              leading: Container(),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  OutcomeScreen())
                            );
                          },
                          child: CustomButton(color: Colors.red,lable: 'المصروفات السابقة')),
                      InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  IncomeScreen())
                            );
                          },
                          child: CustomButton(color: Colors.green,lable: 'الايرادات السابقة')),

                    ],
                  ),
                ),
                Container(
                    height: 300,width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,),
                        Text('${WalletlCubit.get(context).totalamount}',style: TextStyle(color: Colors.white,fontSize: 60,fontFamily: 'Lalezar',),),
                        Text('LE',style: TextStyle(color: Colors.white,fontSize: 35,fontFamily: 'Lalezar'),),

                      ],
                    ))),
                InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AddProcessScreen())
                      );
                    },
                    child: CustomButton(color: Colors.blue[900],lable: 'عملية جديدة')),
                InkWell(
                    onTap: (){
                      WalletlCubit.get(context).Delete();
                    },
                    child: CustomButton(color: Colors.blue[900],lable: 'حذف ما سبق')),
                SizedBox(height: 30,),

              ],
            ),
          ),
        );
      },
    );
  }
}
