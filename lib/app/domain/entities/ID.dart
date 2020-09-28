import 'package:equatable/equatable.dart';

class ID extends Equatable {
  final String value;
  ID(this.value);

  @override
  List<Object> get props => [value];
}
