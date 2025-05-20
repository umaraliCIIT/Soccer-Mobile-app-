import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T)? itemToString;
  final void Function(T?)? onChanged;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final TextStyle? labelStyle;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    this.itemToString,
    this.onChanged,
    this.padding,
    this.borderRadius = 60.0,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutralColor400),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          hint: Text(
            label,
            style: labelStyle ?? const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
          ),
          dropdownColor: AppColors.fillColor, // Background color of opened dropdown
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Metropolis',
            color: AppColors.whiteColor,
            fontWeight: FontWeight.normal,
          ),
          items: items.map((T item) {
            final bool isSelected = item == value;
            return DropdownMenuItem<T>(
              value: item,
              child: Container(
                color: Colors.transparent, // Individual item background
                child: Text(
                  itemToString != null ? itemToString!(item) : item.toString(),
                  style: TextStyle(
                    color: isSelected ? AppColors.primaryColor600 : AppColors.secondaryColor500,
                    fontFamily: 'Metropolis',
                    fontSize: 15,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          selectedItemBuilder: (BuildContext context) {
            return items.map<Widget>((T item) {
              return Container(
                alignment: Alignment.centerLeft, // Centered value
                child: Text(
                  itemToString != null ? itemToString!(item) : item.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Metropolis',
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }).toList();
          },
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
