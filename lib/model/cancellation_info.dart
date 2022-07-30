class CancellationInfo{
  /// Дата сторнирования
  DateTime? cancellationTime;
  DateTime? registerTime;
  String? comment;

  CancellationInfo({this.cancellationTime, this.registerTime, this.comment});

  static CancellationInfo fromJSON(Map<String, dynamic> data) {

    final comment = data['comment'] as String?;
    final cancellationTime = DateTime.parse(data['cancellationTime'] as String);
    final registerTime = DateTime.parse(data['registerTime'] as String);

    return CancellationInfo(comment: comment,cancellationTime: cancellationTime,registerTime: registerTime);
  }
}