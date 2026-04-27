import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  @override
  void onInit() {
    interval(
      count,
      (value) {
        Get.snackbar(
          "Interval Worker",
          "Count sekarang: $value",
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      time: Duration(seconds: 2),
    );
    super.onInit();
  }
  void increment() {
    count++;
  }
}
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GetX interval()"),
        ),
        body: Center(
          child: Obx(() => Text(
                "Count: ${c.count}",
                style: TextStyle(fontSize: 30),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: c.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}