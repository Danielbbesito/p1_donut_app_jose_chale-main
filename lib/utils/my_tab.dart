import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String label;
  
  const MyTab({super.key, required this.iconPath,required this.label });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          iconPath,
          color: Colors.grey[600],
          height: 15,
        ),
      ),
      const SizedBox(height: 0,),
      Text(
        label,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 10.5,
          fontWeight: FontWeight.w500,
        ),
      ), 
    ],
  ),
  );
  }
}


class CartBar extends StatelessWidget {
  final int itemCount;
  final double totalAmount;
  final VoidCallback onViewCartPressed;

  const CartBar({
    super.key,
    required this.itemCount,
    required this.totalAmount,
    required this.onViewCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Información del carrito
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$itemCount Items | \$${totalAmount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Delivery Charges Included",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          // Botón "View Cart"
          ElevatedButton(
            onPressed: onViewCartPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "View Cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
     ),
);
}
}