
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma7fazty/layout/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class WalletlCubit extends Cubit<WalletStates> {
  WalletlCubit() : super(WalletInitialState());

  static WalletlCubit get(context) => BlocProvider.of(context);

  double totalamount=0;
  bool type=true;
  List<Map> income=[];
  List<Map> outcome=[];
  void selectType(){
    type=!type;
    print(type);
    emit(SelectTypeState());
  }

  void add(double amount){
    totalamount=amount+totalamount;
    print(totalamount);
    emit(AddOperationSucessState());
  }

  void Sub(double amount){
    totalamount=totalamount-amount;
    print(totalamount);
    emit(SubOperationSucessState());
  }

  void Delete(){
    deleteFromDB(database!);
    emit(DeleteSucessState());
  }

  Database? database;
  void createDatabase(){
    openDatabase(
        'wallet.db',
        version: 1,
        onCreate:(database ,version){
          print('DataBase Created');
          database.execute(      'CREATE TABLE Test (id INTEGER PRIMARY KEY, disc TEXT, date TEXT, amount DOUBLE, totalamount DOUBLE, type TEXT)'
          ).then((value) {
            print("table created");
          }).catchError((onError){
            print("error in creat table${onError.toString()}");
          });
        },
        onOpen: (database){
          getDataDromDataBase(database);
          getTotalAmount(database);
          print("database opened");
        }
    ).then((value) {
      database=value;
      emit(AppDataBaseCreatedState());
    });
  }

  Future insertToDataBase({
    required String disc,
    required String date,
    required double amount,
    required double totalamount,
    required String type,
  })async{
    await database!.transaction((txn)async{
      txn.rawInsert('INSERT INTO Test(disc, date, amount, totalamount, type) VALUES("${disc}", "${date}", "${amount}", "${totalamount}",  "${type}")',
      ).then((value) {
        print('$value insret complete');
        emit(AppDataBaseInsertSuccessState());
        getDataDromDataBase(database!);
      }).catchError((error) {
        emit(AppDataBaseInsertErrorState());
      });
    });
  }

  void getDataDromDataBase(Database database){
    emit(GetDataLoadingState());
    income.clear();
    outcome.clear();
    database.rawQuery('SELECT * FROM Test').then((value){
      value.forEach((element) {
        if(element['type']=="in"){
          income.add(element);
        }
        else if(element['type']=="out") {
          outcome.add(element);
        }
      });
      print("income${income.length}");
      print("outcome${outcome.length}");
      emit(GetDataSuccessState());
    }).catchError((error){
      emit(GetDataErrorState());
    });
  }

  void getTotalAmount(Database database){
    emit(GetDataLoadingState());
    database.rawQuery('SELECT * FROM Test ORDER BY ID DESC LIMIT 1').then((value){
      value.forEach((element) {
        totalamount=element['totalamount']as double;
        print(element.toString());
      });
      print("income${income.length}");
      print("outcome${outcome.length}");
      emit(GetDataSuccessState());
    }).catchError((error){
      emit(GetDataErrorState());
    });
  }

  void deleteFromDB(Database database){

    database.rawDelete('DELETE FROM Test ').then((value){
      totalamount=0;
      income.clear();
      outcome.clear();
      emit(DeleteFromDBSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(DeleteFromDBErrorState());
    });
  }
}