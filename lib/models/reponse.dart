class Reponse<T> {
  final String error;
  final T? dataResponse;

  Reponse({this.error = '', this.dataResponse});
}
