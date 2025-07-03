import 'package:flutter/material.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';

import '../widget/CustomFaq_widget.dart'; // Make sure ExpandableQuestionCard is inside this

class FaqView extends StatelessWidget {
  FaqView({super.key});

  final List<Map<String, String>> faqList = [
    {
      "question": "Q. How do I get my store listed?",
      "answer": "Ans: All practitioners are verified by our team. You can cancel or reschedule through the app."
    },
    {
      "question": "Q. What information is required for store registration?",
      "answer": "Ans: You'll need a business license, valid ID, and store address proof."
    },
    {
      "question": "Q. What information is required for store registration?",
      "answer": "Ans: Yes, you can update your details anytime from the dashboard settings."
    },
    {
      "question": "Q. What information is required for store registration?",
      "answer": "Ans: All practitioners are verified by our team. You can cancel or reschedule through the app."
    },
    {
      "question": "Q. What information is required for store registration?",
      "answer": "Ans: You'll need a business license, valid ID, and store address proof."
    },
    {
      "question": "Q. What information is required for store registration?",
      "answer": "Ans: Yes, you can update your details anytime from the dashboard settings."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        text: 'FAQ',
        onBackTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: faqList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final faq = faqList[index];
                  return ExpandableQuestionCard(
                    question: faq['question']!,
                    answer: faq['answer']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
