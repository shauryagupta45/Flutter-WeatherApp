import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  // task2();
  String task2result = await task2();
  task3();
  task4(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSec = Duration(seconds: 3);
  // sleep(threeSec); // this is the sync method of delaying
  String result;
  await Future.delayed(threeSec, () // this is async method of delaying.
      {
    result = 'task 2 data';
    print('task 2 complete');
  });

  return result;
}

void task3() {
  String result = 'task 3 data';
  print('task 3 complete');
}

// Sometimes we require the date of previous task in the current method( or say function). SO task 4 will rely on something that's coming from task 2 .

void task4(String task2data) {
  String result = 'task 4 data';
  print('Task 4 complete with $task2data');
}

// but ye result mei (Task 4 complete with  NULL) dikhaega, coz jab tk task 2 result hi generate ni krra, tb tk toh it wont show anything.
// so to do we do about that ?

// we can solve this by
// 1) adding async and await keyword in the performTask function,
// 2) Changing data type of task2 function to " Future " from String.
// 3) adding async and await in task 2 in the given position
// and we'll get what we want .
