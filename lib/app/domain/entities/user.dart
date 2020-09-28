import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String username;

  User({
    @required this.username,
  });

  @override
  List<Object> get props => [username];
}
