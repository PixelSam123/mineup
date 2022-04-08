import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mineup/json_models/fabric_mod.dart';
import 'package:mineup/utils/local_utils.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.green[700]!,
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
  List<FabricMod> _localMods = [];

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
            Row(
              children: [
                const Text('"mods" folder directory:'),
                Flexible(
                    child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                  ),
                  controller: _directoryText,
                  onFieldSubmitted: _setLocalMods,
                )),
                OutlinedButton(
                  onPressed: _setDirectoryText,
                  child: const Text('...'),
                ),
              ],
            ),
            Text(
              'Local mods:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Column(
              children: _localMods
                  .map((mod) => Card(
                        child: Column(
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  const Text("pichere"),
                                  const VerticalDivider(
                                    thickness: 2.0,
                                    indent: 0,
                                    color: Colors.grey,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mod.name,
                                        style: Theme.of(context).textTheme.headline6,
                                      ),
                                      Text(
                                        mod.version,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(mod.description),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
