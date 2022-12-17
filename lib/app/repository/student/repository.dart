abstract class Repository<T> {
  Stream<List<T>> getData();
  Future<void> store(Map<String, dynamic> data);
  Future<void> update(dynamic uid, Map<String, dynamic> data);
  Future<void> destroy(dynamic uid);
}
