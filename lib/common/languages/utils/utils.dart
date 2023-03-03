String validLang(String languageCurrent) {
  String langConvertTemp = languageCurrent.split('-')[0];
  String langConvert = 'en-US';
  switch (langConvertTemp) {
    case 'es':
      langConvert = 'es-ES';
      break;
    case 'fr':
      langConvert = 'fr-FR';
      break;
    case 'pt':
      langConvert = 'pt-BR';
      break;
    default:
      langConvert = 'en-US';
      break;
  }
  return langConvert;
}
