import 'package:equatable/equatable.dart';
import "package:meta/meta.dart";

import 'id.dart';

class PurcharseOrder extends Equatable {
  final ID id;
  final String invoice;
  final String order;

  PurcharseOrder({
    @required this.id,
    @required this.invoice,
    @required this.order,
  });

  @override
  List<Object> get props => [id, invoice, order];
}
