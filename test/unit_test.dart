import 'package:test/test.dart';
import 'package:test_app1/main.dart';

void main() {
  test('Validator testing', () {
    expect(Validator.validate("some text"), true);
    expect(Validator.validate(""), false);
  });
}