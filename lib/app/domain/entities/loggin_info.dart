import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myapp/app/domain/entities/user.dart';

class LogginInfo extends Equatable {
  final User user;
  final Token token;
  final bool isLoggedIn;

  LogginInfo({
    this.user,
    this.token,
    this.isLoggedIn = false,
  });

  @override
  List<Object> get props => [user, token, isLoggedIn];
}

class Token extends Equatable {
  final String value;

  Token({@required this.value});

  @override
  List<Object> get props => [value];
}
