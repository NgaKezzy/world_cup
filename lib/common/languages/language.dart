import 'package:get/get.dart';
import 'package:worldcup_app/common/languages/list_trans/en.dart';
import 'package:worldcup_app/common/languages/list_trans/es.dart';
import 'package:worldcup_app/common/languages/list_trans/fr.dart';
import 'package:worldcup_app/common/languages/list_trans/pt.dart';
import 'package:worldcup_app/common/languages/list_trans/vi.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'fr_FR': fr,
        'pt_BR': pt,
        'es_ES': es,
        'vi_VN': vi,
        
      };
}
