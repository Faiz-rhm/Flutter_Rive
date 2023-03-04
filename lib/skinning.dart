import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Skinning extends StatefulWidget {
  const Skinning({super.key});

  @override
  State<Skinning> createState() => _SkinningState();
}

class _SkinningState extends State<Skinning> {
  static const _scanMapping = {
    'Skin_0': 'Plain',
    'Skin_1': 'Summer',
    'Skin_2': 'Elvis',
    'Skin_3': 'SuperHero',
    'Skin_4': 'Astronauts',
  };
  String _currentState = 'Plain';
  SMITrigger? _skin;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'Motion',
      onStateChange: _stateChange
    );

    artboard.addController(controller!);
    _skin = controller.findInput<bool>('Skin') as SMITrigger;
  }

  void _stateChange(String stateMachine, String stateName) {
    if(stateName.contains('Skin_')) {
      setState(() {
        _currentState = _scanMapping[stateName] ?? 'Plain';
      });
    }
  }

  void _swapSkin() {
    _skin!.fire();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/rive/skins_demo.riv',
            fit: BoxFit.cover,
            onInit: _onRiveInit,
          ),
          Column(
            children: [
              const SizedBox(height: 24,),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text('Choose an Avatar', style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )),
              ),
              FilledButton(
                onPressed: _swapSkin,
                child: const Text('Swap Skin')),
              const SizedBox(height: 16,),
              Text(_currentState, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ))
            ],
          )
        ],
      ),
    );
  }
}
