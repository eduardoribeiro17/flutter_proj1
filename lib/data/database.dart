import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/';
import 'package:path/path.dart';
import 'package:proj1/data/task_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');

  return openDatabase(
    path,
    onCreate: (db, version) => db.execute(TaskDao.createTableTaskSql),
    version: 1,
  );
}
