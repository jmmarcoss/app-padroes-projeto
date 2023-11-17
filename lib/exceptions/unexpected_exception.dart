import 'package:app_padroes/exceptions/api_exception.dart';

class UnexpectedException extends ApiException {
  UnexpectedException() : super('Um erro inesperado ocorreu, tente novamente!');
}
