import 'package:flutter/material.dart';
import 'package:proj1/components/appbar.dart';
import 'package:proj1/data/task_inherited.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.taskContext});
  final BuildContext taskContext;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) => value != null && value.isEmpty;
  bool diffValidator(value) {
    if (value != null && value.isEmpty) {
      return true;
    } else {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: const MyAppBar(title: 'Nova tarefa'),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              width: 345,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) => valueValidator(value)
                          ? 'Insira o nome da tarefa'
                          : null,
                      controller: nameController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) => diffValidator(value)
                          ? 'Insira uma dificuldade entre 1 e 5'
                          : null,
                      keyboardType: TextInputType.number,
                      controller: difficultController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => setState(() {}),
                      validator: (String? value) => valueValidator(value)
                          ? 'Insira uma url de imagem'
                          : null,
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (
                          BuildContext context,
                          Object exception,
                          StackTrace? stackTrace,
                        ) =>
                            Image.asset('assets/images/nophoto.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskInherited.of(widget.taskContext)!.addNewTask(
                          nameController.text,
                          imageController.text,
                          int.parse(difficultController.text),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Nova Tarefa Criada!')),
                        );

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
