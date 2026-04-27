import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    interval(count, (value) {
      final now = DateTime.now();
      final batas = DateTime(now.year, now.month, now.day, 15, 30);

      if (now.isBefore(batas)) {
        Get.snackbar(
          'Interval Worker',
          'Count: $value | Waktu: ${now.hour}:${now.minute}:${now.second}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }, time: const Duration(seconds: 1));
  }

  void increment() {
    count++;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Workers - interval()")),
      body: Center(
        child: Obx(() {
          return Text(
            'Count: ${counterController.count}',
            style: TextStyle(fontSize: 30),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}