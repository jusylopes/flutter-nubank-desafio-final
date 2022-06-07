import 'package:projeto_final/data/erros/erro.dart';

class UsuarioNaoAutorizado extends Erro {
  UsuarioNaoAutorizado(super.mensagem);
}

abstract class BaseErrorMessenger {
  static final Http_401 = "Não Autorizado";
   static  Http_400(msg) => "$msg Má requisição";
   static  Http_404(msg) => "$msg Usuario não encontrado(a)";
   static  Http_409(msg) => "$msg Email ou CPF já existe";

}
