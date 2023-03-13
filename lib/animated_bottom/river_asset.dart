import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, icon;
  late SMIBool? input;

  RiveAsset(this.icon,
      {required this.artboard,
      required this.stateMachineName,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}
