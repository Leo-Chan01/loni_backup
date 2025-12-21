import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';

class PromoCodeInput extends StatefulWidget {
  final Function(String) onApply;

  const PromoCodeInput({
    super.key,
    required this.onApply,
  });

  @override
  State<PromoCodeInput> createState() => _PromoCodeInputState();
}

class _PromoCodeInputState extends State<PromoCodeInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isApplied = false;

  void _handleApply() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onApply(_controller.text.trim());
      setState(() {
        _isApplied = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.promoCode,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                enabled: !_isApplied,
                decoration: InputDecoration(
                  hintText: context.l10n.enterCode,
                  filled: true,
                  fillColor: _isApplied
                      ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
                      : colorScheme.surfaceContainerHighest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 2.w,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  suffixIcon: _isApplied
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20.sp,
                        )
                      : null,
                ),
                style: textTheme.bodyLarge,
                textCapitalization: TextCapitalization.characters,
              ),
            ),
            SizedBox(width: 12.w),
            Material(
              color: _isApplied
                  ? colorScheme.surfaceContainerHighest
                  : colorScheme.primary,
              borderRadius: BorderRadius.circular(16.r),
              child: InkWell(
                onTap: _isApplied ? null : _handleApply,
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 28.w,
                    vertical: 16.h,
                  ),
                  child: Text(
                    context.l10n.apply,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _isApplied
                          ? colorScheme.onSurfaceVariant
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
