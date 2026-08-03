import 'package:flutter/material.dart';

void showLanguageDialog(BuildContext context) {
  final languages = [
    'Arabic',
    'English',
    'French',
    'German',
    'Hindi',
    'Portuguese',
    'Russian',
    'Spanish',
    'Swahili',
    'Urdu',
  ];

  final selectedLanguage = 'English'; // just for UI highlight

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'Select Language',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ),
              const Divider(height: 1),
              // Language list
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    final isSelected = language == selectedLanguage;

                    return InkWell(
                      onTap: () {
                        Navigator.pop(context, language);
                      },
                      child: Container(
                        width: double.infinity,
                        color: isSelected
                            ? const Color(0xFF1565C0)
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Text(
                          language,
                          style: TextStyle(
                            fontSize: 15,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF1565C0),
                            fontWeight: isSelected
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
