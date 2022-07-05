import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firabase_app/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/presentation/controller/user_controller.dart';
import 'home/repositories/user_repository.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => HomeController(i()),
        ),
        Bind<IUserRepository>(
          (i) => UserRepository(firebaseFirestore: FirebaseFirestore.instance),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
