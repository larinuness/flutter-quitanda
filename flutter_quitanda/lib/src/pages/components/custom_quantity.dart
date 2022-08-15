import 'package:flutter/material.dart';

class CustomQuantity extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;
  const CustomQuantity(
      {Key? key,
      required this.value,
      required this.suffixText,
      required this.result,
      this.isRemovable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        //vai crescer só o minimo
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            //só aparece o lixo quando for 1 na tela de carrinho
            icon: !isRemovable || value > 1 ? Icons.remove : Icons.delete,
            color: !isRemovable || value > 1
                ? Colors.grey
                : const Color.fromARGB(255, 183, 55, 46),
            onTap: () {
              if (value == 1 && !isRemovable) return;
              int resultCount = value - 1;

              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            color: Colors.green,
            onTap: () {
              int resultCount = value + 1;

              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _QuantityButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
