import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleStateMachine extends StatefulWidget {
  const SimpleStateMachine({super.key});

  @override
  State<SimpleStateMachine> createState() => _SimpleStateMachineState();
}

class _SimpleStateMachineState extends State<SimpleStateMachine> {
  SMITrigger? _bump;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'bumpy');
    artboard.addController(controller!);
    _bump = controller.findInput<bool>('bump') as SMITrigger;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('State Machine'),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => _bump,
            child: RiveAnimation.asset(
              'assets/rive/vehicles.riv',
              fit: BoxFit.cover,
              onInit: _onRiveInit,
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Bump the van!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
