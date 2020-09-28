import 'package:equatable/equatable.dart';
import "package:meta/meta.dart";

class PurcharseOrder extends Equatable {
  final String id;
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
