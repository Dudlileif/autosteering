// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'implement_configurator_providers.g.dart';

/// A provider for the index of the naviagtion rail of the implement
/// configurator dialog.
@Riverpod(keepAlive: true)
class ImplementConfiguratorIndex extends _$ImplementConfiguratorIndex {
  @override
  int build() => 0;

  /// Updates the [state] to [value].
  void update(int value) => Future(() => state = value);

  /// Increase [state] by 1.
  void increase() => update(state + 1);

  /// Decrease [state] by 1.
  void decrease() => update(state - 1);
}

/// A provider for the implement from the configurator.
@Riverpod(keepAlive: true)
class ConfiguredImplement extends _$ConfiguredImplement {
  @override
  Equipment build() => ref.watch(loadedEquipmentProvider) ?? Equipment();

  /// Update the [state] to [implement].
  void update(Equipment implement) => Future(() => state = implement);

  /// Updates the implement's name to [name].
  void updateName(String? name) =>
      Future(() => state = state.copyWith(name: name));

  /// Updates the implement's [connector].
  void updateConnector(Connector connector, {required int index}) => Future(
    () => state = state.copyWith(
      connectors: state.connectors..replaceRange(index, index + 1, [connector]),
    ),
  );

  /// Removes the connector at [index] in the list.
  void removeConnector(int index) => Future(
    () => state = state.copyWith(
      connectors: state.connectors..replaceRange(index, index + 1, []),
    ),
  );

  /// Updates the implement's [section].
  void updateSection(Section section) => Future(
    () => state = state.copyWith(
      sections: state.sections
        ..replaceRange(section.index, section.index + 1, [section]),
    ),
  );

  @override
  bool updateShouldNotify(Equipment previous, Equipment next) {
    return true;
  }
}

/// A provider for whether the configured equipment sections should have equal
/// widths.
@riverpod
class ConfiguredImplementEqualWidths extends _$ConfiguredImplementEqualWidths {
  @override
  bool build() {
    listenSelf((previous, next) {
      if (previous != null && !previous && next) {
        final equipment = ref.read(configuredImplementProvider);
        ref
            .read(configuredImplementProvider.notifier)
            .update(
              equipment.copyWith(
                sections: equipment.sections
                    .map(
                      (section) => section.copyWith(
                        width: equipment.sections.first.width,
                      ),
                    )
                    .toList(),
              ),
            );
      }
    });

    return ref.read(
      configuredImplementProvider.select(
        (value) =>
            value.sections.isNotEmpty &&
            value.sections.every(
              (element) => element.width == value.sections.first.width,
            ),
      ),
    );
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for keepinng track of open sections in the implement
/// configurator.
@riverpod
class ConfiguredImplementOpenSections
    extends _$ConfiguredImplementOpenSections {
  @override
  Set<int> build() => {};

  /// Adds [value] to [state].
  void add(int value) => Future(() => state = {...state, value});

  /// Removes [value] from [state].
  void remove(int value) =>
      Future(() => state = state.where((v) => v != value).toSet());
}
