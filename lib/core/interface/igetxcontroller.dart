import 'package:get/get.dart';

abstract class IGetxController {
  Future<void> fetchItems();
  RxBool get isLoading;
  RxList<dynamic> get items;
}
