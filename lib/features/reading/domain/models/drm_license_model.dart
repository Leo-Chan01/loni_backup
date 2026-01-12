class DrmLicenseModel {
  const DrmLicenseModel({
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
}
