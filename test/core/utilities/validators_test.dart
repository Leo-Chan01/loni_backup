import 'package:flutter_test/flutter_test.dart';
import 'package:loni_africa/core/utilities/validators.dart';

void main() {
  group('Validators.isValidEmail', () {
    test('accepts a standard email', () {
      expect(Validators.isValidEmail('test@example.com'), isTrue);
    });

    test('rejects an invalid email', () {
      expect(Validators.isValidEmail('not-an-email'), isFalse);
      expect(Validators.isValidEmail('bad@'), isFalse);
      expect(Validators.isValidEmail('a@b'), isFalse);
    });
  });

  group('Validators.isValidPhone', () {
    test('accepts E.164-like numbers and ignores spaces/hyphens', () {
      expect(Validators.isValidPhone('+14155552671'), isTrue);
      expect(Validators.isValidPhone('+1 415-555-2671'), isTrue);
    });

    test('rejects invalid phone numbers', () {
      expect(Validators.isValidPhone('0000'), isFalse);
      expect(Validators.isValidPhone('+0123'), isFalse);
    });
  });

  group('Validators.isValidEmailOrPhone', () {
    test('accepts either email or phone', () {
      expect(Validators.isValidEmailOrPhone('test@example.com'), isTrue);
      expect(Validators.isValidEmailOrPhone('+14155552671'), isTrue);
    });

    test('rejects values that are neither', () {
      expect(Validators.isValidEmailOrPhone('hello world'), isFalse);
    });
  });

  group('Validators.isValidName', () {
    test('enforces min and max length', () {
      expect(Validators.isValidName('A'), isFalse);
      expect(Validators.isValidName('Ab'), isTrue);
      expect(Validators.isValidName('A' * (Validators.maxNameLength + 1)), isFalse);
    });
  });

  group('Validators.isValidPassword', () {
    test('enforces min length', () {
      expect(Validators.isValidPassword('1234567'), isFalse);
      expect(Validators.isValidPassword('12345678'), isTrue);
    });
  });
}
