import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final VoidCallback onShop;
  final VoidCallback onChat;
  final VoidCallback onCartList;
  final VoidCallback onAddToCart;
  final VoidCallback onProceedPayment;

  const CustomBottomBar({
    super.key,
    required this.onShop,
    required this.onChat,
    required this.onCartList,
    required this.onAddToCart,
    required this.onProceedPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _bottomIconButton(Icons.storefront, "Shop", onShop),
          _bottomIconButton(Icons.chat, "Chat", onChat),
          _bottomIconButton(Icons.shopping_cart, "Cart", onCartList),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _coloredButton("Add", onAddToCart, Colors.orange),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _coloredButton("Pay", onProceedPayment, Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomIconButton(
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.black87),
            SizedBox(height: 2), // reduce space here
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
    ;
  }

  Widget _coloredButton(String label, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}
