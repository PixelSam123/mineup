import 'dart:typed_data';

import 'package:mineup/json_models/fabric_mod.dart';

class FabricModWithIcon {
  final FabricMod _fabricMod;
  final Uint8List? _icon;

  FabricModWithIcon({
    required FabricMod fabricMod,
    Uint8List? icon,
  })
      : _fabricMod = fabricMod,
        _icon = icon;

  FabricMod get fabricMod => _fabricMod;

  Uint8List? get icon => _icon;
}
