import 'package:flutter/material.dart';

class ExpandableQuestionCard extends StatefulWidget {
  final String question;
  final String answer;

  const ExpandableQuestionCard({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<ExpandableQuestionCard> createState() => _ExpandableQuestionCardState();
}

class _ExpandableQuestionCardState extends State<ExpandableQuestionCard> with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _arrowAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
  }

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
      isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpand,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.question,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                RotationTransition(
                  turns: _arrowAnimation,
                  child: const Icon(Icons.keyboard_arrow_right, size: 24),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              widget.answer,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
      ],
    );
  }
}
