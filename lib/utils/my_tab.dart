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
          height: 20,
        ),
      ),
      const SizedBox(height: 0,),
      Text(
        label,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 7.3,
          fontWeight: FontWeight.w500,
        ),
      ), 
    ],
  ),
  );
  }
}