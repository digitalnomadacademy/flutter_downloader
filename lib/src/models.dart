///
/// A class defines a set of possible statuses of a download task
///
class DownloadTaskStatus {
  final int _value;

  const DownloadTaskStatus(int value) : _value = value;

  int get value => _value;

  get hashCode => _value;

  operator ==(status) => status._value == this._value;

  toString() => 'DownloadTaskStatus($_value)';

  static DownloadTaskStatus from(int value) => DownloadTaskStatus(value);

  static const undefined = const DownloadTaskStatus(0);
  static const enqueued = const DownloadTaskStatus(1);
  static const running = const DownloadTaskStatus(2);
  static const complete = const DownloadTaskStatus(3);
  static const failed = const DownloadTaskStatus(4);
  static const canceled = const DownloadTaskStatus(5);
  static const paused = const DownloadTaskStatus(6);
}

///
/// A model class encapsulates all task information according to data in Sqlite
/// database.
///
/// * [taskId] the unique identifier of a download task
/// * [status] the latest status of a download task
/// * [progress] the latest progress value of a download task
/// * [url] the download link
/// * [filename] the local file name of a downloaded file
/// * [savedDir] the absolute path of the directory where the downloaded file is saved
/// * [timeCreated] milliseconds since the Unix epoch (midnight, January 1, 1970 UTC)
///
class DownloadTask {
  final String taskId;
  final DownloadTaskStatus status;
  final int progress;
  final String url;
  final String filename;
  final String savedDir;
  final int timeCreated;

  DownloadTask(
      {this.taskId,
      this.status,
      this.progress,
      this.url,
      this.filename,
      this.savedDir,
      this.timeCreated});

  DownloadTask copyWith({
    String taskId,
    DownloadTaskStatus status,
    int progress,
    String url,
    String filename,
    String savedDir,
    int timeCreated,
  }) {
    if ((taskId == null || identical(taskId, this.taskId)) &&
        (status == null || identical(status, this.status)) &&
        (progress == null || identical(progress, this.progress)) &&
        (url == null || identical(url, this.url)) &&
        (filename == null || identical(filename, this.filename)) &&
        (savedDir == null || identical(savedDir, this.savedDir)) &&
        (timeCreated == null || identical(timeCreated, this.timeCreated))) {
      return this;
    }

    return new DownloadTask(
      taskId: taskId ?? this.taskId,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      url: url ?? this.url,
      filename: filename ?? this.filename,
      savedDir: savedDir ?? this.savedDir,
      timeCreated: timeCreated ?? this.timeCreated,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadTask &&
          runtimeType == other.runtimeType &&
          taskId == other.taskId;

  @override
  int get hashCode => taskId.hashCode;

  @override
  String toString() =>
      "DownloadTask(taskId: $taskId, status: $status, progress: $progress, url: $url, filename: $filename, savedDir: $savedDir, timeCreated: $timeCreated)";
}
