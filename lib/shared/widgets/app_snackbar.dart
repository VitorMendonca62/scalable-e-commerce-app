import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/core/theme/colors.dart';
import 'package:scalable_e_commerce_app/core/theme/typography.dart';

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
                  style: AppTypography.titleSmall.copyWith(
                    color: widget.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.message,
                  style: AppTypography.bodyMedium.copyWith(
                    color: widget.colorScheme.onSurface,
                  ),
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
  static final Queue<_SnackbarRequest> _queue = Queue<_SnackbarRequest>();
  static bool _isShowing = false;

  static void success(BuildContext context, String title, String message) {
    _enqueue(
      context: context,
      title: title,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.outline,
    );
  }

  static void error(BuildContext context, String title, String message) {
    _enqueue(
      context: context,
      title: title,
      message: message,
      backgroundColor: AppColors.destructiveForeground,
    );
  }

  static void warning(BuildContext context, String title, String message) {
    _enqueue(
      context: context,
      title: title,
      message: message,
      backgroundColor: AppColors.chart4,
    );
  }

  static void _enqueue({
    required BuildContext context,
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    final overlay = Overlay.of(context);

    _queue.add(
      _SnackbarRequest(
        overlay: overlay,
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        colorScheme: Theme.of(context).colorScheme,
        top: MediaQuery.of(context).padding.top + 50,
      ),
    );

    _showNext();
  }

  static void _showNext() {
    if (_isShowing || _queue.isEmpty) return;

    _isShowing = true;
    final request = _queue.removeFirst();

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: request.top,
        left: 16,
        right: 16,
        child: _AnimatedSnackbar(
          title: request.title,
          message: request.message,
          colorScheme: request.colorScheme,
          backgroundColor: request.backgroundColor,
          onDismiss: () {
            if (entry.mounted) {
              entry.remove();
            }

            _isShowing = false;
            _showNext();
          },
        ),
      ),
    );

    request.overlay.insert(entry);
  }
}

class _SnackbarRequest {
  final OverlayState overlay;
  final String title;
  final String message;
  final Color backgroundColor;
  final ColorScheme colorScheme;
  final double top;

  const _SnackbarRequest({
    required this.overlay,
    required this.title,
    required this.message,
    required this.backgroundColor,
    required this.colorScheme,
    required this.top,
  });
}
