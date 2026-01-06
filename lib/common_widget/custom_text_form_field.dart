import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixImagePath,
    this.validator,
    this.onChanged,
    this.isLoading = false,
    this.focusNode,
  });

  final TextEditingController controller;
  final String labelText;
  final String prefixImagePath;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool isLoading;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: false,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      cursorColor: const Color(0xFF4ADE16),

      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(prefixImagePath, width: 20, color: Colors.white),
        ),
        suffixIcon: isLoading
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 1),
                ),
              )
            : null,
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
