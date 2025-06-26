import 'package:flutter/material.dart';

import 'custom_text.dart';

class GradientToggleSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String label;

  const GradientToggleSwitch({
    super.key,
    this.initialValue = false,
    required this.onChanged,
    required this.label,
  });

  @override
  State<GradientToggleSwitch> createState() => _GradientToggleSwitchState();
}

class _GradientToggleSwitchState extends State<GradientToggleSwitch> {
  late bool isToggled;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialValue;
  }

  void _toggle() {
    setState(() => isToggled = !isToggled);
    widget.onChanged(isToggled);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 50,
            height: 28,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              gradient: isToggled
                  ? const LinearGradient(
                colors: [Color(0xFFB27F4D), Color(0xFF5C3B1F)],
              )
                  : const LinearGradient(
                colors: [Colors.grey, Colors.grey],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment:
              isToggled ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          CustomText(
           title: widget.label,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0XFF010101)


          )
        ],
      ),
    );
  }
}
