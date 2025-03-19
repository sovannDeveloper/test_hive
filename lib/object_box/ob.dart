import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '/objectbox.g.dart';

class OCBox {
  static late Store _store;

  static Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbDir = path.join(appDir.path, "oc_database");

    _store = await openStore(directory: dbDir);

    // init box
  }
}
