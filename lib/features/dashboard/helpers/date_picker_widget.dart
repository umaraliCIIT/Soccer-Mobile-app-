import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';

class DateRangePickerRow extends StatefulWidget {
  final Function(DateTime?, DateTime?) onDateRangeSelected;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final String? startLabel;
  final String? endLabel;

  const DateRangePickerRow({
    Key? key,
    required this.onDateRangeSelected,
    this.initialStartDate,
    this.initialEndDate,
    this.startLabel = 'Start Date',
    this.endLabel = 'End Date',
  }) : super(key: key);

  @override
  _DateRangePickerRowState createState() => _DateRangePickerRowState();
}

class _DateRangePickerRowState extends State<DateRangePickerRow> {
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStartDate;
    _endDate = widget.initialEndDate;
    _startDateController = TextEditingController(
      text: _startDate != null ? DateFormat('MMM dd, yyyy').format(_startDate!) : null,
    );
    _endDateController = TextEditingController(
      text: _endDate != null ? DateFormat('MMM dd, yyyy').format(_endDate!) : null,
    );
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate ?? DateTime.now() : _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          _startDateController.text = DateFormat('MMM dd, yyyy').format(picked);
          // If end date is before start date, reset end date
          if (_endDate != null && _endDate!.isBefore(picked)) {
            _endDate = null;
            _endDateController.clear();
          }
        } else {
          _endDate = picked;
          _endDateController.text = DateFormat('MMM dd, yyyy').format(picked);
        }
        widget.onDateRangeSelected(_startDate, _endDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WidgetTextField(
            controller: _startDateController,
            mLabelText: widget.startLabel,
            readOnly: true,
            mOnTap: () => _selectDate(context, true),
            suffix: const Icon(
              Icons.calendar_today,
              size: 16,
              color: AppColors.neutralColor500,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: WidgetTextField(
            controller: _endDateController,
            mLabelText: widget.endLabel,
            readOnly: true,
            mOnTap: () => _selectDate(context, false),
            suffix: const Icon(
              Icons.calendar_today,
              size: 16,
              color: AppColors.neutralColor500,
            ),
          ),
        ),
      ],
    );
  }
}
