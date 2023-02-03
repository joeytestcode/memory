import 'package:common/web_helper.dart';

const String webBase = 'https://www.ldoceonline.com/dictionary/';
const String selector_entry = 'dictentry';
const String selector_link = 'dictlink';
const String selector_sense = 'Sense';

class LongmanDictionary {
  static void _searchDictionary(String word) async {
    final document = await WebHelper.getDocument(webBase+word);
    document.getElementsByClassName(selector_entry):

  }
}

