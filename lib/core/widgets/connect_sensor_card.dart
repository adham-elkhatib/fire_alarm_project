import 'primary_button.dart';
import 'package:flutter/material.dart';

class ConnectSensorCard extends StatelessWidget {
  final Function onPressed;

  const ConnectSensorCard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sensor Not Connected",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          const  SizedBox(
              height: 4,
            ),
            Text(
              "Zone Safety Status",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16,),
            Card(
              color:Theme.of(context).colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("To start monitoring the safety of your zone, please connect to a sensor.",
                style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:  Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                ),
              ),
            ),
            const SizedBox(height: 16,),

            Align(
              alignment: Alignment.centerLeft,
              child: PrimaryButton(
                onPressed: onPressed,
              title:
                  "Connect a Sensor",
              ),
            )
          ],
        ),
      ),
    );
  }
}
