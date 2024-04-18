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

import 'package:universal_io/io.dart';

/// An extension that adds a method for finding subdirectories within
/// this [Directory] that contains a certain target file.
extension SubDirectoryFinder on Directory {
  /// Looks for subdirectories with the [target] file in them and returns the
  /// subdirectories' paths.
  ///
  /// The [recursiveLimit] limits how deep the search will go.
  Future<List<String>> findSubfoldersWithTargetFile({
    String target = 'created',
    int recursiveLimit = 3,
  }) async {
    if (recursiveLimit < 0 || !existsSync()) {
      return [];
    }
    final result = <String>[];

    final contents = listSync();

    for (final element in contents) {
      if (element.path == ([path, 'created'].join('/'))) {
        result.add(path);
      } else if (element.statSync().type == FileSystemEntityType.directory) {
        result.addAll(
          await Directory(element.path).findSubfoldersWithTargetFile(
            target: target,
            recursiveLimit: recursiveLimit - 1,
          ),
        );
      }
    }

    return result;
  }
}
