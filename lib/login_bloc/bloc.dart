import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';
class Bloc extends Object with validators implements BaseBloc {
  final _emailcontroller = StreamController<String>.broadcast();
  final _passwordcontroller = StreamController<String>.broadcast();
  Function(String) get emailchanged => _emailcontroller.sink.add;
  Function(String) get passwordchanged => _passwordcontroller.sink.add;

  Stream<String> get email => _emailcontroller.stream.transform(emailvalidator);
  Stream<String> get password =>
      _passwordcontroller.stream.transform(passwordvalidator);
    Stream<bool> get submitCheck => CombineLatestStream.combine2(email, password, (e,p)=>true);
  @override
  void dispose() {
    _emailcontroller?.close();
    _passwordcontroller?.close();

  }
}

class Observable {
}

abstract class BaseBloc {
  void dispose();
}
