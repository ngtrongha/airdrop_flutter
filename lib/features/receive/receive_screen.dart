import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../transfer/presentation/transfer_controller.dart';

@RoutePage()
class ReceiveScreen extends ConsumerWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(transferServerControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1F38),
      appBar: AppBar(
        title: Text('Receive Mode', style: GoogleFonts.outfit()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.download_for_offline,
              size: 100,
              color: Color(0xFF00BFA6),
            ),
            const SizedBox(height: 30),
            Text(
              'Airdrop Active',
              style: GoogleFonts.outfit(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Your device is receiving in background',
              style: GoogleFonts.inter(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 40),
            progressAsync.when(
              data: (progress) {
                if (progress <= 0 || progress >= 1.0) {
                  return const Text(
                    'No active transfers',
                    style: TextStyle(color: Colors.white38),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 12,
                          backgroundColor: Colors.white10,
                          valueColor: const AlwaysStoppedAnimation(
                            Color(0xFF00BFA6),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${(progress * 100).toStringAsFixed(1)}%',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (err, st) => Text(
                'Error: $err',
                style: const TextStyle(color: Colors.red),
              ),
              loading: () => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
