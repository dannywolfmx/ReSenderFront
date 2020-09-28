import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String username;
  final String description;

  User({
    @required this.username,
    @required this.description,
  });

  @override
  List<Object> get props => [username, description];
}
