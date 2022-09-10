import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_module.dart';
import 'home/presentation/controller/user_controller.dart';
import 'home/repositories/user_repository.dart';
import 'services/firebase_mensagem_service.dart';
import 'services/services_notifications.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => HomeController(
            i<IUserRepository>(),
          ),
        ),
        Bind<IUserRepository>(
          (i) => UserRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        Bind<NotificationService>(
          (i) => NotificationService(),
        ),
        Bind<FirebaseMessagingService>(
          (i) => FirebaseMessagingService(
            i<NotificationService>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
