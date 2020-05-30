import 'package:test/test.dart';
import 'package:test_app1/main.dart';

void main() {
  //group that contains our tests
  group('Validator Testing', () {
  //first test that returns true
  test('Validator returns true', () {
    expect(Validator.validate("some text"), true);
  });
  //test empty string
  test('Validator returns false', () {
    expect(Validator.validate(""), false);
  });
  });
}