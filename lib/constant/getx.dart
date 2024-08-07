
// ignore_for_file: camel_case_types

import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class getcon extends GetxController
{
  RxInt nativadload=0.obs;
  RxInt openadload=0.obs;
  RxInt interadload=0.obs;
  RxInt interadpluse=0.obs;
  RxString openadid="".obs;
  RxString nativadid="".obs;
  RxString interadid="".obs;
  RxInt whichad=1.obs;
  RxInt feinter=0.obs;
  RxBool fnatviad=false.obs;
  RxBool finterad=false.obs;
  RxString fnativeid="".obs;
  RxString finterid="".obs;
  RxInt finteradpluse=0.obs;
  RxBool loader=true.obs;
  RxBool opnloader=true.obs;
}
final getcon gcontrolloer=Get.put(getcon());