import 'package:flutter/material.dart';

class CustomOrderStatus extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = {
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 4,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  CustomOrderStatus({Key? key, required this.status, required this.isOverdue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(isActive: true, title: 'Pedido confirmado'),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix estornado',
            color: Colors.orange,
          )
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pagamento vencido',
            color: Colors.red,
          )
        ] else ...[
          _StatusDot(isActive: currentStatus >= 2, title: 'Pagamento'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 3, title: 'Preparando'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 4, title: 'Envio'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus == 5, title: 'Entregue'),
        ],
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? color;

  const _StatusDot(
      {Key? key, required this.isActive, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: isActive ? color ?? Colors.green : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green),
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 13,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
