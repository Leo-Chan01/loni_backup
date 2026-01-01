import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortDropdown extends StatefulWidget {
  final String initialValue;
  final Function(String) onChanged;

  const SortDropdown({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<SortDropdown> createState() => _SortDropdownState();
}

class _SortDropdownState extends State<SortDropdown> {
  late String _selectedSort;

  final List<({String value, String label})> _sortOptions = [
    (value: 'popular', label: 'Most Popular'),
    (value: 'new', label: 'Newest'),
    (value: 'price_asc', label: 'Price: Low to High'),
    (value: 'price_desc', label: 'Price: High to Low'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DropdownButton<String>(
      value: _selectedSort,
      isDense: true,
      underline: const SizedBox(),
      dropdownColor: colorScheme.surface,
      style: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 14.sp,
      ),
      items: _sortOptions.map((option) {
        return DropdownMenuItem<String>(
          value: option.value,
          child: Text(option.label),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedSort = value;
          });
          widget.onChanged(value);
        }
      },
    );
  }
}
