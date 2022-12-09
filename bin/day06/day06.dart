import 'dart:convert';
import 'dart:io';

void day06() {
  File('./bin/day06/input.txt').readAsString().then((String contents) {
    // part1(contents.split(''));
    part2(contents.split(''));
  });
}

void part1(List<String> input) {
  int firstIdx = 0;
  for (int r = 0; r < input.length-3; r++) {
    List<String> subject = input.sublist(r, r+4);
    print('Testing $subject');
    bool withMatch = false;
    while (subject.isNotEmpty) {
      String item = subject.removeAt(0);
      if (subject.remove(item)) {
        withMatch = true;
        print('matched $item');
      }
    }

    if (!withMatch && firstIdx == 0) {
      firstIdx = r + 4;
      break;
    }
  }

  print('First index is $firstIdx');
}

void part2(List<String> input) {
  int firstIdx = 0;
  for (int r = 0; r < input.length-13; r++) {
    List<String> subject = input.sublist(r, r+14);
    print('Testing $subject');
    bool withMatch = false;
    while (subject.isNotEmpty) {
      String item = subject.removeAt(0);
      if (subject.remove(item)) {
        withMatch = true;
        print('matched $item');
      }
    }

    if (!withMatch && firstIdx == 0) {
      firstIdx = r + 14;
      break;
    }
  }

  print('First index is $firstIdx');
}