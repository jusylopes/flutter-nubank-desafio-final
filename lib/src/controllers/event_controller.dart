import 'package:projeto_final/data/entity/eventos/get/get_events.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';

class EventController {
  List<GetEvent> events = [];
  final userRepository = SwaggerApiUserRepository();

  Future start() async {
    events = await userRepository.getAllEvents();
  }
}
