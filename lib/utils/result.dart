class Result<T> {
  late final T? content;
  late final String? error;

  bool get success => error == null;

  Result({required this.content});
  Result.error({required this.error});
}
