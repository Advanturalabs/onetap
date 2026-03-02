import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../constants/app_text_style.dart';

class CustomCategoryTabBar extends StatefulWidget {
  final List<String> categories;
  final Function(int) onCategorySelected;
  final int initialIndex;

  const CustomCategoryTabBar({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<CustomCategoryTabBar> createState() => _CustomCategoryTabBarState();
}

class _CustomCategoryTabBarState extends State<CustomCategoryTabBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onCategorySelected(index);
              },
              child: Container(
                width: 30.w,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.lightSecondaryColor
                      : AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.secondaryColor
                        : AppTheme.borderColor,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.categories[index],
                    style: AppTextStyle.font14Weight600TextStyle.copyWith(
                      color: isSelected
                          ? AppTheme.secondaryColor
                          : AppTheme.greyColor,
                    ),
                  ),
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
