import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';

typedef OnNewDynamicLinkPath = void Function(String newDynamicLinkPath);

/// Wrapper around [FirebaseDynamicLinks].
class DynamicLinkService {
  static const _domainUriPrefix = 'https://delalty.page.link';
  static const _iOSBundleId = 'com.example.delalty';
  static const _androidPackageName = "com.example.delalty";

  DynamicLinkService({
    @visibleForTesting FirebaseDynamicLinks? dynamicLinks,
  }) : _dynamicLinks = dynamicLinks ?? FirebaseDynamicLinks.instance;

  final FirebaseDynamicLinks _dynamicLinks;

  // 1
  Future<String> generateDynamicLinkUrl({
    required String path,
    SocialMetaTagParameters? socialMetaTagParameters,
  }) async {
    // 2
    final parameters = DynamicLinkParameters(
      link: Uri.parse(
        '$_domainUriPrefix.com$path',
      ),
      uriPrefix: _domainUriPrefix,
      androidParameters: const AndroidParameters(
        packageName: _androidPackageName,
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: _iOSBundleId,
        minimumVersion: '1',
        appStoreId: 'app_store_id',
      ),
      socialMetaTagParameters: socialMetaTagParameters,
    );
    // 3
    final shortLink = await _dynamicLinks.buildShortLink(parameters);
    return shortLink.shortUrl.toString();
  }

  Future<String?> getInitialDynamicLinkPath() async {
    final data = await _dynamicLinks.getInitialLink();
    final link = data?.link;
    return link?.path;
  }

  // 1
  Stream<String> onNewDynamicLinkPath() {
    // 2
    return _dynamicLinks.onLink.map(
      (PendingDynamicLinkData data) {
        final link = data.link;
        final path = link.path;
        // 3
        return path;
      },
    );
  }
}
