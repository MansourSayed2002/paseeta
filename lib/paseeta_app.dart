import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:paseeta/online.dart';
import 'package:paseeta/presentation/view/screen/offline/offline_view.dart';

class PaseetaApp extends StatelessWidget {
  const PaseetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        List<ConnectivityResult> connectivity,
        Widget child,
      ) {
        final bool connected = !connectivity.contains(ConnectivityResult.none);
        if (connected) {
          return const OnlineView();
        } else {
          return const OfflineView();
        }
      },
      child: const CircularProgressIndicator(),
    );
  }
}
