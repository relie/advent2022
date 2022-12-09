import 'dart:convert';
import 'dart:io';

void day04() {
  File('./bin/day04/input.txt').readAsString().then((String contents) {
    part2(LineSplitter().convert(contents));
  });
}

void part1(List<String> input) {
  int covers = 0;
  for (final line in input) {
    List<String> pairs = line.split(',');
    List<int> elf1 = pairs[0].split('-').map((e) => int.parse(e)).toList();
    List<int> elf2 = pairs[1].split('-').map((e) => int.parse(e)).toList();

    if (elf1[0] >= elf2[0] && elf1[1] <= elf2[1]) {
      print('1 is fully contained in 2');
      covers++;
    } else if (elf2[0] >= elf1[0] && elf2[1] <= elf1[1]) {
      print('2 is fully contained in 1');
      covers++;
    } else {
      print('N/A');
    }
  }

  print('There are $covers full coverages.');
}

void part2(List<String> input) {
  int covers = 0;
  for (final line in input) {
    List<String> pairs = line.split(',');
    List<int> elf1 = pairs[0].split('-').map((e) => int.parse(e)).toList();
    List<int> elf2 = pairs[1].split('-').map((e) => int.parse(e)).toList();

    if ((elf2[0] <= elf1[0] && elf1[0] <= elf2[1])
        || (elf2[0] <= elf1[1] && elf1[1] <= elf2[1])) {
      print('1 is contained in 2');
      covers++;
    } else if ((elf1[0] <= elf2[0] && elf2[0] <= elf1[1])
        || (elf1[0] <= elf2[1] && elf2[1] <= elf1[1])) {
      print('2 is contained in 1');
      covers++;
    } else {
      print('N/A');
    }
  }

  print('There are $covers full coverages.');
}
