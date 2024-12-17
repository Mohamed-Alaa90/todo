import 'package:provider/provider.dart';

class ModeProvider extends ChangeNotifierProvider {
  ModeProvider({super.key, required super.create});

  bool _isdark = true;

  bool get isdark => _isdark;

  set isdark(bool value) {
    _isdark = value;
  }

  void changTheme() {

  }
}
