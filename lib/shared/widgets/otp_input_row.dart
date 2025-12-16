import 'package:flutter/material.dart';
import 'package:loni_africa/shared/widgets/otp_input_field.dart';

class OtpInputRow extends StatefulWidget {
  const OtpInputRow({
    super.key,
    required this.onCompleted,
    required this.onChanged,
  });

  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;

  @override
  State<OtpInputRow> createState() => OtpInputRowState();
}

class OtpInputRowState extends State<OtpInputRow> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        final otp = _controllers.map((c) => c.text).join();
        if (otp.length == 6) {
          widget.onCompleted(otp);
        }
      }
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final currentOtp = _controllers.map((c) => c.text).join();
    widget.onChanged(currentOtp);
  }

  void clear() {
    for (var controller in _controllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        6,
        (index) => OtpInputField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          onChanged: (value) => _onChanged(value, index),
        ),
      ),
    );
  }
}
