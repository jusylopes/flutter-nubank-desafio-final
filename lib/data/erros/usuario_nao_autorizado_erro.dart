import 'package:projeto_final/data/erros/erro.dart';

class UsuarioNaoAutorizado extends Erro {
  UsuarioNaoAutorizado(super.mensagem);
}

abstract class BaseErrorMessenger {
  static Http_401(msg) => "$msg Não Autorizado";
  static Http_400(msg) => "$msg Má requisição";
  static Http_404(msg) => "$msg Usuario não encontrado(a)";
  static Http_409(msg) => "$msg Email ou CPF já cadastrado";
}

abstract class EventsErrorMessenger {
  // static final Http_401 = UsuarioNaoAutorizado('Não Autorizado');

  static Http_404(msg) => "$msg Itém não encontrado";
  static Http_409(msg) => "$msg Email já em uso";
}

abstract class AcreditationErrorMessenger {
  static Http_400(msg) => "$msg Má requisição";
  static Http_404(msg) => "$msg Não encontrado o ID do evento";
}

abstract class AcreditationIdErrorMessenger {
  // static final Http_401 = UsuarioNaoAutorizado('Não Autorizado');
  static Http_400(msg) => "$msg Má requisição";
  static Http_404(msg) =>
      "$msg O usuário não tem eventos credenciados com o ID fornecido";
}

abstract class AdressErrorMessenger {
  static Http_409(msg) => "$msg Email já em uso";
}
