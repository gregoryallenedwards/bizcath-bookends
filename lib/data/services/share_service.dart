// Copyright the BizCath contributors.
import 'package:share_plus/share_plus.dart';

/// The system share sheet.
class ShareService {
  Future<void> shareText(String text) async {
    await SharePlus.instance.share(ShareParams(text: text));
  }
}
