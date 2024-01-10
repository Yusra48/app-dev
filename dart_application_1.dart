import 'dart:io';

void main() {
  List<String> Expenses = [];

  while (true) {
    print('\n Expense Tracker');
    print('1:Add Expenses:');
    print('2:View Expenses:');
    print('3:Previous Month Expenses:');
    print('4:Exit');

    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();
  }
}
