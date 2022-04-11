import 'dart:typed_data';

import 'package:mineup/json_models/fabric_mod.dart';
import 'package:mineup/json_models/project_version.dart';

class ModInfo {
  /// Local project info from fabric.mod.json
  final FabricMod _fabricMod;
  final Uint8List? _icon;

  /// Project Versions fetched from the Modrinth API
  List<ProjectVersion>? projectVersions;

  /// Fetching exception. If it's the ModrinthResponseException then it's a response exception.
  /// Otherwise, it's likely a request exception.
  Exception? fetchException;

  ModInfo({
    required FabricMod fabricMod,
    Uint8List? icon,
    this.projectVersions,
    this.fetchException,
  })  : _fabricMod = fabricMod,
        _icon = icon;

  FabricMod get fabricMod => _fabricMod;

  Uint8List? get icon => _icon;
}
