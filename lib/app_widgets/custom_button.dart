import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../AppTheme/app_theme.dart';
import '../constants/app_fonts.dart';


class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.Text, this.width, this.height, this.textSize, this.maxlines, this.iconHeight,this.onTap, this.buttonColor, this.buttonName, this.textColor, this.fontFamily, this.decoration,this.borderColor,this.isAuth,this.isGoogle,this.isOnBoarding,this.onBoardingText,this.iconPath,this.iconColor, this.prefixIcon, this.prefixIconWidth,});
  final String Text;
  final String? iconPath;
  final Color? iconColor;
  final String? fontFamily;
  final String? buttonName;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? iconHeight;
  final double? textSize;
  final int? maxlines;
  final Function()? onTap;
  final Color? buttonColor;
  final Color? borderColor;
  final Decoration? decoration;
  final bool? isAuth;
  final bool? isGoogle;
  final bool? isOnBoarding;
  final Widget? onBoardingText;
  final String? prefixIcon;
  final double? prefixIconWidth;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child:
      Container(
        height: widget.height??48,
        width: widget.width,
        decoration: widget.decoration??BoxDecoration(
            color: widget.buttonColor??AppTheme.secondaryColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1.3,color: widget.borderColor??AppTheme.secondaryColor)
        ),
        child: Center(
          child:widget.isAuth==null?Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // NEW: Show prefix icon if provided
                if (widget.prefixIcon != null) ...[
                  Image.asset(
                    widget.prefixIcon!,
                    width: widget.prefixIconWidth ?? 20,
                  ),
                  const SizedBox(width: 8), // Spacing between icon and text
                ],

                Text(
                  maxLines: widget.maxlines,
                  widget.Text,
                  style:  TextStyle(
                      color: widget.textColor??AppTheme.primaryColor,
                      fontFamily: "regular",
                      fontSize: widget.textSize??16,
                      fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ):widget.isOnBoarding==true?widget.onBoardingText: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // widget.isGoogle==null? Image.asset(
              //   widget.iconPath?? AppAssets.facebookIcon,
              //   height:widget.iconHeight?? 18,
              //   // color:  widget.iconPath==null?null:widget.iconColor??AppTheme.greenColor,
              // ):Image.asset(
              //   widget.iconPath??AppAssets.googleIcon,
              //   height:widget.iconHeight?? 18,
              //   // color:  widget.iconPath==null?null:widget.iconColor??AppTheme.primaryColor,
              //
              // ),
              Text(
                maxLines: widget.maxlines,
                widget.Text,
                style:  TextStyle(
                    color: widget.textColor??AppTheme.primaryColor,
                    fontSize: widget.textSize??16,
                    fontFamily: widget.fontFamily??AppFonts.medium,
                    fontWeight: FontWeight.w500
                ),
              ).paddingOnly(left: 5)
            ],),
        ),

      ),

    );
  }
}