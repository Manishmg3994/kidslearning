import 'package:get/get.dart';

import 'ar.dart';
import 'de.dart';
import 'en_US.dart';
import 'es.dart';
import 'hi.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>>
      get keys => //add your translations if you can
          {
            'en_US': en,
            'ar': ar, //ar original
            'hi': hi,
            'es_ES': es,
            'de': de,
          }; // throw UnimplementedError();
}
