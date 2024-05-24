import 'package:flutter_application_1/controller/homecontroller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeController homeControl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print('Calling build method');
    return Scaffold(
      backgroundColor: const Color(0xFF7AA9FA),
      body: GetBuilder<HomeController>(builder: (a) {
        return Center(
          child: Text(
            '${homeControl.counterValue}',
            style: const TextStyle(fontSize: 33),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          homeControl.addValue();
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
