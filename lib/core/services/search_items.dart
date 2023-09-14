class SearchItems<T> {
  final List<T> result;
  const SearchItems._(this.result);

  factory SearchItems.find(List<T> data, bool Function(T item) filter) {
    return SearchItems._(data.where(filter).toList());
  }
}
