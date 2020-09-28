import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myapp/app/domain/entities/purcharse_order.dart';

class Client extends Equatable {
  final String id;
  final String name;
  final List<PurcharseOrder> purcharseOrders;

  Client({
    this.id,
    @required this.name,
    this.purcharseOrders,
  });

  @override
  List<Object> get props => [id, name, purcharseOrders];
}
