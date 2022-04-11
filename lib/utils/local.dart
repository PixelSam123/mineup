import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:mineup/other_models/mod_info.dart';

import 'package:mineup/json_models/fabric_mod.dart';

List<ModInfo> getLocalMods(String directory) {
  final modsDirectory = Directory(directory);

  final modInfos = modsDirectory
      .listSync()
      .where((item) => item is File && item.path.endsWith('.jar'))
      .map((item) {
        final jarFile = ZipDecoder().decodeBuffer(InputFileStream(item.path));
        final modInfoFile = jarFile.findFile('fabric.mod.json');

        // TODO: Handle non-existent mod info file in a better way
        if (modInfoFile == null) {
          return null;
        }

        final modInfo =
            FabricMod.fromJson(jsonDecode(utf8.decode(modInfoFile.content)));
        final iconFile = jarFile.findFile(modInfo.icon);

        return ModInfo(fabricMod: modInfo, icon: iconFile?.content);
      })
      .where((modInfo) => modInfo != null)
      .map((modInfo) => modInfo!);

  return modInfos.toList();
}
