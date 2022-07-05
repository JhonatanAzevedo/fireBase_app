import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../model/user_model.dart';
import '../controller/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.getListUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app fireBase'),
      ),
      body: Observer(
        builder: (_) {
          if (controller.userList!.hasError) {
            return Center(
              child: ElevatedButton(
                onPressed: controller.getListUser,
                child: const Text('Error'),
              ),
            );
          }
          if (controller.userList!.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<UserModel> list = controller.userList!.data;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: ((context, index) {
              UserModel model = list[index];
              return ListTile(
                trailing: IconButton(
                  onPressed: () => model.delete(),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  _showDiaolog(model);
                },
                title: Row(
                  children: [
                    Text(model.nome!),
                    const SizedBox(width: 10),
                    Text(model.idade!),
                  ],
                ),
              );
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDiaolog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showDiaolog([UserModel? model]) {
    model ??= UserModel();
    controller.nome = '';
    controller.idade = '';

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title:
              Text(model!.nome == null ? 'Adicionar novo usuario' : 'Edicao'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 100,
            child: Observer(
              builder: (_) {
                return Column(
                  children: [
                    TextFormField(
                      initialValue: model!.nome,
                      onChanged: (value) {
                        model!.nome = value;
                        controller.setNome(value);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: model.idade,
                      onChanged: (value) {
                        model!.idade = value;
                        controller.setIdade(value);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Idade',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => Modular.to.pop(),
                          child: const Text('cancelar'),
                        ),
                        controller.nome != '' && controller.idade != ''
                            ? ElevatedButton(
                                onPressed: () async {
                                  await model!.save();
                                  Modular.to.pop();
                                },
                                child: const Text('salvar'),
                              )
                            : const ElevatedButton(
                                onPressed: null,
                                child: Text('salvar'),
                              )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}



