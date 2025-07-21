import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? card;
  final Widget? actionButton;
  final IconData icon;

  const StatusCard(
      {super.key,
      required this.title,
      this.subtitle,
      this.actionButton,
      required this.icon,
      this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text(
                    subtitle ?? "",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline),
                  )
                ],
              ),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 24,
                child: Icon(
                  icon,
                  size: 24,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          if (card != null)
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                card!,
              ],
            ),
          if (actionButton != null)
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                actionButton!,
              ],
            ),
        ],
      ),
    );
  }
}
