/// id : "P6ld16qa"
/// project_id : "aXf2OSFU"
/// author_id : "K0geyKfU"
/// featured : false
/// name : "Ok Zoomer 5.0.0-beta.5 for Minecraft 1.18.2"
/// version_number : "5.0.0-beta.5+1.18.2"
/// changelog : "This is effectively a patch update to 5.0.0-beta.4, fixing the following major bug:\n- Fixed the zoom key binds not appearing under the \"Key Binds\" screen"
/// changelog_url : null
/// date_published : "2022-03-09T22:12:27.128780Z"
/// downloads : 4643
/// version_type : "beta"
/// files : [{"hashes":{"sha512":"303c86fc052aaa03425ccc5411bdde7423825d254179a56161e1b11d16057328c293754ffa38d0d7d580cabf4ee646dce5a2d0087551ee3fbfb99bca4b7b23e7","sha1":"829fedb51030b479d023415eed565930f4a1c1a8"},"url":"https://cdn.modrinth.com/data/aXf2OSFU/versions/5.0.0-beta.5+1.18.2/okzoomer-5.0.0-beta.5%2B1.18.2.jar","filename":"okzoomer-5.0.0-beta.5+1.18.2.jar","primary":true}]
/// dependencies : [{"version_id":null,"project_id":"mOgUt4GM","dependency_type":"optional"},{"version_id":"BMFJwerO","project_id":"P7dR8mSH","dependency_type":"required"}]
/// game_versions : ["1.18.2"]
/// loaders : ["fabric"]

class ProjectVersion {
  ProjectVersion({
    required String id,
    required String projectId,
    required String authorId,
    required bool featured,
    required String name,
    required String versionNumber,
    required String changelog,
    String? changelogUrl,
    required String datePublished,
    required int downloads,
    required String versionType,
    required List<Files> files,
    required List<Dependencies> dependencies,
    required List<String> gameVersions,
    required List<String> loaders,
  })  : _id = id,
        _projectId = projectId,
        _authorId = authorId,
        _featured = featured,
        _name = name,
        _versionNumber = versionNumber,
        _changelog = changelog,
        _changelogUrl = changelogUrl,
        _datePublished = datePublished,
        _downloads = downloads,
        _versionType = versionType,
        _files = files,
        _dependencies = dependencies,
        _gameVersions = gameVersions,
        _loaders = loaders;

  factory ProjectVersion.fromJson(Map<String, dynamic> json) => ProjectVersion(
        id: json['id'],
        projectId: json['project_id'],
        authorId: json['author_id'],
        featured: json['featured'],
        name: json['name'],
        versionNumber: json['version_number'],
        changelog: json['changelog'],
        changelogUrl: json['changelog_url'],
        datePublished: json['date_published'],
        downloads: json['downloads'],
        versionType: json['version_type'],
        files: List<Files>.from(json['files'].map((x) => Files.fromJson(x))),
        dependencies: List<Dependencies>.from(
            json['dependencies'].map((x) => Dependencies.fromJson(x))),
        gameVersions: List<String>.from(json['game_versions'].map((x) => x)),
        loaders: List<String>.from(json['loaders'].map((x) => x)),
      );

  final String _id;
  final String _projectId;
  final String _authorId;
  final bool _featured;
  final String _name;
  final String _versionNumber;
  final String _changelog;
  final String? _changelogUrl;
  final String _datePublished;
  final int _downloads;
  final String _versionType;
  final List<Files> _files;
  final List<Dependencies> _dependencies;
  final List<String> _gameVersions;
  final List<String> _loaders;

  String get id => _id;

  String get projectId => _projectId;

  String get authorId => _authorId;

  bool get featured => _featured;

  String get name => _name;

  String get versionNumber => _versionNumber;

  String get changelog => _changelog;

  String? get changelogUrl => _changelogUrl;

  String get datePublished => _datePublished;

  int get downloads => _downloads;

  String get versionType => _versionType;

  List<Files> get files => _files;

  List<Dependencies> get dependencies => _dependencies;

  List<String> get gameVersions => _gameVersions;

  List<String> get loaders => _loaders;

  Map<String, dynamic> toJson() => {
        'id': _id,
        'project_id': _projectId,
        'author_id': _authorId,
        'featured': _featured,
        'name': _name,
        'version_number': _versionNumber,
        'changelog': _changelog,
        'changelog_url': _changelogUrl,
        'date_published': _datePublished,
        'downloads': _downloads,
        'version_type': _versionType,
        'files': List<dynamic>.from(_files.map((x) => x.toJson())),
        'dependencies':
            List<dynamic>.from(_dependencies.map((x) => x.toJson())),
        'game_versions': List<dynamic>.from(_gameVersions.map((x) => x)),
        'loaders': List<dynamic>.from(_loaders.map((x) => x)),
      };
}

/// version_id : null
/// project_id : "mOgUt4GM"
/// dependency_type : "optional"

class Dependencies {
  Dependencies({
    String? versionId,
    String? projectId,
    required String dependencyType,
  })  : _versionId = versionId,
        _projectId = projectId,
        _dependencyType = dependencyType;

  factory Dependencies.fromJson(Map<String, dynamic> json) => Dependencies(
        versionId: json['version_id'],
        projectId: json['project_id'],
        dependencyType: json['dependency_type'],
      );

  String? _versionId;
  String? _projectId;
  String _dependencyType;

  String? get versionId => _versionId;

  String? get projectId => _projectId;

  String get dependencyType => _dependencyType;

  Map<String, dynamic> toJson() => {
        'version_id': _versionId,
        'project_id': _projectId,
        'dependency_type': _dependencyType,
      };
}

/// hashes : {"sha512":"303c86fc052aaa03425ccc5411bdde7423825d254179a56161e1b11d16057328c293754ffa38d0d7d580cabf4ee646dce5a2d0087551ee3fbfb99bca4b7b23e7","sha1":"829fedb51030b479d023415eed565930f4a1c1a8"}
/// url : "https://cdn.modrinth.com/data/aXf2OSFU/versions/5.0.0-beta.5+1.18.2/okzoomer-5.0.0-beta.5%2B1.18.2.jar"
/// filename : "okzoomer-5.0.0-beta.5+1.18.2.jar"
/// primary : true

class Files {
  Files({
    required Hashes hashes,
    required String url,
    required String filename,
    required bool primary,
  })  : _hashes = hashes,
        _url = url,
        _filename = filename,
        _primary = primary;

  factory Files.fromJson(Map<String, dynamic> json) => Files(
        hashes: Hashes.fromJson(json['hashes']),
        url: json['url'],
        filename: json['filename'],
        primary: json['primary'],
      );

  Hashes _hashes;
  String _url;
  String _filename;
  bool _primary;

  Hashes get hashes => _hashes;

  String get url => _url;

  String get filename => _filename;

  bool get primary => _primary;

  Map<String, dynamic> toJson() => {
        'hashes': _hashes.toJson(),
        'url': _url,
        'filename': _filename,
        'primary': _primary,
      };
}

/// sha512 : "303c86fc052aaa03425ccc5411bdde7423825d254179a56161e1b11d16057328c293754ffa38d0d7d580cabf4ee646dce5a2d0087551ee3fbfb99bca4b7b23e7"
/// sha1 : "829fedb51030b479d023415eed565930f4a1c1a8"

class Hashes {
  Hashes({
    required String sha512,
    required String sha1,
  })  : _sha512 = sha512,
        _sha1 = sha1;

  factory Hashes.fromJson(Map<String, dynamic> json) => Hashes(
        sha512: json['sha512'],
        sha1: json['sha1'],
      );

  String _sha512;
  String _sha1;

  String get sha512 => _sha512;

  String get sha1 => _sha1;

  Map<String, dynamic> toJson() => {
        'sha512': _sha512,
        'sha1': _sha1,
      };
}
