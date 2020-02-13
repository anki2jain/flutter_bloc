import 'dart:async';

mixin validators{

  var emailvalidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains("@")){
        sink.add(email);
      }
      else{
        sink.addError("Not valid email");
      }

    }
  );

    var passwordvalidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length>4){
        sink.add(password);
      }
      else{
        sink.addError("length short for password");
      }

    }
  );
}