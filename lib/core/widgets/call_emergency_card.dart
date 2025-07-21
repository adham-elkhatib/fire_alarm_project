import 'package:flutter/material.dart';

class CallEmergencyServicesCard extends StatelessWidget {
  const CallEmergencyServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Immediate action required!",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
            ),
            Text(
              "Methane concentration has reached 2500 PPM, exceeding the critical safety threshold",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                child: const Text(
                  "Call Emergency Services",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
