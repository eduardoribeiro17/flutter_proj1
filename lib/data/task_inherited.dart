import 'package:flutter/material.dart';
import 'package:proj1/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;
  final List<Task> list = [
    Task(
      'Aprender Flutter',
      'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
      5,
    ),
    Task(
      'Andar de Bike',
      'https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      1,
    ),
    Task(
      'Meditar',
      'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
      4,
    ),
    Task(
      'Ler',
      'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
      2,
    ),
    Task(
      'Jogar',
      'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
      4,
    ),
  ];

  void addNewTask(String name, String pic, int diff) =>
      list.add(Task(name, pic, diff));

  static TaskInherited? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TaskInherited>();

  @override
  bool updateShouldNotify(TaskInherited oldWidget) =>
      oldWidget.list.length != list.length;
}
