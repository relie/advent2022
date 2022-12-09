import 'dart:convert';
import 'dart:io';

void day02() {
  File('./bin/day02/input.txt').readAsString().then((String contents) {
    part1(contents.trim().split('\n'));
  });
}

// A = rock, B = paper, C = scissors
// X = rock, Y = paper, Z = scissors

// 1 = rock, 2 = paper, 3 = scissors
// 0 = lost, 3 = draw, 6 = win

void part1(List<String> input) {
  int endScore = 0;
  print('Length is ${input.length}');
  for (int r = 0; r < input.length; r++) {
    String line = input[r];
    int roundScore = 0;
    print('Line is $line.');
    final parts = line.split(' ');

    if (parts[1] == 'X') {
      roundScore += 1;
    } else if (parts[1] == 'Y') {
      roundScore += 2;
    } else if (parts[1] == 'Z') {
      roundScore += 3;
    }

    endScore += roundScore;
  }

  print('Final score is $endScore.');
}