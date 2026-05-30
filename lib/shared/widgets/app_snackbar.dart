import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/core/theme/colors.dart';

class _AnimatedSnackbar extends StatefulWidget {
  final String title;
  final String message;
  final Color backgroundColor;
  final ColorScheme colorScheme;
  final VoidCallback onDismiss;

  const _AnimatedSnackbar({
    required this.title,
    required this.message,
    required this.backgroundColor,
    required this.colorScheme,
    required this.onDismiss,
  });

  @override
  State<_AnimatedSnackbar> createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<_AnimatedSnackbar> {
  bool visible = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (mounted) {
        setState(() => visible = true);
      }
    });

    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;

      setState(() => visible = false);

      await Future.delayed(const Duration(milliseconds: 300));

      widget.onDismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      offset: visible ? Offset.zero : const Offset(0, -0.3),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        opacity: visible ? 1 : 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.message,
                  style: TextStyle(color: widget.colorScheme.onSurface),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppSnackbar {
  static void success(BuildContext context, String title, String message) {
    _show(context, title, message, Theme.of(context).colorScheme.outline);
  }

  static void error(BuildContext context, String title, String message) {
    _show(context, title, message, AppColors.destructiveForeground);
  }

  static void warning(BuildContext context, String title, String message) {
    _show(context, title, message, AppColors.chart4);
  }

  static void _show(
    BuildContext context,
    String title,
    String message,
    Color backgroundColor,
  ) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;
    final colorScheme = Theme.of(context).colorScheme;

    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        child: _AnimatedSnackbar(
          title: title,
          message: message,
          colorScheme: colorScheme,
          backgroundColor: backgroundColor,
          onDismiss: () => entry.remove(),
        ),
      ),
    );

    overlay.insert(entry);
  }
}
