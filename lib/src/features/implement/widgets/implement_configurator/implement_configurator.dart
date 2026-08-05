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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/implement/implement.dart';
import 'package:autosteering/src/features/implement/widgets/implement_configurator/implement_connectors_page.dart';
import 'package:autosteering/src/features/implement/widgets/implement_configurator/implement_name.dart';
import 'package:autosteering/src/features/implement/widgets/implement_configurator/implement_sections_page.dart';
import 'package:autosteering/src/features/implement/widgets/implement_preview.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quiver/strings.dart';

/// A [Dialog] for configuring an implement, with ability to apply to the
/// implement in the attached hierarchy, save to file or load from file.
class ImplementConfigurator extends ConsumerStatefulWidget {
  /// A [Dialog] for configuring an implement, with ability to apply to
  /// the implement in the attached hierarchy, save to file or load from file.
  const ImplementConfigurator({super.key});

  @override
  ConsumerState<ImplementConfigurator> createState() =>
      _ImplementConfiguratorState();
}

class _ImplementConfiguratorState extends ConsumerState<ImplementConfigurator>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(
    length: pages.length,
    vsync: this,
    initialIndex:
        ref.read(
          configuredImplementProvider.select((value) => isNotBlank(value.name)),
        )
        ? ref.read(implementConfiguratorIndexProvider)
        : 0,
  );
  static const pages = <Widget>[
    ImplementConnectorsPage(),
    ImplementSectionsPage(),
  ];

  late final AppLocalizations strings = AppLocalizations.of(context);

  late final destinations = [
    NavDest(
      icon: const Icon(Symbols.device_hub_rounded),
      label: strings.connectors(0),
    ),
    NavDest(
      icon: const Icon(Icons.view_column),
      label: strings.sections(0),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController.addListener(() {
      ref
          .read(implementConfiguratorIndexProvider.notifier)
          .update((tabController.index + tabController.offset).round());
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch (MediaQuery.sizeOf(context)) {
      Size(width: < 600) => _PortraitBuilder(
        tabController: tabController,
        pages: pages,
        destinations: destinations,
      ),
      _ => _LandscapeBuilder(
        tabController: tabController,
        destinations: destinations,
        pages: pages,
      ),
    };
  }
}

class _PortraitBuilder extends StatelessWidget {
  const _PortraitBuilder({
    required this.tabController,
    required this.pages,
    required this.destinations,
  });

  final TabController tabController;
  final List<Widget> pages;
  final List<NavDest> destinations;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final colorScheme = ColorScheme.of(context);

    return Dialog.fullscreen(
      child: Column(
        children: [
          AppBar(
            title: Text(
              strings.configureValue(strings.implement.toLowerCase()),
              maxLines: 2,
            ),
            automaticallyImplyLeading: false,
            actions: const [
              _SaveImplementButton(),
              CloseButton(),
            ],
          ),
          Expanded(
            child: _SliverBuilder(
              tabController: tabController,
              destinations: destinations,
              pages: pages,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final activeSections = ref.watch(
                configuredImplementOpenSectionsProvider,
              );

              return ExpansionTile(
                title: Text(strings.preview),
                shape: const RoundedRectangleBorder(
                  borderRadius: .vertical(top: .circular(12)),
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: .vertical(top: .circular(12)),
                ),
                collapsedBackgroundColor: colorScheme.surfaceContainerHighest,
                backgroundColor: colorScheme.surfaceContainerHighest,
                children: [
                  SizedBox(
                    height: 200,
                    child: Consumer(
                      builder: (context, ref, child) => ImplementPreview(
                        implement: ref.watch(configuredImplementProvider),
                        activeSections: activeSections,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LandscapeBuilder extends StatelessWidget {
  const _LandscapeBuilder({
    required this.tabController,
    required this.pages,
    required this.destinations,
  });

  final TabController tabController;
  final List<Widget> pages;
  final List<NavDest> destinations;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Dialog(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Text(
                        strings.configureValue(strings.implement.toLowerCase()),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const _SaveImplementButton(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: CloseButton(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) => ImplementPreview(
                      implement: ref.watch(configuredImplementProvider),
                      activeSections: ref.watch(
                        configuredImplementOpenSectionsProvider,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _SliverBuilder(
                    tabController: tabController,
                    destinations: destinations,
                    pages: pages,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A button that applies the implement configuration in
/// [configuredImplementProvider] to the attached hierarchy
/// in the simulator.
class _SaveImplementButton extends ConsumerWidget {
  /// A button that applies the implement configuration in
  /// [configuredImplementProvider] to the attached hierarchy
  /// in the simulator.
  const _SaveImplementButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    return FilledButton.icon(
      onPressed:
          ref.watch(
            configuredImplementProvider.select(
              (value) => isNotBlank(value.name),
            ),
          )
          ? () async {
              await Future<void>(() async {
                final implement = ref.watch(configuredImplementProvider);

                ref.read(simInputProvider.notifier).send((
                  updatedEquipment: implement,
                ));

                if (implement.id == null) {
                  await ref.read(
                    insertImplementProvider(implement, setLoaded: true).future,
                  );
                } else {
                  await ref.read(
                    updateImplementProvider(implement, setLoaded: true).future,
                  );
                }
              });

              if (context.mounted) {
                Navigator.of(context).pop();
              }
            }
          : null,
      icon: const Icon(Symbols.save_rounded),
      label: Text(strings.save),
    );
  }
}

class _SliverBuilder extends StatelessWidget {
  const _SliverBuilder({
    required this.tabController,
    required this.destinations,
    required this.pages,
  });

  final TabController tabController;
  final List<NavDest> destinations;
  final List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    final tabs = destinations
        .map(
          (d) => Tab(
            icon: d.icon,
            text: d.label,
          ),
        )
        .toList();
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          flexibleSpace: const ImplementName(),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          collapsedHeight: 80,
          bottom: TabBar(controller: tabController, tabs: tabs),
        ),
      ],
      body: TabBarView(controller: tabController, children: pages),
    );
  }
}
