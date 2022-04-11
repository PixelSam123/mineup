import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mineup/json_models/project_version.dart';
import 'package:mineup/other_models/mod_info.dart';
import 'package:mineup/other_models/modrinth_response_exception.dart';

Map<String, String> _slugMismatchRemaps = {
  'ferritecore': 'ferrite-core',
  'mod-menu': 'modmenu',
};

void addProjectVersionsToModInfo(ModInfo modInfo,
    [int timeoutSeconds = 10]) async {
  try {
    final derivedSlug =
        modInfo.fabricMod.name.toLowerCase().replaceAll(' ', '-');
    final slug = _slugMismatchRemaps[derivedSlug] ?? derivedSlug;

    final response = await http
        .get(Uri.parse('https://api.modrinth.com/v2/project/$slug/version'))
        .timeout(Duration(seconds: timeoutSeconds));

    if (response.statusCode == 200) {
      modInfo.projectVersions = jsonDecode(response.body)
          .map((version) => ProjectVersion.fromJson(version));
    } else {
      modInfo.fetchException = ModrinthResponseException(response.statusCode);
    }
  } on Exception catch (e) {
    modInfo.fetchException = e;
  }
}
