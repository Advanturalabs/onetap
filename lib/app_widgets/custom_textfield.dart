import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../AppTheme/app_theme.dart';
import '../constants/app_assets.dart';
import '../constants/app_fonts.dart';
import '../constants/app_text_style.dart';

/// Custom Text Field Widget
class CustomTextField extends StatefulWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscure;
  final bool? isChangeErrorFont;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final String? suffixText;
  final String? prefixText;
  final String? fieldName;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? heading;
  final int? maxLines;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? hintTextColor;
  final Color? fieldBorderColor;
  final Color? fillColor;
  final Color? activeFillColor;
  final Color? inactiveFillColor;
  final Color? selectedFillColor;
  final Color? inputTextColor;
  final double? scale;
  final Function()? onTap;
  final Function()? onTapSearchIcon;
  final bool isEditProfileInfoScreen;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? hintTextPadding;
  final double? borderRadius;

  const CustomTextField({
    super.key,
    this.isChangeErrorFont,
    this.hintText,
    this.suffixIcon,
    this.isObscure,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.onChanged,
    this.controller,
    this.inputFormatters,
    this.onTapSearchIcon,
    this.heading,
    this.textAlign,
    this.focusNode,
    this.onFieldSubmitted,
    this.enabled,
    this.maxLines,
    this.prefixIconColor,
    this.scale,
    this.onTap,
    this.fieldName,
    this.hintTextColor,
    this.fillColor,
    this.activeFillColor = const Color(0xFFF9FAFB),
    this.inactiveFillColor = const Color(0xFFF9FAFB),
    this.selectedFillColor = const Color(0xFFF9FAFB),
    this.inputTextColor,
    this.fieldBorderColor,
    this.suffixIconColor,
    this.isEditProfileInfoScreen = false,
    this.hintTextPadding,
    this.borderRadius = 8.0,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? _focusNode;
  bool _hasError = false; // Track error state

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode!.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? 999.0;
    final hasFocus = _focusNode?.hasFocus ?? false;
    final hasText = widget.controller?.text.isNotEmpty ?? false;

    // Calculate fill color
    final fillColor = hasFocus
        ? (widget.activeFillColor ?? widget.selectedFillColor ?? widget.fillColor ?? AppTheme.primaryColor)
        : hasText
        ? (widget.selectedFillColor ?? widget.fillColor ?? AppTheme.primaryColor)
        : (widget.inactiveFillColor ?? widget.fillColor ?? AppTheme.primaryColor);

    // Calculate content padding
    final contentPadding = widget.prefixIcon == null
        ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
        : widget.hintTextPadding != null
        ? EdgeInsets.only(
      left: 16 + widget.hintTextPadding!.resolve(TextDirection.ltr).left,
      right: 16,
      top: 12,
      bottom: 12,
    )
        : const EdgeInsets.symmetric(horizontal: 16, vertical: 12);

    // Normal border (no red error border)
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        width: 1,
        color: widget.fieldBorderColor ?? AppTheme.borderColor,
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        width: 1.8,
        color: hasFocus
            ? AppTheme.secondaryColor
            : (widget.fieldBorderColor ?? AppTheme.borderColor),
      ),
    );

    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppTheme.secondaryColor,
          selectionColor: AppTheme.secondaryColor,
          selectionHandleColor: AppTheme.secondaryColor,
        ),
      ),
      child: TextFormField(
        textAlign: widget.textAlign ?? TextAlign.start,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: _focusNode,
        readOnly: widget.enabled ?? false,
        keyboardType: widget.keyboardType,
        validator: (value) {
          final error = widget.validator?.call(value);
          // Update error state after frame
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _hasError = error != null;
              });
            }
          });
          return error;
        },
        maxLines: widget.maxLines ?? 1,
        onTap: widget.onTap,
        obscureText: widget.isObscure ?? false,
        obscuringCharacter: "*",
        controller: widget.controller,
        cursorColor: AppTheme.secondaryColor,
        cursorErrorColor: AppTheme.secondaryColor,
        cursorWidth: 1.3,
        onChanged: (value) {
          widget.onChanged?.call(value);
          // Re-validate on change to update error icon
          setState(() {});
        },
        inputFormatters: widget.inputFormatters ?? [],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: AppTextStyle.font16Weight400TextStyle.copyWith(
          color: widget.inputTextColor ?? AppTheme.blackColor,
        ),
        decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 48, minWidth: 90),
          fillColor: fillColor,
          filled: true,
          suffixText: widget.suffixText ?? '',
          prefixText: widget.prefixText ?? '',
          prefixStyle: AppTextStyle.font14Weight400TextStyle.copyWith(
            color: AppTheme.blackColor,
          ),
          contentPadding: contentPadding,
          // All borders same — no red border on error
          border: defaultBorder,
          focusedBorder: focusedBorder,
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
          errorBorder: defaultBorder,         // ✅ No red border
          focusedErrorBorder: focusedBorder,  // ✅ No red border
          hintText: widget.hintText ?? '',
          errorStyle: AppTextStyle.font12Weight400TextStyle.copyWith(
            fontSize: widget.isChangeErrorFont == true ? 8 : 12,
            color: AppTheme.redColor,
            fontWeight: FontWeight.bold,
          ),
          errorMaxLines: 3,
          hintStyle: AppTextStyle.font14Weight400TextStyle.copyWith(
            fontFamily: AppFonts.regular,
            color: widget.hintTextColor ?? AppTheme.greyColor,
          ),
          suffixIcon: _hasError
              ? Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              AppAssets.validator_icon,
              width: 16,
              height: 16,
            ),
          )
              : widget.suffixIcon,
          suffixIconColor: widget.suffixIconColor ?? AppTheme.greyColor,
          prefixIcon: widget.prefixIcon == null
              ? null
              : Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: SizedBox(
              width: 20,
              height: 20,
              child: widget.prefixIcon!,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 48,
            minHeight: 48,
          ),
          labelText: widget.fieldName,
          labelStyle: AppTextStyle.font16Weight400TextStyle.copyWith(
            color: hasFocus
                ? AppTheme.secondaryColor
                : (widget.hintTextColor ?? AppTheme.greyColor),
            fontFamily: AppFonts.regular,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../AppTheme/app_theme.dart';
// import '../constants/app_fonts.dart';
// import '../constants/app_text_style.dart';
//
// /// Custom Text Field Widget
// class CustomTextField extends StatefulWidget {
//   final String? hintText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final bool? isObscure;
//   final bool? isChangeErrorFont;
//   final TextEditingController? controller;
//   final TextInputType? keyboardType;
//   final FormFieldValidator<String>? validator;
//   final Function(String)? onChanged;
//   final String? suffixText;
//   final String? prefixText;
//   final String? fieldName;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool? enabled;
//   final String? heading;
//   final int? maxLines;
//   final Color? prefixIconColor;
//   final Color? suffixIconColor;
//   final Color? hintTextColor;
//   final Color? fieldBorderColor;
//   final Color? fillColor;
//   final Color? activeFillColor;
//   final Color? inactiveFillColor;
//   final Color? selectedFillColor;
//   final Color? inputTextColor;
//   final double? scale;
//   final Function()? onTap;
//   final Function()? onTapSearchIcon;
//   final bool isEditProfileInfoScreen;
//   final FocusNode? focusNode;
//   final void Function(String)? onFieldSubmitted;
//   final TextAlign? textAlign;
//   final EdgeInsetsGeometry? hintTextPadding;
//   final double? borderRadius;
//
//   const CustomTextField({
//     super.key,
//     this.isChangeErrorFont,
//     this.hintText,
//     this.suffixIcon,
//     this.isObscure,
//     this.prefixIcon,
//     this.validator,
//     this.keyboardType,
//     this.suffixText,
//     this.prefixText,
//     this.onChanged,
//     this.controller,
//     this.inputFormatters,
//     this.onTapSearchIcon,
//     this.heading,
//     this.textAlign,
//     this.focusNode,
//     this.onFieldSubmitted,
//     this.enabled,
//     this.maxLines,
//     this.prefixIconColor,
//     this.scale,
//     this.onTap,
//     this.fieldName,
//     this.hintTextColor,
//     this.fillColor,
//     this.activeFillColor = const Color(0xFFF9FAFB),
//     this.inactiveFillColor = const Color(0xFFF9FAFB),
//     this.selectedFillColor =const Color(0xFFF9FAFB),
//     this.inputTextColor,
//     this.fieldBorderColor,
//     this.suffixIconColor,
//     this.isEditProfileInfoScreen = false,
//     this.hintTextPadding,
//     this.borderRadius = 8.0,
//   });
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   FocusNode? _focusNode;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focusNode ?? FocusNode();
//     _focusNode!.addListener(() {
//       if (mounted) setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     if (widget.focusNode == null) _focusNode?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final radius = widget.borderRadius ?? 999.0;
//     final hasFocus = _focusNode?.hasFocus ?? false;
//     final hasText = widget.controller?.text.isNotEmpty ?? false;
//
//     // Calculate fill color
//     final fillColor = hasFocus
//         ? (widget.activeFillColor ?? widget.selectedFillColor ?? widget.fillColor ?? AppTheme.primaryColor)
//         : hasText
//         ? (widget.selectedFillColor ?? widget.fillColor ?? AppTheme.primaryColor)
//         : (widget.inactiveFillColor ?? widget.fillColor ?? AppTheme.primaryColor);
//
//     // Calculate content padding
//     final contentPadding = widget.prefixIcon == null
//         ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
//         : widget.hintTextPadding != null
//         ? EdgeInsets.only(
//       left: 16 + widget.hintTextPadding!.resolve(TextDirection.ltr).left,
//       right: 16,
//       top: 12,
//       bottom: 12,
//     )
//         : const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
//
//     return Theme(
//       data: Theme.of(context).copyWith(
//         textSelectionTheme: TextSelectionThemeData(
//           cursorColor: AppTheme.secondaryColor,
//           selectionColor: AppTheme.secondaryColor,
//           selectionHandleColor: AppTheme.secondaryColor,
//         ),
//       ),
//       child: TextFormField(
//         textAlign: widget.textAlign ?? TextAlign.start,
//         onFieldSubmitted: widget.onFieldSubmitted,
//         focusNode: _focusNode,
//         readOnly: widget.enabled ?? false,
//         keyboardType: widget.keyboardType,
//         validator: widget.validator,
//         maxLines: widget.maxLines ?? 1,
//         onTap: widget.onTap,
//         obscureText: widget.isObscure ?? false,
//         obscuringCharacter: "*",
//         controller: widget.controller,
//         cursorColor: AppTheme.secondaryColor,
//         cursorErrorColor: AppTheme.secondaryColor,
//         cursorWidth: 1.3,
//         onChanged: widget.onChanged,
//         inputFormatters: widget.inputFormatters ?? [],
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         style: AppTextStyle.font16Weight400TextStyle.copyWith(
//           color: widget.inputTextColor ?? AppTheme.blackColor,
//         ),
//         decoration: InputDecoration(
//           constraints: const BoxConstraints(minHeight: 48, minWidth: 90),
//           fillColor: fillColor,
//           filled: true,
//           suffixText: widget.suffixText ?? '',
//           prefixText: widget.prefixText ?? '',
//           prefixStyle: AppTextStyle.font14Weight400TextStyle.copyWith(
//             color: AppTheme.blackColor,
//           ),
//           contentPadding: contentPadding,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//             borderSide: BorderSide(
//               width: 1,
//               color: widget.fieldBorderColor ?? AppTheme.borderColor,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//             borderSide: BorderSide(
//               width: 1.8,
//               color: hasFocus
//                   ? AppTheme.secondaryColor
//                   : (widget.fieldBorderColor ?? AppTheme.borderColor),
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//             borderSide: BorderSide(
//               width: 1,
//               color: widget.fieldBorderColor ?? AppTheme.borderColor,
//             ),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//             borderSide: BorderSide(
//               width: 1,
//               color: widget.fieldBorderColor ?? AppTheme.borderColor,
//             ),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//             borderSide: BorderSide(
//               color: AppTheme.redColor,
//               width: 1,
//             ),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//             borderSide: BorderSide(
//               width: 1.3,
//               color: AppTheme.redColor,
//             ),
//           ),
//           hintText: widget.hintText ?? '',
//           errorStyle: AppTextStyle.font12Weight400TextStyle.copyWith(
//             fontSize: widget.isChangeErrorFont == true ? 8 : 12,
//             color: AppTheme.redColor,
//             fontWeight: FontWeight.bold,
//           ),
//           errorMaxLines: 3,
//           hintStyle: AppTextStyle.font14Weight400TextStyle.copyWith(
//             fontFamily: AppFonts.regular,
//             color: widget.hintTextColor ?? AppTheme.greyColor,
//           ),
//           suffixIcon: widget.suffixIcon,
//           suffixIconColor: widget.suffixIconColor ?? AppTheme.greyColor,
//           prefixIcon: widget.prefixIcon == null
//               ? null
//               : Padding(
//             padding: const EdgeInsets.only(left: 16, right: 8),
//             child: SizedBox(
//               width: 20,
//               height: 20,
//               child: widget.prefixIcon!,
//             ),
//           ),
//           prefixIconConstraints: const BoxConstraints(
//             maxHeight: 48,
//             minHeight: 48,
//           ),
//           labelText: widget.fieldName,
//           labelStyle: AppTextStyle.font16Weight400TextStyle.copyWith(
//             color: hasFocus
//                 ? AppTheme.secondaryColor
//                 : (widget.hintTextColor ?? AppTheme.greyColor),
//             fontFamily: AppFonts.regular,
//           ),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//         ),
//       ),
//     );
//   }
// }
