import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/Models/data/dashboard/coaches_dm.dart';
import 'package:soccer_mobile_app/core/components/custom_dropdown_widget.dart';

// 2. Custom Dropdown Widget for Coaches
class CoachDropdown extends StatefulWidget {
  final List<CoachData> coaches;
  final CoachData? selectedCoach;
  final ValueChanged<CoachData?> onChanged;
  final String label;

  const CoachDropdown({
    Key? key,
    required this.coaches,
    required this.onChanged,
    this.selectedCoach,
    this.label = 'Select Coach',
  }) : super(key: key);

  @override
  _CoachDropdownState createState() => _CoachDropdownState();
}

class _CoachDropdownState extends State<CoachDropdown> {
  @override
  Widget build(BuildContext context) {
    return CustomDropdown<CoachData>(
      label: widget.label,
      value: widget.selectedCoach,
      items: widget.coaches,
      itemToString: (coach) => coach.fullName,
      onChanged: widget.onChanged,
    );
  }
}

class CustomCoachDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T)? itemToString;
  final void Function(T?)? onChanged;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final TextStyle? labelStyle;
  final Color borderColor;

  const CustomCoachDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    this.itemToString,
    this.onChanged,
    this.padding,
    this.borderRadius = 60.0,
    this.labelStyle,
    this.borderColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          hint: Text(
            label,
            style: labelStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ), // Show when no value is selected
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                itemToString != null ? itemToString!(item) : item.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          selectedItemBuilder: (BuildContext context) {
            // This controls what's shown in the button when an item is selected
            return items.map<Widget>((T item) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  value == item ? (itemToString != null ? itemToString!(item) : item.toString()) : '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
