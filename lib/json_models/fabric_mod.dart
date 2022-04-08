/// schemaVersion : 1
/// id : "presencefootsteps"
/// version : "1.5.0"
/// name : "Presence Footsteps"
/// description : "An overly complicated sound mod."
/// authors : ["Hurricaaane (Ha3)","Sollace"]
/// contact : {"homepage":"https://minecraft.ha3.eu/presencefootsteps","sources":"https://github.com/Sollace/Presence-Footsteps","issues":"https://github.com/Sollace/Presence-Footsteps/issues"}
/// license : "MIT"
/// icon : "presencefootsteps_logo.png"
/// environment : "client"
/// entrypoints : {"client":["eu.ha3.presencefootsteps.PresenceFootsteps"],"modmenu":["eu.ha3.presencefootsteps.PFModMenuFactory"]}
/// mixins : ["presencefootsteps.mixin.json"]
/// depends : {"fabricloader":">=0.12.0","java":">=17","fabric-api-base":">=0.1.0","fabric-lifecycle-events-v1":">=0.1.0","fabric-resource-loader-v0":">=0.1.0","kirin":"*"}
/// suggests : {"minelp":"*"}
/// jars : [{"file":"META-INF/jars/kirin-1.10.0.jar"}]

class FabricMod {
  FabricMod({
    required int schemaVersion,
    required String id,
    required String version,
    required String name,
    required String description,
    required List<String> authors,
    required Contact contact,
    required String license,
    required String icon,
    String? environment,
    Entrypoints? entrypoints,
    List<String>? mixins,
    required Depends depends,
    Suggests? suggests,
    List<Jar>? jars,
  })  : _schemaVersion = schemaVersion,
        _id = id,
        _version = version,
        _name = name,
        _description = description,
        _authors = authors,
        _contact = contact,
        _license = license,
        _icon = icon,
        _environment = environment,
        _entrypoints = entrypoints,
        _mixins = mixins,
        _depends = depends,
        _suggests = suggests,
        _jars = jars;

  factory FabricMod.fromJson(Map<String, dynamic> json) => FabricMod(
        schemaVersion: json['schemaVersion'],
        id: json['id'],
        version: json['version'],
        name: json['name'],
        description: json['description'],
        authors: List<String>.from(json['authors'].map((x) => x)),
        contact: Contact.from(json['contact']),
        license: json['license'],
        icon: json['icon'],
        environment: json['environment'],
        entrypoints: json['entrypoints'] != null
            ? Entrypoints.from(json['entrypoints'])
            : null,
        mixins: json['mixins'] != null
            ? List<String>.from(json['mixins'].map((x) => x))
            : null,
        depends: Depends.from(json['depends']),
        suggests:
            json['suggests'] != null ? Suggests.from(json['suggests']) : null,
        jars: json['jars'] != null
            ? List<Jar>.from(json['jars'].map((x) => Jar.fromJson(x)))
            : null,
      );

  final int _schemaVersion;
  final String _id;
  final String _version;
  final String _name;
  final String _description;
  final List<String> _authors;
  final Contact _contact;
  final String _license;
  final String _icon;
  final String? _environment;
  final Entrypoints? _entrypoints;
  final List<String>? _mixins;
  final Depends _depends;
  final Suggests? _suggests;
  final List<Jar>? _jars;

  int get schemaVersion => _schemaVersion;

  String get id => _id;

  String get version => _version;

  String get name => _name;

  String get description => _description;

  List<String> get authors => _authors;

  Contact get contact => _contact;

  String get license => _license;

  String get icon => _icon;

  String? get environment => _environment;

  Entrypoints? get entrypoints => _entrypoints;

  List<String>? get mixins => _mixins;

  Depends get depends => _depends;

  Suggests? get suggests => _suggests;

  List<Jar>? get jars => _jars;

  Map<String, dynamic> toJson() => {
        'schemaVersion': _schemaVersion,
        'id': _id,
        'version': _version,
        'name': _name,
        'description': _description,
        'authors': List<dynamic>.from(_authors.map((x) => x)),
        'contact': _contact,
        'license': _license,
        'icon': _icon,
        'environment': _environment,
        'entrypoints': _entrypoints,
        'mixins':
            _jars != null ? List<dynamic>.from(_mixins!.map((x) => x)) : null,
        'depends': _depends,
        'suggests': _suggests,
        'jars': _jars != null
            ? List<dynamic>.from(_jars!.map((x) => x.toJson()))
            : null,
      };
}

/// file : "META-INF/jars/kirin-1.10.0.jar"

class Jar {
  Jar({
    required String file,
  }) : _file = file;

  factory Jar.fromJson(Map<String, dynamic> json) => Jar(
        file: json['file'],
      );

  final String _file;

  String get file => _file;

  Map<String, dynamic> toJson() => {
        'file': _file,
      };
}

/// minelp : "*"

typedef Suggests = Map<String, String>;

/// fabricloader : ">=0.12.0"
/// java : ">=17"
/// fabric-api-base : ">=0.1.0"
/// fabric-lifecycle-events-v1 : ">=0.1.0"
/// fabric-resource-loader-v0 : ">=0.1.0"
/// kirin : "*"

typedef Depends = Map<String, String>;

/// client : ["eu.ha3.presencefootsteps.PresenceFootsteps"]
/// modmenu : ["eu.ha3.presencefootsteps.PFModMenuFactory"]

typedef Entrypoints = Map<String, dynamic>;

/// homepage : "https://minecraft.ha3.eu/presencefootsteps"
/// sources : "https://github.com/Sollace/Presence-Footsteps"
/// issues : "https://github.com/Sollace/Presence-Footsteps/issues"

typedef Contact = Map<String, String>;
