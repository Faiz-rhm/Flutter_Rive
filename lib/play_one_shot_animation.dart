import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayOneShotAnimation extends StatefulWidget {
  const PlayOneShotAnimation({super.key});

  @override
  State<PlayOneShotAnimation> createState() => _PlayOneShotAnimationState();
}

class _PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  late RiveAnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStart: () => setState(() {_isPlaying = true;}),
      onStop: () => setState(() {_isPlaying = false;}),
    );
  }

  void _toggle() => setState(() {
    _controller.isActive = !_controller.isActive;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Play One Shot'),
      ),
      body: Center(
        child: RiveAnimation.asset(
          'assets/rive/vehicles.riv',
          controllers: [_controller],
          // animations: const ['idle', 'curves'],
          fit: BoxFit.cover,
          onInit: (_) => setState(() {}),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,),
      ),
    );
  }
}
