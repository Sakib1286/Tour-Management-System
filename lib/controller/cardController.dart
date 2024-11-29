import 'package:get/get.dart';

class cardController extends GetxController{

  RxString price= "0".obs ;
  RxInt person =1.obs;
  void addPerson(){

    person.value++;
  }
  void dicPerson(){
    if(person>1){
    person.value--;
    }

  }

}