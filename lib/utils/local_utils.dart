import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';

import '../json_models/fabric_mod.dart';

List<FabricMod> getLocalMods(String directory) {
  final modsDirectory = Directory(directory);

  final modInfos = modsDirectory
      .listSync()
      .where((item) => item is File && item.path.endsWith('.jar'))
      .map((item) {
        final jarFile = ZipDecoder().decodeBuffer(InputFileStream(item.path));
        final modInfoFile = jarFile.findFile('fabric.mod.json');

        // TODO: Handle non-existent mod info file in a better way
        return modInfoFile != null
            ? FabricMod.fromJson(jsonDecode(utf8.decode(modInfoFile.content)))
            : null;
      })
      .where((modInfo) => modInfo != null)
      .map((modInfo) => modInfo!);

  return modInfos.toList();
}
