import 'package:loni_africa/features/library/data/services/library_api_service.dart';
import 'package:loni_africa/features/library/domain/models/order.dart';

class LibraryController {
  LibraryController(this._service);

  final LibraryApiService _service;

  Future<List<Order>> getUserBooks() async {
    return _service.getOrders(fulfillmentType: 'DIGITAL');
  }

  Future<List<Order>> getAllOrders() async {
    return _service.getOrders();
  }

  Future<Order> getOrderDetail(String orderId) async {
    return _service.getOrderDetail(orderId);
  }
}
