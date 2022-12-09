import 'dart:async';
import 'dart:io';

void day01() {
  File('./bin/day01/input.txt').readAsString().then((String contents) {
    part3(contents);
  });
}

void part1(String contents) {
  List<String> lines = contents.split('\n');

  int max = 0;
  int current = 0;
  for (final line in lines) {
    if (line.isNotEmpty) {
      current += int.parse(line);
    } else {
      if (current > max) {
        max = current;
      }
      current = 0;
    }
  }
  print('Elf with the most has $max calories');
}

void part2(String contents) {
  List<String> lines = contents.split('\n');

  List<int> maxes = [0,0,0,0,0];
  int current = 0;
  for (final line in lines) {
    if (line.isNotEmpty) {
      current += int.parse(line);
    } else {
      for (int r = 0; r < maxes.length; r++) {
        if (current >= maxes[r]) {
          for (int l = maxes.length-1; l > r; l--) {
            maxes[l] = maxes[l-1];
          }
          maxes[r] = current;
          break;
        }
      }
      current = 0;
    }
  }

  int sum = 0;
  for (var element in maxes) {sum+=element;}

  print('Elves with the ${maxes.length} most have $maxes calories');
  print('Their total calories is $sum');
}

void part3(String contents) {
  List<String> lines = contents.split('\n');
  List<int> calories = [];

  int current = 0;
  for (final line in lines) {
    if (line.isNotEmpty) {
      current += int.parse(line);
    } else {
      calories.add(current);
      current = 0;
    }
  }

  calories.sort((a,b) => b.compareTo(a));

  int total = 0;
  calories.sublist(0,3).forEach((element) { total += element; });
  print(total);
}
