import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Given a commit message with the prefix "fix:", '
      'When the git hook commit-msg is triggered, '
      'Then the program should return an exitCode of 0', () async {
    // arrange
    ProcessResult result;
    int expected = 0;
    await File('.git/COMMIT_EDITMSG').writeAsString('fix: bug fix in login');

    // act
    result = await Process.run(
        'tools/hooks/commit-msg', ['.git/COMMIT_EDITMSG'],
        runInShell: true);
    final actual = result.exitCode;

    // assert
    expect(actual, equals(expected));
  });

  test(
      'Given a commit message without any prefix, '
      'When the git hook commit-msg is triggered, '
      'Then the program should return an exitCode of 1', () async {
    // arrange
    ProcessResult result;
    int expected = 1;
    await File('.git/COMMIT_EDITMSG').writeAsString('bug fix in login');

    // act
    result = await Process.run(
        'tools/hooks/commit-msg', ['.git/COMMIT_EDITMSG'],
        runInShell: true);
    final actual = result.exitCode;

    // assert
    expect(actual, equals(expected));
  });
}
