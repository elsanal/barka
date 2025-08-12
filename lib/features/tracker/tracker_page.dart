import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

// -------------------------
// Orders List Page
// -------------------------
class OrdersListPage extends StatelessWidget {
  const OrdersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final orders = [
      {
        "id": "ORD12345",
        "product": "Wireless Earbuds",
        "thumbnail": "assets/images/img10.jpeg",
        "status": "In Transit (Sea)",
        "date": "2025-08-10",
        "method": "Sea",
      },
      {
        "id": "ORD12346",
        "product": "Laptop",
        "thumbnail": "assets/images/img10.jpeg",
        "status": "Delivered",
        "date": "2025-08-01",
        "method": "Air",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: Image.asset(
                order["thumbnail"]!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(order["product"]!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order ID: ${order["id"]}"),
                  Text("Status: ${order["status"]}"),
                  Text("Date: ${order["date"]}"),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderTrackingPage(
                      orderId: order["id"]!,
                      method: order["method"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// -------------------------
// Order Tracking Page
// -------------------------
class OrderTrackingPage extends StatelessWidget {
  final String orderId;
  final String method;

  const OrderTrackingPage({
    super.key,
    required this.orderId,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    final List<OrderStatus> statuses = _getOrderSteps(method);

    return Scaffold(
      appBar: AppBar(
        title: Text("Order #$orderId"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final status = statuses[index];
          return TimelineTile(
            alignment: TimelineAlign.start,
            isFirst: index == 0,
            isLast: index == statuses.length - 1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: status.completed ? Colors.green : Colors.grey,
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: status.completed
                    ? Icons.check
                    : Icons.radio_button_unchecked,
              ),
            ),
            beforeLineStyle: LineStyle(
              color: status.completed ? Colors.green : Colors.grey,
              thickness: 2,
            ),
            endChild: ListTile(
              title: Text(
                status.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(status.time ?? ""),
            ),
          );
        },
      ),
    );
  }

  // Generate steps based on shipping method
  List<OrderStatus> _getOrderSteps(String method) {
    return [
      OrderStatus(
        title: "Order Received",
        time: "2025-08-01 10:00",
        completed: true,
      ),
      OrderStatus(
        title: "Payment Confirmed",
        time: "2025-08-01 10:05",
        completed: true,
      ),
      OrderStatus(
        title: "Order Placed with Supplier",
        time: "2025-08-02 09:00",
        completed: true,
      ),
      OrderStatus(
        title: "Package Received from Supplier",
        time: "2025-08-03 14:00",
        completed: true,
      ),
      OrderStatus(
        title: "Shipment Prepared",
        time: "2025-08-04 08:00",
        completed: true,
      ),
      OrderStatus(
        title: "In Transit (${method})",
        time: "2025-08-05",
        completed: method == "Air" ? true : false,
      ),
      OrderStatus(
        title: "Arrived at Destination Port/Airport",
        time: null,
        completed: false,
      ),
      OrderStatus(
        title: "At Pickup Point / Out for Delivery",
        time: null,
        completed: false,
      ),
      OrderStatus(title: "Delivered", time: null, completed: false),
    ];
  }
}

// -------------------------
// Order Status Model
// -------------------------
class OrderStatus {
  final String title;
  final String? time;
  final bool completed;

  OrderStatus({required this.title, this.time, this.completed = false});
}
