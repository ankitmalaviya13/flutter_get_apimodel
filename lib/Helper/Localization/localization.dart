import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'locale': 'English',
          'ge': 'english',
          'ge1': 'germen',
          'letsChangeYourLanguge': "Let's Change Your languages",
          'language': "Language",
        },
        // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        'de': {
          'locale': 'Germen',
          'ge': 'englis1',
          'ge1': 'germen1',
          'letsChangeYourLanguge': "Sprache ändern",
          'language': "Sprachen",
        }
      };
}
