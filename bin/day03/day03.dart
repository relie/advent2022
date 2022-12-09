import 'dart:convert';
import 'dart:io';

void day03() {
  File('./bin/day03/input.txt').readAsString().then((String contents) {
    // part1(LineSplitter().convert(contents));
    part2(LineSplitter().convert(contents));
  });
}

void part1(List<String> input) {
  List<String> dupes = [];
  for (final line in input) {
    int half = line.length~/2;
    List<String> chars = line.split('');
    List<String> sub1 = chars.sublist(0, half);
    List<String> sub2 = chars.sublist(half);
    // print(chars);
    // print('$sub1 $sub2');
    int idx = sub1.indexWhere((element) => sub2.contains(element));
    if (idx < 0) {
      print('N/A');
    } else {
      dupes.add(sub1[idx]);
    }
  }

  int priorities = 0;
  for (var element in dupes) {
    int val = element.codeUnitAt(0);
    if (97 <= val && val <= 122) {
      priorities += (val-96);
    } else if (65 <= val && val <= 90) {
      priorities += (val-38);
    } else {
      print('Error');
    }
  }

  print('The sum of priorities is $priorities');
}

void part2(List<String> input) {
  int groups = input.length~/3;
  List<String> dupes = [];
  for (int r = 0; r < groups; r++) {
    List<String> elf1 = input[3*r].split('');
    List<String> elf2 = input[(3*r)+1].split('');
    List<String> elf3 = input[(3*r)+2].split('');

    int idx = elf1.indexWhere((element) => elf2.contains(element) && elf3.contains(element));
    if (idx < 0) {
      print('NA/');
    } else {
      dupes.add(elf1[idx]);
    }
  }

  int priorities = 0;
  for (var element in dupes) {
    int val = element.codeUnitAt(0);
    if (97 <= val && val <= 122) {
      priorities += (val-96);
    } else if (65 <= val && val <= 90) {
      priorities += (val-38);
    } else {
      print('Error');
    }
  }

  print('The sum of priorities is $priorities');
}
