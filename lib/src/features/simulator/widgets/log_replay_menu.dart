import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

/// A menu button with attached submenu for options for using a [LogReplay].
class LogReplayMenu extends StatelessWidget {
  /// A menu button with attached submenu for options for using a [LogReplay].
  const LogReplayMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.history,
      text: 'Log replay',
      menuChildren: [
        Consumer(
          child: Text(
            'Choose log',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.folder_open),
            title: child,
            onTap: () async {
              final file = (await FilePicker.platform.pickFiles(
                dialogTitle: 'Choose log file',
                initialDirectory: Device.isNative
                    ? ' ${ref.read(fileDirectoryProvider).requireValue.path}/logs/combined'
                    : null,
              ))
                  ?.files
                  .first;
              if (file != null) {
                final bytes = <int>[];
                if (Device.isNative && file.path != null) {
                  bytes.addAll(await File(file.path!).readAsBytes());
                }
                if (bytes.isNotEmpty) {
                  final replay = LogReplay(log: String.fromCharCodes(bytes));
                  ref.read(simInputProvider.notifier).send(replay);
                  Logger.instance
                      .i('Log replay loaded from file: ${file.path}');
                }
              }
            },
          ),
        ),
        Consumer(
          child: Text(
            'Resume',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.play_arrow),
            title: child,
            onTap: () =>
                ref.read(simInputProvider.notifier).send((replayResume: true)),
          ),
        ),
        Consumer(
          child: Text(
            'Pause',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.pause),
            title: child,
            onTap: () =>
                ref.read(simInputProvider.notifier).send((replayPause: true)),
          ),
        ),
        Consumer(
          child: Text(
            'Cancel',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.clear),
            title: child,
            onTap: () =>
                ref.read(simInputProvider.notifier).send((replayCancel: true)),
          ),
        ),
        Consumer(
          child: Text(
            'Restart',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.refresh),
            title: child,
            onTap: () =>
                ref.read(simInputProvider.notifier).send((replayRestart: true)),
          ),
        ),
      ],
    );
  }
}
