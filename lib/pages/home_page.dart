import 'package:flutter/material.dart';
import 'package:proj1/components/appbar.dart';
import 'package:proj1/data/task_inherited.dart';
import 'package:proj1/pages/form_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Tasks'),
      body: ListView(children: TaskInherited.of(context)!.list),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (newContext) => FormPage(taskContext: context),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
