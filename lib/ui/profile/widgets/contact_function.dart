import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:provider/provider.dart';

class ContactFunction {
  void showUpdateButton(context, boolProvider) {
    boolProvider.currentValue = !boolProvider.currentValue;

    final singleProvider =
        Provider.of<SingleValueProvider>(context, listen: false);

    if (boolProvider.currentValue) {
      if (singleProvider.currentValue != null) {
        singleProvider.currentValue = (singleProvider.currentValue + 1);
      } else {
        singleProvider.currentValue = 1;
      }
    } else {
      singleProvider.currentValue = (singleProvider.currentValue - 1);
    }
  }
}
