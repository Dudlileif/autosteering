import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu with attached submenu for debugging the equipment feature.
class EquipmentMenu extends StatelessWidget {
  /// A menu with attached submenu for debugging the equipment feature.
  const EquipmentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Equipment',
      icon: Icons.handyman,
      menuChildren: [
        const _LoadEquipmentSetupMenu(),
        const _LoadEquipmentMenu(),
        MenuItemButton(
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.settings),
          ),
          child: const Text('Configure'),
          onPressed: () => showDialog<void>(
            context: context,
            builder: (context) => const EquipmentConfigurator(),
          ),
        ),
        const _SaveEquipmentSetup(),
        const _AttachEquipmentMenu(),
        const _AttachEquipmentSetupMenu(),
        const _DetachMenu(),
        Consumer(
          child: Text(
            'Show',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(showEquipmentDebugProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showEquipmentDebugProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Clear unused',
            style: textStyle,
          ),
          builder: (context, ref, child) => MenuItemButton(
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            onPressed: ref.read(allEquipmentsProvider.notifier).clear,
            child: child,
          ),
        ),
      ],
    );
  }
}

class _SaveEquipmentSetup extends StatelessWidget {
  const _SaveEquipmentSetup();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      child: const Text('Save setup'),
      builder: (context, ref, child) {
        if (ref.watch(
          mainVehicleProvider.select((value) => value.numAttachedChildren > 1),
        )) {
          return MenuItemButton(
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.save),
            ),
            child: child,
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) {
                var name = '';
                return StatefulBuilder(
                  builder: (context, setState) {
                    return SimpleDialog(
                      title: const Text('Name the setup'),
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.label_outline),
                            labelText: 'Name',
                          ),
                          initialValue: name,
                          onChanged: (value) => setState(() => name = value),
                          onFieldSubmitted: (value) =>
                              setState(() => name = value),
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value != null &&
                                  value.isNotEmpty &&
                                  !value.startsWith(' ')
                              ? null
                              : '''No name entered! Please enter a name so that the setup can be saved!''',
                        ),
                        Consumer(
                          child: child,
                          builder: (context, ref, child) => FilledButton(
                            onPressed: () {
                              ref.read(
                                saveEquipmentSetupProvider(
                                  ref.read(
                                    mainVehicleProvider.select(
                                      (value) => value.equipmentSetup(name),
                                    ),
                                  ),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: child,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

/// A menu for loading an [Equipment] from saved equipments.
class _LoadEquipmentMenu extends ConsumerWidget {
  /// A menu for loading an [Equipment] from saved equipments.
  const _LoadEquipmentMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipments = ref.watch(savedEquipmentsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <Equipment>[],
          loading: () => <Equipment>[],
        )..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));

    if (equipments.isEmpty) {
      return Container();
    }

    return MenuButtonWithChildren(
      text: 'Load',
      icon: Icons.history,
      menuChildren: equipments
          .map(
            (equipment) => MenuItemButton(
              child: Text(equipment.name ?? equipment.uuid),
              onPressed: () {
                equipment.lastUsed = DateTime.now();

                ref
                    .read(configuredEquipmentProvider.notifier)
                    .update(equipment);

                ref
                  ..read(saveEquipmentProvider(equipment))
                  ..invalidate(configuredEquipmentNameTextControllerProvider);
              },
            ),
          )
          .toList(),
    );
  }
}

/// A menu for loading an [EquipmentSetup] from saved equipments.
class _LoadEquipmentSetupMenu extends ConsumerWidget {
  /// A menu for loading an [EquipmentSetup] from saved equipments.
  const _LoadEquipmentSetupMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setups = ref.watch(savedEquipmentSetupsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <EquipmentSetup>[],
          loading: () => <EquipmentSetup>[],
        )..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));

    if (setups.isEmpty) {
      return Container();
    }

    return MenuButtonWithChildren(
      text: 'Load setup',
      icon: Icons.history,
      menuChildren: setups
          .map(
            (setup) => MenuItemButton(
              child: Text(setup.name),
              onPressed: () {
                setup.lastUsed = DateTime.now();

                ref.read(saveEquipmentSetupProvider(setup));
                ref
                    .read(configuredEquipmentSetupProvider.notifier)
                    .update(setup);
              },
            ),
          )
          .toList(),
    );
  }
}

/// A menu for attaching the [Equipment] in [configuredEquipmentProvider] to
/// the hierarchy.
class _AttachEquipmentMenu extends ConsumerWidget {
  /// A menu for attaching the [Equipment] in [configuredEquipmentProvider] to
  /// the hierarchy.
  const _AttachEquipmentMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasHitches = ref.watch(
      mainVehicleProvider.select((value) => value.hitchPoints.isNotEmpty),
    );

    if (!hasHitches) {
      return const SizedBox.shrink();
    }

    final equipmentName = ref.watch(
      configuredEquipmentProvider.select((value) => value.name ?? 'Unnamed'),
    );

    return MenuButtonWithChildren(
      text: 'Attach\n$equipmentName',
      icon: Icons.commit,
      menuChildren: [
        _RecursiveAttachEquipmentMenu(
          parent: ref.watch(mainVehicleProvider),
          child: ref.watch(configuredEquipmentProvider),
        ),
      ],
    );
  }
}

/// A recursive menu entry for attaching the [Equipment] in
/// [configuredEquipmentProvider] the hierarchy.
class _RecursiveAttachEquipmentMenu extends ConsumerWidget {
  /// A recursive menu entry for attaching the [Equipment] in
  /// [configuredEquipmentProvider] the hierarchy.
  ///
  /// [parent] is which [Hitchable] the [child] should connect to.
  const _RecursiveAttachEquipmentMenu({
    required this.parent,
    required this.child,
  });

  final Hitchable parent;
  final Equipment child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = [
      if (parent.parentHitch != null) parent.parentHitch!.name,
      (parent.name ?? parent.uuid),
    ].join('\n');

    if (parent.hitchPoints.isEmpty) {
      return MenuItemButton(
        child: Text(
          text,
        ),
      );
    }

    return MenuButtonWithChildren(
      text: text,
      menuChildren: [
        if (parent.hitchFrontFixedChild != null)
          _RecursiveAttachEquipmentMenu(
            parent: parent.hitchFrontFixedChild!,
            child: child,
          )
        else if (parent.hitchFrontFixedPoint != null)
          MenuItemButton(
            onPressed: child.hitchType == HitchType.fixed
                ? () => ref.read(simInputProvider.notifier).send(
                      (
                        parentUuid: parent.uuid,
                        child: child,
                        position: Hitch.frontFixed
                      ),
                    )
                : null,
            child: const Text('Front fixed'),
          ),
        if (parent.hitchRearFixedChild != null)
          _RecursiveAttachEquipmentMenu(
            parent: parent.hitchRearFixedChild!,
            child: child,
          )
        else if (parent.hitchRearFixedPoint != null)
          MenuItemButton(
            onPressed: child.hitchType == HitchType.fixed
                ? () => ref.read(simInputProvider.notifier).send(
                      (
                        parentUuid: parent.uuid,
                        child: child,
                        position: Hitch.rearFixed
                      ),
                    )
                : null,
            child: const Text('Rear fixed'),
          ),
        if (parent.hitchRearTowbarChild != null)
          _RecursiveAttachEquipmentMenu(
            parent: parent.hitchRearTowbarChild!,
            child: child,
          )
        else if (parent.hitchRearTowbarPoint != null)
          MenuItemButton(
            onPressed: child.hitchType == HitchType.towbar
                ? () => ref.read(simInputProvider.notifier).send(
                      (
                        parentUuid: parent.uuid,
                        child: child,
                        position: Hitch.rearTowbar
                      ),
                    )
                : null,
            child: const Text('Tow bar'),
          ),
      ],
    );
  }
}

/// A menu for attaching the [EquipmentSetup] in
/// [configuredEquipmentSetupProvider] to the hierarchy.
class _AttachEquipmentSetupMenu extends ConsumerWidget {
  /// A menu for attaching the [EquipmentSetup] in
  /// [configuredEquipmentSetupProvider] to the hierarchy.
  const _AttachEquipmentSetupMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasHitches = ref.watch(
      mainVehicleProvider.select((value) => value.hitchPoints.isNotEmpty),
    );

    final setup = ref.watch(configuredEquipmentSetupProvider);

    if (!hasHitches || setup == null) {
      return const SizedBox.shrink();
    }

    return MenuButtonWithChildren(
      text: 'Attach setup\n${setup.name}',
      icon: Icons.commit,
      menuChildren: [
        _RecursiveAttachEquipmentSetupMenu(
          parent: ref.watch(mainVehicleProvider),
          setup: setup,
        ),
      ],
    );
  }
}

/// A recursive menu for attaching the [EquipmentSetup] in
/// [configuredEquipmentSetupProvider] to the hierarchy.
class _RecursiveAttachEquipmentSetupMenu extends ConsumerWidget {
  /// A recursive menu for attaching the [EquipmentSetup] in
  /// [configuredEquipmentSetupProvider] to the hierarchy.
  ///
  /// [parent] is which [Hitchable] the [setup] should apply/attach to.
  const _RecursiveAttachEquipmentSetupMenu({
    required this.parent,
    required this.setup,
  });

  final Hitchable parent;
  final EquipmentSetup setup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = [
      if (parent.parentHitch != null) parent.parentHitch!.name,
      (parent.name ?? parent.uuid),
    ].join('\n');

    if (parent.hitchPoints.isEmpty) {
      return MenuItemButton(
        child: Text(
          text,
        ),
      );
    }

    if (parent.hitchPoints.isNotEmpty && parent.hitchChildren.isEmpty) {
      return MenuItemButton(
        child: Text(text),
        onPressed: () {
          ref
              .read(simInputProvider.notifier)
              .send((equipmentSetup: setup, parentUuid: parent.uuid));
        },
      );
    }

    return MenuButtonWithChildren(
      text: text,
      menuChildren: [
        if (parent.hitchFrontFixedChild != null)
          _RecursiveAttachEquipmentSetupMenu(
            parent: parent.hitchFrontFixedChild!,
            setup: setup,
          ),
        if (parent.hitchRearFixedChild != null)
          _RecursiveAttachEquipmentSetupMenu(
            parent: parent.hitchRearFixedChild!,
            setup: setup,
          ),
        if (parent.hitchRearTowbarChild != null)
          _RecursiveAttachEquipmentSetupMenu(
            parent: parent.hitchRearTowbarChild!,
            setup: setup,
          ),
      ],
    );
  }
}

/// A menu for detaching an [Equipment] from the hierarchy.
class _DetachMenu extends ConsumerWidget {
  /// A menu for detaching an [Equipment] from the hierarchy.

  const _DetachMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasChildren = ref.watch(
      mainVehicleProvider.select((value) => value.hitchChildren.isNotEmpty),
    );

    if (!hasChildren) {
      return const SizedBox.shrink();
    }

    return MenuButtonWithChildren(
      text: 'Detach',
      icon: Icons.commit,
      menuChildren: [
        MenuItemButton(
          child: const Text('Detach all'),
          onPressed: () => ref.read(simInputProvider.notifier).send(
            (
              detachAllFromUuid:
                  ref.read(mainVehicleProvider.select((value) => value.uuid))
            ),
          ),
        ),
        _RecursiveDetachMenu(parent: ref.watch(mainVehicleProvider)),
      ],
    );
  }
}

/// A recursive menu entry for detaching an [Equipment] from the hierarchy.
class _RecursiveDetachMenu extends ConsumerWidget {
  /// A recursive menu entry for detaching an [Equipment] from the hierarchy.
  ///
  /// [parent] is which [Hitchable] that should detach the child at the
  /// chosen hitch.
  const _RecursiveDetachMenu({required this.parent});

  final Hitchable parent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = [
      if (parent.parentHitch != null) parent.parentHitch!.name,
      (parent.name ?? parent.uuid),
    ].join('\n');

    if (parent.hitchChildren.isEmpty && parent is! Vehicle) {
      return MenuItemButton(
        child: Text(text),
        onPressed: () =>
            ref.read(simInputProvider.notifier).send((detachUuid: parent.uuid)),
      );
    }

    return MenuButtonWithChildren(
      text: text,
      menuChildren: parent.hitchChildren
          .map(
            (child) => _RecursiveDetachMenu(parent: child),
          )
          .toList(),
    );
  }
}
