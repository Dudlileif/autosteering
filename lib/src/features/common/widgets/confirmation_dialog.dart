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

import 'package:flutter/material.dart';

/// A dialog asking for confirmation before running [onConfirmation].
class ConfirmationDialog extends StatelessWidget {
  /// A dialog asking for confirmation before running [onConfirmation].
  const ConfirmationDialog({
    required this.title,
    required this.onConfirmation,
    super.key,
  });

  /// The title at the top of the dialog.
  final String title;

  /// The function to run when confirmation is received.
  final Future<void> Function() onConfirmation;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      contentPadding: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
        bottom: 16,
      ),
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(false),
                icon: const Icon(Icons.clear),
                label: const Text('Cancel'),
              ),
              FilledButton.icon(
                onPressed: () async {
                  await onConfirmation();
                  if (context.mounted) {
                    Navigator.of(context).pop(true);
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A dialog asking for confirmation before running [onDelete].
class DeleteDialog extends StatelessWidget {
  /// A dialog asking for confirmation before running [onDelete].
  ///
  /// The defualt title is 'Delete [name]?', but can be overidden by
  /// [overrideString].
  const DeleteDialog({
    required this.name,
    required this.onDelete,
    this.overrideString,
    super.key,
  });

  /// The name of the object to delete.
  final String name;

  /// Overriding string for the dialog title.
  final String? overrideString;

  /// The function that runs the deletion process.
  final Future<void> Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: overrideString ?? 'Delete $name?',
      onConfirmation: onDelete,
      key: key,
    );
  }
}
