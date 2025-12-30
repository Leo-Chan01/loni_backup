import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceInfo {
  const DeviceInfo({
    required this.deviceId,
    required this.name,
    required this.platform,
    required this.appVersion,
    this.pushToken,
    this.pushProvider,
  });

  final String deviceId;
  final String name;
  final String platform;
  final String appVersion;
  final String? pushToken;
  final String? pushProvider;

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'name': name,
      'platform': platform,
      'appVersion': appVersion,
      if (pushToken != null) 'pushToken': pushToken,
      if (pushProvider != null) 'pushProvider': pushProvider,
    };
  }
}

class DeviceInfoService {
  static const _deviceIdKey = 'device_id';

  Future<DeviceInfo> getDeviceInfo() async {
    final deviceId = await _getOrCreateDeviceId();
    final packageInfo = await PackageInfo.fromPlatform();
    final platformName = Platform.operatingSystem;

    return DeviceInfo(
      deviceId: deviceId,
      name: Platform.localHostname,
      platform: platformName,
      appVersion: packageInfo.version,
    );
  }

  Future<String> _getOrCreateDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(_deviceIdKey);
    if (existing != null && existing.isNotEmpty) {
      return existing;
    }

    final generated = _generateDeviceId();
    await prefs.setString(_deviceIdKey, generated);
    return generated;
  }

  String _generateDeviceId() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    return base64UrlEncode(bytes).replaceAll('=', '');
  }
}
