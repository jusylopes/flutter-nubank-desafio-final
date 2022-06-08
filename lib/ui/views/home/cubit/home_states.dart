import 'package:equatable/equatable.dart';
import 'package:projeto_final/data/entity/user/get/get_user_details.dart';

abstract class HomePageState extends Equatable {}

class InicialState extends HomePageState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomePageState {
  @override
  List<Object> get props => [];
}

class SuccessState extends HomePageState {
  SuccessState(this.user);
  final GetUserDetails user;

  @override
  List<Object> get props => [user];
}

class ErrorState extends HomePageState {
  @override
  List<Object> get props => [];
}
