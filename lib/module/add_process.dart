import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma7fazty/layout/cubit/cubit.dart';
import 'package:ma7fazty/layout/cubit/states.dart';
import 'package:ma7fazty/layout/home_layout.dart';
import 'package:ma7fazty/shared/component/component.dart';

class AddProcessScreen extends StatelessWidget {
   AddProcessScreen({Key? key}) : super(key: key);
  var amountController=TextEditingController();
  var discController=TextEditingController();
  var date=DateTime.now();
   @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletlCubit,WalletStates>(
      listener: (context,state){},
      builder: (context,state){
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('عملية جديدة',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Noto',letterSpacing: 3),),
            centerTitle: true,backgroundColor: Colors.blue[900],elevation: 10.0,shadowColor: Colors.blue,toolbarHeight: 75,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            WalletlCubit.get(context).selectType();
                          },
                          child: CustomButton(color:WalletlCubit.get(context).type==true?Colors.green:Colors.grey,lable: 'ايداع')),
                      InkWell(
                          onTap: (){
                            WalletlCubit.get(context).selectType();
                          },
                          child: CustomButton(color:WalletlCubit.get(context).type==true?Colors.grey:Colors.red,lable: 'صرف')),

                    ],
                  ),
                  SizedBox(height: 50,),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: CustomTextField(
                    controller: amountController,
                    lable: 'المبلـغ',
                    Icon: Icon(Icons.monetization_on),
                    //hint: 'أدخل المبلغ',
                    type:TextInputType.number,

                    ),
                  ),
                  SizedBox(height: 50,),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: CustomTextField(
                        controller: discController,
                        lable: 'الوصف',
                        Icon: Icon(Icons.edit),
                        //hint: 'أدخل الوصف',
                        type:TextInputType.text,
                    ),
                  ),
                  SizedBox(height: 70,),
                  if(WalletlCubit.get(context).type==true)
                    InkWell(
                      onTap: (){
                        WalletlCubit.get(context).add(double.parse(amountController.text));
                        WalletlCubit.get(context).insertToDataBase(disc: discController.text, date:date.toString() , amount: double.parse(amountController.text), totalamount:WalletlCubit.get(context).totalamount , type: 'in');
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  HomeScreen())
                        );
                      },
                      child: CustomButton(
                      lable: 'اضـافـه',
                      color: Colors.blue[900]
                  ),
                    ),
                  if(WalletlCubit.get(context).type==false)
                    InkWell(
                      onTap: (){
                        WalletlCubit.get(context).Sub(double.parse(amountController.text));
                        WalletlCubit.get(context).insertToDataBase(disc: discController.text, date:date.toString() , amount: double.parse(amountController.text), totalamount:WalletlCubit.get(context).totalamount , type: 'out');
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  HomeScreen())
                        );
                        },
                      child: CustomButton(
                          lable: 'خــصــم',
                          color: Colors.blue[900]
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
      },
    );
  }
}
