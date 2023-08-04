import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/ab_line_menu.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/look_ahead_menu.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/path_recorder_menu.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/pure_pursuit_menu.dart';
import 'package:flutter/material.dart';

/// A menu with attached submenu for working with the guidance features.
class GuidanceMenu extends StatelessWidget {
  /// A menu with attached submenu for working with the guidance features.
  const GuidanceMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuButtonWithChildren(
      text: 'Guidance',
      icon: Icons.navigation,
      menuChildren: [
        LookAheadMenu(),
        PathRecorderMenu(),
        PurePursuitMenu(),
        ABLineMenu(),
      ],
    );
  }
}
