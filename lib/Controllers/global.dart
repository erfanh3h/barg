class GlobalEntity {
  static String dataFilter(var data, {String replacement = ''}) {
    if (data.toString() == 'null' ||
        data.toString() == 'NULL' ||
        data.toString() == '[]' ||
        data.toString() == '{}') {
      return replacement;
    } else {
      return data.toString();
    }
  }
}
