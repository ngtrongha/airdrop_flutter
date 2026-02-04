import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/router/app_router.dart';
import '../transfer/presentation/transfer_controller.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showConfirmationDialog(
    BuildContext context,
    WidgetRef ref,
    PendingTransfer request,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2D3250),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Incoming File',
          style: GoogleFonts.outfit(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${request.senderIp}',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              'File: ${request.fileName}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Size: ${(request.fileSize / 1024 / 1024).toStringAsFixed(2)} MB',
              style: const TextStyle(color: Colors.white60),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref
                  .read(transferServerControllerProvider.notifier)
                  .rejectTransfer();
            },
            child: const Text(
              'Reject',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00BFA6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              ref
                  .read(transferServerControllerProvider.notifier)
                  .acceptTransfer();
            },
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Declarative Initialization: Riverpod handles the auto-start logic
    ref.watch(airdropInitializationProvider);

    // Listen for incoming transfer requests (handshake)
    ref.listen(transferServerControllerProvider.notifier, (previous, next) {
      if (next.pendingRequest != null) {
        _showConfirmationDialog(context, ref, next.pendingRequest!);
      }
    });

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 700;
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A1F38),
                  Color(0xFF2D3250),
                  Color(0xFF424769),
                ],
              ),
            ),
            child: Row(
              children: [
                if (isDesktop) _buildNavigationRail(context),
                Expanded(
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildHeroTitle(),
                          const SizedBox(height: 60),
                          if (!isDesktop) _buildActionButtons(context),
                          if (isDesktop) _buildDesktopStatus(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavigationRail(BuildContext context) {
    return NavigationRail(
      backgroundColor: Colors.white.withValues(alpha: 0.05),
      selectedIndex: 0,
      onDestinationSelected: (idx) {
        if (idx == 1) context.router.push(const SendRoute());
        if (idx == 2) context.router.push(const ReceiveRoute());
      },
      labelType: NavigationRailLabelType.all,
      unselectedLabelTextStyle: const TextStyle(color: Colors.white54),
      selectedLabelTextStyle: const TextStyle(color: Color(0xFF6C63FF)),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_rounded),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.send_rounded),
          label: Text('Send'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.download_rounded),
          label: Text('Receive'),
        ),
      ],
    );
  }

  Widget _buildDesktopStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Color(0xFF00BFA6), size: 16),
          SizedBox(width: 8),
          Text(
            'System Ready & Receiving',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroTitle() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(
            'assets/images/logo.png',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Airdrop Documents',
          style: GoogleFonts.outfit(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Share files at warp speed',
          style: GoogleFonts.inter(
            fontSize: 18,
            color: Colors.white70,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _GlassButton(
          icon: Icons.send_rounded,
          label: 'Send',
          color: const Color(0xFF6C63FF),
          onTap: () => context.router.push(const SendRoute()),
        ),
        const SizedBox(width: 30),
        _GlassButton(
          icon: Icons.download_rounded,
          label: 'Receive',
          color: const Color(0xFF00BFA6),
          onTap: () => context.router.push(const ReceiveRoute()),
        ),
      ],
    );
  }
}

class _GlassButton extends ConsumerStatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _GlassButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  ConsumerState<_GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends ConsumerState<_GlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.3),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon, size: 32, color: widget.color),
              ),
              const SizedBox(height: 16),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
