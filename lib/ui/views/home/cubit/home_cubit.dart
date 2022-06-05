import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/ui/views/home/cubit/home_states.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.repository) : super(InicialState()) {
    loadUser();
  }

  final SwaggerApiUserRepository repository;
  loadUser() async {
    try {
      emit(LoadingState());
      final user = await repository.getUserDetails();
      emit(SuccessState(user));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
