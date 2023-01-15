import 'package:url_launcher/url_launcher.dart';

/// Digunakan saat membutuhkan suatu fungsi yang dimana fungsi tersebut
/// digunakan lebih dari 1 file.
///
/// contoh : launchLink
/// fungsi 'launchlink' digunakan lebih dari 1 file

class MyFunction {
  Future<void> launchLink(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }
}
