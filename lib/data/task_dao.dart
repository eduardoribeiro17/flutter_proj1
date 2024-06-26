import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:proj1/components/task.dart';
import 'package:proj1/data/database.dart';

class TaskDao {
  static const String _tableName = 'task';
  static const String _nameColumn = 'name';
  static const String _imageColumn = 'path_image';
  static const String _diffColumn = 'difficulty';

  static const String createTableTaskSql = '''CREATE TABLE $_tableName 
      ($_nameColumn VARCHAR(150),
      $_imageColumn VARCHAR(200),
      $_diffColumn INT)''';

  Future<List<Task>> findAll() async {
    print('-> Call findAll');

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    return toList(result);
  }

  Future<List<Task>> find(String target) async {
    print('-> Call findAll');

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db
        .query(_tableName, where: '$_nameColumn = ?', whereArgs: [target]);

    return toList(result);
  }

  saveOrUpdate(Task newTask) async {
    print('-> Call saveOrUpdate');

    final Database db = await getDatabase();
    Map<String, dynamic> taskMap = toMap(newTask);
    var itemExists = await find(newTask.textTask);

    if (itemExists.isEmpty) {
      return await db.insert(_tableName, taskMap);
    }

    return await db.update(
      _tableName,
      taskMap,
      where: '$_nameColumn = ?',
      whereArgs: [newTask.textTask],
    );
  }

  List<Task> toList(List<Map<String, dynamic>> resultList) {
    print('-> Call toList');

    final List<Task> list = [];
    for (Map<String, dynamic> row in resultList) {
      final Task task = Task(
        row[_nameColumn],
        row[_imageColumn],
        row[_diffColumn],
      );

      list.add(task);
    }

    return list;
  }

  delete(String taskName) async {
    print('-> Call delete');
    final Database db = await getDatabase();

    return await db.delete(
      _tableName,
      where: '$_nameColumn = ?',
      whereArgs: [taskName],
    );
  }

  Map<String, dynamic> toMap(Task task) {
    print('-> Call toMap');

    Map<String, dynamic> taskMap = {};

    taskMap[_nameColumn] = task.textTask;
    taskMap[_imageColumn] = task.photo;
    taskMap[_diffColumn] = task.difficult;

    return taskMap;
  }
}
