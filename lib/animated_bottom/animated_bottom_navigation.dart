import 'package:flutter/material.dart';
import 'package:flutter_rive_tab/animated_bottom/riv_utils.dart';
import 'package:flutter_rive_tab/animated_bottom/river_asset.dart';
import 'package:rive/rive.dart';

class AnimatedBottomNavigation extends StatefulWidget {
  const AnimatedBottomNavigation({super.key});

  @override
  State<AnimatedBottomNavigation> createState() => _AnimatedBottomNavigationState();
}

class _AnimatedBottomNavigationState extends State<AnimatedBottomNavigation> {

  List<RiveAsset> bottomNavs = [
  RiveAsset("assets/icon/home.riv",
      artboard: "HOME", stateMachineName: "HOME_interactivity",),
  RiveAsset("assets/icon/search.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",),
  RiveAsset("assets/icon/timer.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",),
  RiveAsset("assets/icon/bill.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",),
  RiveAsset("assets/icon/setting.riv",
      artboard: "SETTINGS",
      stateMachineName: "SETTINGS_Interactivity",),
  ];

  RiveAsset? selectBottomNav;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectBottomNav = bottomNavs.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Icon'),
      ),
      body: Container(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(24)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(bottomNavs.length, (index) {
              final item = bottomNavs[index];

              return GestureDetector(
                onTap: () {
                  bottomNavs[index].input!.change(true);

                  if (bottomNavs[index] != selectBottomNav) {
                    setState(() {
                      selectBottomNav = bottomNavs[index];
                    });
                  }

                  Future.delayed(const Duration(seconds: 1), () {
                    bottomNavs[index].input!.change(false);
                  });
                },
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: RiveAnimation.asset(
                    item.icon,
                    artboard: item.artboard,
                    onInit: (artboard) {
                      StateMachineController controller = RiveUtils.getRiveController(
                        artboard,
                        stateMachineName:
                        bottomNavs[index].stateMachineName
                      );

                      item.input = controller.findSMI("active") as SMIBool;
                    }
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
