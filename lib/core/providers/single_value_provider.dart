import 'base_provider.dart';

class SingleValueProvider extends BaseProvider {
  dynamic _currentValue;

  get currentValue => _currentValue;

  set currentValue(dynamic newValue) {
    _currentValue = newValue;
    notifyListeners();
  }
}
