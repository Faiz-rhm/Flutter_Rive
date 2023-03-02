import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LightSwitch extends StatefulWidget {
  const LightSwitch({super.key});

  @override
  State<LightSwitch> createState() => _LightSwitchState();
}

class _LightSwitchState extends State<LightSwitch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Light Switch'),
      ),
      body: const Center(
        child: RiveAnimation.asset(
          'assets/rive/light_switch.riv',
          fit: BoxFit.contain,
          stateMachines: ['Switch'],
        )
      ),
    );
  }
}
