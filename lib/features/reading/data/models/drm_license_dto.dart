class DrmLicenseDto {
  const DrmLicenseDto({
    required this.licenseId,
    required this.deviceLimit,
    required this.licenseStatus,
    required this.expiresAt,
    required this.activatedDevices,
  });

  final String licenseId;
  final int deviceLimit;
  final String licenseStatus;
  final DateTime? expiresAt;
  final int activatedDevices;

  factory DrmLicenseDto.fromJson(Map<String, dynamic> json) {
    return DrmLicenseDto(
      licenseId: (json['licenseId'] ?? '').toString(),
      deviceLimit: _asInt(json['deviceLimit']),
      licenseStatus: (json['licenseStatus'] ?? '').toString(),
      expiresAt: _tryParseDateTime(json['expiresAt']),
      activatedDevices: _asInt(json['activatedDevices']),
    );
  }

  static int _asInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  static DateTime? _tryParseDateTime(Object? value) {
    if (value == null) return null;
    final raw = value.toString();
    if (raw.isEmpty) return null;
    return DateTime.tryParse(raw);
  }
}
