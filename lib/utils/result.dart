class Result<T> {
  late final T? content;
  late final String? error;
  late final bool isLoading = content == null && error == null;

  bool get success => error == null;

  Result({required this.content}) {
    error = null;
  }
  Result.error({required this.error});
}
