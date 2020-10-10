import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';

class User extends Equatable {
  final String username;
  final List<PurcharseOrder> purcharseOrders;

  User({
    @required this.username,
    this.purcharseOrders = const <PurcharseOrder>[],
  });

  @override
  List<Object> get props => [username, purcharseOrders];
}
