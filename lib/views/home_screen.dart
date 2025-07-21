import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Data/Model/App User/app_user.model.dart';
import '../Data/Model/report.dart';
import '../Data/Model/sensor_data.dart';
import '../Data/Repositories/report.repo.dart';
import '../Data/Repositories/sensor_data.repo.dart';
import '../Data/Repositories/user.repo.dart';
import '../core/Services/Auth/AuthService.dart';
import '../core/Services/FCM Notification/fcm.notification.service.dart';
import '../core/Services/Id Generating/id_generating.service.dart';
import '../core/utils/SnackBar/snackbar.helper.dart';
import '../core/widgets/primary_button.dart';
import 'authentication/presentation/pages/landing.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isConnected = false;
  final ValueNotifier<bool> pushNotifier = ValueNotifier(true);
  SensorData? currentSensorData;
  List<SensorData> sensorData = [];

  String? deviceId;

  @override
  void initState() {
    super.initState();
    _connectToDatabase();
  }

  Future<void> _connectToDatabase() async {
    deviceId="32971015350";
    String? token = FCMNotification.getFcmToken();
    AppUser? user =
    await AppUserRepo().readSingle(AuthService().getCurrentUserId());
    await SensorDataRepo().read(deviceId!).then((newData) async {
      currentSensorData = newData;
      sensorData.add(newData!);
      currentSensorData!.token = token;
      currentSensorData?.homeLocation = user?.homeLocation;
      currentSensorData?.name = user?.name;
      currentSensorData?.address = user?.address;
    });
    await SensorDataRepo().update(deviceId!, currentSensorData);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome back 👋"),
        actions: [
          TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.error),
                  ),
                  onPressed: () async {
                    await AuthService().signOut(context);
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const LandingScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Sign out",
                  ),
                )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StreamBuilder<SensorData?>(
              stream: SensorDataRepo()
                  .onUpdate()
                  .where((data) => data?.id == deviceId),
              builder: (context, snapshot) {
                if (currentSensorData != null) {
                  if (snapshot.data != null) {
                    currentSensorData = snapshot.data;
                    sensorData.add(snapshot.data!);
                  }

                  return Column(
                    children: [
                      _buildStatusWidget(context),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Temperature",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                                Text(
                                  "in Celsius  (°C)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                ),
                                const SizedBox(height: 16),
                                SfCartesianChart(
                                  primaryXAxis: const CategoryAxis(),
                                  primaryYAxis: const NumericAxis(
                                    minimum: 0,
                                    maximum: 80,
                                  ),
                                  series: <CartesianSeries>[
                                    SplineSeries<SensorData, int>(
                                      dataSource: sensorData,
                                      xValueMapper:
                                          (SensorData data, int index) => index,
                                      yValueMapper: (SensorData data, _) =>
                                          data.temperature,
                                      pointColorMapper: (SensorData data, _) =>
                                          _getGradientColor(data.temperature),
                                      width: 4,
                                      markerSettings: const MarkerSettings(
                                        isVisible: false,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Smoke Concentration",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                                Text(
                                  "ppm (parts per million)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                ),
                                const SizedBox(height: 16),
                                SfCartesianChart(
                                  primaryXAxis: const CategoryAxis(),
                                  primaryYAxis: const NumericAxis(
                                    minimum: 0,
                                    maximum: 1200,
                                    // interval: 200,
                                  ),
                                  series: <CartesianSeries>[
                                    SplineSeries<SensorData, int>(
                                      dataSource: sensorData,
                                      xValueMapper:
                                          (SensorData data, int index) => index,
                                      yValueMapper: (SensorData data, _) =>
                                          data.smokeLevel,
                                      pointColorMapper: (SensorData data, _) =>
                                          _getGradientColor(data.smokeLevel),
                                      width: 4,
                                      markerSettings: const MarkerSettings(
                                        isVisible: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatusWidget(context),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Temperature",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                                Text(
                                  "in Celsius  (°C)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                ),
                                const SizedBox(height: 16),
                                SfCartesianChart(
                                  primaryXAxis: const CategoryAxis(),
                                  primaryYAxis: const NumericAxis(
                                    minimum: 0,
                                    maximum: 80,
                                  ),
                                  series: <CartesianSeries>[
                                    SplineSeries<SensorData, int>(
                                      dataSource: sensorData,
                                      xValueMapper:
                                          (SensorData data, int index) => index,
                                      yValueMapper: (SensorData data, _) =>
                                          data.temperature,
                                      pointColorMapper: (SensorData data, _) =>
                                          _getGradientColor(data.temperature),
                                      width: 4,
                                      markerSettings: const MarkerSettings(
                                        isVisible: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Smoke Concentration",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                                Text(
                                  "ppm (parts per million)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                ),
                                const SizedBox(height: 16),
                                SfCartesianChart(
                                  primaryXAxis: const CategoryAxis(),
                                  primaryYAxis: const NumericAxis(
                                    minimum: 0,
                                    maximum: 1200,
                                  ),
                                  series: <CartesianSeries>[
                                    SplineSeries<SensorData, int>(
                                      dataSource: sensorData,
                                      xValueMapper:
                                          (SensorData data, int index) => index,
                                      yValueMapper: (SensorData data, _) =>
                                          data.smokeLevel,
                                      pointColorMapper: (SensorData data, _) =>
                                          _getGradientColor(data.smokeLevel),
                                      width: 4,
                                      markerSettings: const MarkerSettings(
                                        isVisible: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatusWidget(BuildContext context) {
    if (currentSensorData == null) {
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
                      "Sensor Not Connected",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      "Zone Safety Status",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline),
                    )
                  ],
                ),
                const CircleAvatar(
                  // backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 24,
                  child: Icon(
                    Icons.sensors_off_outlined,
                    size: 24,
                    // color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
                child: Text(
                  "To start monitoring the safety of your zone, please connect to a sensor.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    /// safe zone
    if (currentSensorData!.smokeLevel <
            currentSensorData!.smokeLevelThreshold &&
        currentSensorData!.smokeLevel <
            currentSensorData!.smokeLevelThreshold - 100) {
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
                      "Zone Secured",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: const Color(0xff317F45),
                              ),
                    ),
                    Text(
                      "Zone Safety Status",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline),
                    )
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: Color(0x4D317F45),
                  radius: 24,
                  child: Icon(
                    Icons.gpp_good_outlined,
                    size: 24,
                    color: Color(0xff317F45),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    /// safety check advised
    if (currentSensorData!.smokeLevel >=
            (currentSensorData!.smokeLevelThreshold - 100) &&
        currentSensorData!.smokeLevel <
            (currentSensorData!.smokeLevelThreshold)) {
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
                      "Safety Check Advised",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: const Color(0xffF7942A),
                              ),
                    ),
                    Text(
                      "Zone Safety Status",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline),
                    )
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: Color(0x4DF7942A),
                  radius: 24,
                  child: Icon(
                    Icons.report_outlined,
                    size: 24,
                    color: Color(0xFFF7942A),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color(0x4DF7942A),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14,
                  ),
                  child: Text(
                    "High smoke and temperate levels detected.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xff854705),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    /// Critical Danger: Fire
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
                    "Critical Danger: Fire",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: const Color(0xffB81F1E),
                        ),
                  ),
                  Text(
                    "Zone Safety Status",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline),
                  )
                ],
              ),
              const CircleAvatar(
                backgroundColor: Color(0x4DB81F1E),
                radius: 24,
                child: Icon(
                  Icons.local_fire_department_outlined,
                  size: 24,
                  color: Color(0xFFB81F1E),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: const Color(0x4DB81F1E),
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
                child: Text(
                  "Fire detected.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xff270001),
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getGradientColor(double level) {
    if (level < 200) {
      return Colors.green;
    } else if (level < 500) {
      return Color.lerp(Colors.green, Colors.orange, (level - 200) / 300)!;
    } else {
      return Color.lerp(Colors.orange, Colors.red, (level - 500) / 500)!;
    }
  }
}
