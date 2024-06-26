import 'package:flutter/material.dart';
import 'package:proj1/components/appbar.dart';
import 'package:proj1/components/task.dart';
import 'package:proj1/data/loading.dart';
import 'package:proj1/data/task_dao.dart';
import 'package:proj1/pages/form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Tasks',
        hasAction: true,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => setState(() {}),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 75),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Loading();
              case ConnectionState.waiting:
                return const Loading();
              case ConnectionState.active:
                return const Loading();
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Erro: ${snapshot.error}');

                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task task = items[index];
                        return task;
                      },
                    );
                  }

                  return const Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text('No Tasks!', style: TextStyle(fontSize: 32))
                      ],
                    ),
                  );
                }

                return const Text('Tasks load error!');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (newContext) => FormPage(taskContext: context),
          ),
        ).then((value) => setState(() {})),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ListView(
//         padding: const ,
//         children: TaskInherited.of(context)!.list,
//       )