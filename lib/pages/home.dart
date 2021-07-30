import 'package:ep_fv2/widgets/nav_drawer_start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: NavDrawerStart(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/visits/create/"),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Row(
        children: [
          Expanded(child: Text("asasas")),
          VerticalDivider(width: 0),
          Expanded(child: Text("zxzxzxzx")),
        ],
      ),
    );
  }
}
