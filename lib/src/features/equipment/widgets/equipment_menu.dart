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
        const _AttachMenu(),
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
                  ..read(SaveEquipmentProvider(equipment))
                  ..invalidate(configuredEquipmentNameTextControllerProvider);
              },
            ),
          )
          .toList(),
    );
  }
}

/// A menu for attaching the [Equipment] in [configuredEquipmentProvider] to
/// the hierarchy.
class _AttachMenu extends ConsumerWidget {
  /// A menu for attaching the [Equipment] in [configuredEquipmentProvider] to
  /// the hierarchy.
  const _AttachMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasHitches = ref.watch(
      mainVehicleProvider.select((value) => value.hitchPoints.isNotEmpty),
    );

    if (!hasHitches) {
      return const SizedBox.shrink();
    }

    return MenuButtonWithChildren(
      text: 'Attach',
      icon: Icons.commit,
      menuChildren: [
        _RecursiveAttachMenu(
          parent: ref.watch(mainVehicleProvider),
          child: ref.watch(configuredEquipmentProvider),
        ),
      ],
    );
  }
}

/// A recursive menu entry for attaching the [Equipment] in
/// [configuredEquipmentProvider] the hierarchy.
class _RecursiveAttachMenu extends ConsumerWidget {
  /// A recursive menu entry for attaching the [Equipment] in
  /// [configuredEquipmentProvider] the hierarchy.
  ///
  /// [parent] is which [Hitchable] the [child] should connect to.
  const _RecursiveAttachMenu({required this.parent, required this.child});

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
          _RecursiveAttachMenu(
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
          _RecursiveAttachMenu(
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
          _RecursiveAttachMenu(
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
