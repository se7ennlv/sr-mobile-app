import 'package:flutter/material.dart';
import 'package:flutter_sr/common/utils/present_time.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/core/services/utils_service.dart';
import 'package:provider/provider.dart';

class YearItemWidget extends StatefulWidget {
  @override
  _YearItemWidgetState createState() => _YearItemWidgetState();
}

class _YearItemWidgetState extends State<YearItemWidget> {
  int selectedYear;
  List yearList = [];

  void getAllYear() async {
    var years = await UtilsService.getAllFiscalYears();

    setState(() {
      yearList = years;
    });
  }

  void setYearInitial() {
    final provider = Provider.of<SingleValueProvider>(context, listen: false);
    provider.currentValue = PresentService.year;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getAllYear();
      setYearInitial();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SingleValueProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
          child: _buildYearList(provider),
        ),
      ],
    );
  }

  Widget _buildYearList(provider) {
    return DropdownButton(
      hint: Text('Select Year'),
      value: selectedYear,
      items: yearList.map((year) {
        return DropdownMenuItem(
          child: Center(
            child: Text('${year['yearCode']}'),
          ),
          value: year['yearCode'],
        );
      }).toList(),
      onChanged: (value) {
        provider.currentValue = value;
        selectedYear = provider.currentValue;
      },
    );
  }
}
