import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomButton({
  required var color,
  required var lable,
})=>Container(
  height: 60,width: 180,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15),
  ),
  child: Center(child: Text(lable,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Lalezar',fontWeight: FontWeight.w500))),
);

Widget CustomTextField({
  required var controller,
  required var Icon,
  required var lable,
  var hint,var type,



})=>TextFormField(
  controller: controller,keyboardType: type,
  textAlign: TextAlign.end,
  decoration: InputDecoration(
    hintText:hint ,
    contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:BorderSide(width: 1,color: Colors.blue),
    ),
    prefixIcon: Icon,label: Text(lable,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
  ),
);

Widget item({required List<Map> tasks,required int index,})=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey,
    ),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(tasks[index]["disc"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20,fontFamily: 'Noto'),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('القيمه المدخلة  : ${tasks[index]["amount"]} ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17,fontFamily: 'Noto'),),
                  Text('الاجمالى :${tasks[index]["totalamount"]} ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17,fontFamily: 'Noto'),),
                ],),
            ),
            Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Text('الوقت : ${tasks[index]["date"]} ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),))
          ],
        ),
      ),
    ),
  ),
);

Widget ListItem({required List<Map> tasks})=>Expanded(
  child: ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>item(tasks:tasks,index: index),
      separatorBuilder: (context,index)=>Divider(),
      itemCount: tasks.length),
);


