import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mineup/other_models/fabric_mod_with_icon.dart';
import 'package:mineup/utils/local.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:window_size/window_size.dart';

void main() {
  // ensureInitialized makes sure that setting minimum window size and other things below actually work.
  WidgetsFlutterBinding.ensureInitialized();
  setWindowMinSize(const Size(400, 300));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (ctx, child) => MediaQuery(
        data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.25),
        child: child!,
      ),
      title: 'mineup',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.green[700]!,
          onPrimary: Colors.white,
          secondary: Colors.green[700]!,
          onSecondary: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.black54,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
        ),
        // Checkbox active color
        toggleableActiveColor: Colors.green[700]!,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<FabricModWithIcon> _localMods = [];

  final TextEditingController _directoryText = TextEditingController();

  void _setDirectoryText() async {
    final selectedDir = await FilePicker.platform.getDirectoryPath();
    if (selectedDir != null) {
      _directoryText.text = selectedDir;
    }
  }

  void _setLocalMods(String directory) {
    final localMods = getLocalMods(directory);
    setState(() {
      _localMods = localMods;
    });
  }

  void _setLocalModsWithButton() {
    _setLocalMods(_directoryText.text);
  }

  void _contactDropdownOnChanged(String? value) {
    if (value != null) {
      url_launcher.launch(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: Text('"mods" folder directory:')),
                  const SizedBox(width: 4.0),
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                      ),
                      controller: _directoryText,
                      onFieldSubmitted: _setLocalMods,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  OutlinedButton(
                    onPressed: _setDirectoryText,
                    child: const Text('...'),
                  ),
                  const SizedBox(width: 4.0),
                  ElevatedButton(
                    onPressed: _setLocalModsWithButton,
                    child: const Text('Load'),
                  ),
                  const SizedBox(width: 4.0),
                  ElevatedButton(
                    // TODO
                    onPressed: () {},
                    child: const Text('Check for Updates'),
                  ),
                ],
              ),
            ),
            Text(
              'Local mods:',
              style: Theme.of(context).textTheme.headline5,
            ),
            Flexible(
              child: ListView(
                children: _localMods
                    .map((mod) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          mod.icon != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  child: Image.memory(
                                                    mod.icon!,
                                                    semanticLabel:
                                                        "${mod.fabricMod.name} icon",
                                                    width: 48.0,
                                                    height: 48.0,
                                                    fit: BoxFit.cover,
                                                    filterQuality:
                                                        // Choosing image antialiasing method based on file size.
                                                        mod.icon!.length < 1600
                                                            ? FilterQuality.none
                                                            : FilterQuality
                                                                .high,
                                                  ),
                                                )
                                              : const Text('icon not found'),
                                          const VerticalDivider(
                                            thickness: 2.0,
                                            indent: 0,
                                            color: Colors.grey,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                mod.fabricMod.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                              Text(
                                                mod.fabricMod.version,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    DropdownButton(
                                        hint: const Text('Contact'),
                                        items: mod.fabricMod.contact.keys
                                            .map((socialMediaName) =>
                                                DropdownMenuItem(
                                                  value: mod.fabricMod
                                                      .contact[socialMediaName],
                                                  child: Text(socialMediaName
                                                              .length >
                                                          1
                                                      ? "${socialMediaName[0].toUpperCase()}${socialMediaName.substring(1)}"
                                                      : socialMediaName),
                                                ))
                                            .toList(),
                                        onChanged: _contactDropdownOnChanged),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(mod.fabricMod.description),
                                ExpansionTile(
                                  title: const Text('Versions on Modrinth'),
                                  children: [
                                    const Text('pretend v2'),
                                    const Text('pretend v1'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
