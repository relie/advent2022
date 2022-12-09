import 'dart:convert';
import 'dart:io';

void day05() {
  File('./bin/day05/input.txt').readAsString().then((String contents) {
    part2(LineSplitter().convert(contents));
  });
}

void part1(List<String> input) {
  List<String> stacksRaw = [];
  int r = 0;
  while(input[r].trim().isNotEmpty) {
    stacksRaw.add(input[r]);
    r++;
  }
  print(stacksRaw);
  List<List<String>> stacks = parseStacks(stacksRaw);

  List<String> instsRaw = input.sublist(r+1);
  List<List<int>> insts = parseInsts(instsRaw);
  print(insts);

  for (final inst in insts) {
    for (int r = 0; r < inst[0] ; r++) {
      String item = stacks[inst[1]-1].removeLast();
      stacks[inst[2]-1].add(item);
    }

    print('------------------------');
    print(stacks);
  }

  List<String> tops = [];
  for (final stack in stacks) {
    tops.add(stack.last);
  }

  print('------------------------');
  print(tops.join());
}

void part2(List<String> input) {
  List<String> stacksRaw = [];
  int r = 0;
  while(input[r].trim().isNotEmpty) {
    stacksRaw.add(input[r]);
    r++;
  }
  print(stacksRaw);
  List<List<String>> stacks = parseStacks(stacksRaw);

  List<String> instsRaw = input.sublist(r+1);
  List<List<int>> insts = parseInsts(instsRaw);
  print(insts);

  for (final inst in insts) {
    int stackLength = stacks[inst[1]-1].length;
    List<String> items = stacks[inst[1]-1].sublist(stackLength-inst[0]);
    stacks[inst[1]-1].removeRange(stackLength-inst[0], stackLength);
    stacks[inst[2]-1].addAll(items);

    print('------------------------');
    print(stacks);
  }

  List<String> tops = [];
  for (final stack in stacks) {
    tops.add(stack.last);
  }

  print('------------------------');
  print(tops.join());
}

List<List<int>> parseInsts(List<String> instsRaw) {
  List<List<int>> insts = [];

  for (final instRaw in instsRaw) {
    List<int> inst = [];
    List<String> parts = instRaw.split(' from ');
    inst.add(int.parse(parts[0].replaceAll('move ', '')));
    inst.addAll(parts[1].split(' to ').map((e) => int.parse(e)));

    insts.add(inst);
  }

  return insts;
}

List<List<String>> parseStacks(List<String> startStacksRaw) {
  List<List<String>> stacks = [];
  int cnt = startStacksRaw.last.replaceAll(' ', '').split('').length;

  for (int r = 0; r < cnt; r++) {
    stacks.add([]);
  }

  for (int r = startStacksRaw.length-2; r >= 0; r--) {
    print('Processing ${startStacksRaw[r]}');
    List<String> line = startStacksRaw[r].split('');
    for (int l = 0; l < cnt; l++) {
      int nextIdx = (4*l)+1;
      if (nextIdx < line.length) {
        String item = line[(4 * l) + 1];
        if (item.trim().isNotEmpty) {
          stacks[l].add(item);
        }
      }
    }
  }

  return stacks;
}
