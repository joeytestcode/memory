import 'package:common/web_helper.dart';
import 'package:html/dom.dart';

const String webBase = 'https://www.ldoceonline.com/dictionary/';
const String selector_entry = 'dictentry';
const String selector_link = 'dictlink';
const String selector_sense = 'Sense';
const String selector_word = 'HWD';
const String selector_hypenation = 'HYPENATION';
const String selector_proncodes = 'PronCodes';

class LongmanDictionary {
  static void _searchDictionary(String word) async {
    final document = await WebHelper.getDocument(webBase + word);

    List<Element> entries = document.getElementsByClassName(selector_entry);
    for (var entry in entries) {
      List<Element> links = entry.getElementsByClassName(selector_link);
      for (var link in links) {
        List<Element> senses = link.getElementsByClassName(selector_sense);
      }
    }
  }
}
