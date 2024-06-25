import 'package:flutter/material.dart';

class PerfilTile extends StatelessWidget {
  final String title;
  final String value;
  final Widget leading;
  final VoidCallback onTap;

  const PerfilTile({
    super.key,
    required this.title,
    required this.value,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              color: Color.fromARGB(255, 138, 138, 138),
              fontWeight: FontWeight.w600,
              fontFamily: 'QuickSand',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.w600,
              fontFamily: 'QuickSand',
            ),
          ),
          leading
        ],
      ),
    );
  }
}
