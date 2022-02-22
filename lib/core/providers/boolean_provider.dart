import 'base_provider.dart';

class BooleanProvider extends BaseProvider {
  bool _currentValue = false;

  get currentValue => _currentValue;

  set currentValue(bool newValue) {
    _currentValue = newValue;
    notifyListeners();
  }
}
