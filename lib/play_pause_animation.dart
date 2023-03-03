import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({super.key});

  @override
  State<PlayPauseAnimation> createState() => _PlayPauseAnimation();
}

class _PlayPauseAnimation extends State<PlayPauseAnimation> {
  late RiveAnimationController _controller;
  get _isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle',);
  }

  void _toggle() => setState(() {
    _controller.isActive = !_controller.isActive;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Play/Pause'),
      ),
      body: Center(
        child: RiveAnimation.asset(
          'assets/rive/vehicles.riv',
          controllers: [_controller],
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
