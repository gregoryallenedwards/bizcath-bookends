// Copyright the BizCath contributors.

/// The only source of the current time. The debug menu can override it; an
/// overridden clock keeps running from the chosen moment.
class ClockService {
  ClockService({DateTime Function()? systemNow})
    : _systemNow = systemNow ?? DateTime.now;

  final DateTime Function() _systemNow;
  Duration? _offset;

  bool get isOverridden => _offset != null;

  DateTime systemNow() => _systemNow();

  DateTime now() => _systemNow().add(_offset ?? Duration.zero);

  void override(DateTime moment) => _offset = moment.difference(_systemNow());

  void clearOverride() => _offset = null;
}
