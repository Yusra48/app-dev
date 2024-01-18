import 'dart:io';

class User {
  late String username;
  late String password;

  User(this.username, this.password);
}

class CurrentUser extends User {
  CurrentUser(String username, String password) : super(username, password);

  void login() {
    stdout.write('Enter your username: ');
    final username = stdin.readLineSync() ?? '';

    stdout.write('Enter your Password:');
    final password = stdin.readLineSync() ?? '';

    final storedUser = retrieveUser(username);

    if (storedUser != null &&
        storedUser.username == username &&
        storedUser.password == password) {
      print("Login successful. Welcome $username!");
    } else {
      print("Invalid username or password. Please signup.");
      signup();
    }
  }

  void signup() {
    print('\nSignup');

    while (true) {
      stdout.write('Enter a Username: ');
      final newUsername = stdin.readLineSync();

      if (retrieveUser(newUsername!) != null) {
        print("Username already exists. Please choose a different one.");
        continue;
      }

      while (true) {
        stdout.write('Create a Password: ');
        final newPassword = stdin.readLineSync();
        stdout.write('Confirm your Password: ');
        final passwordConfirmation = stdin.readLineSync() ?? '';

        if (newPassword == passwordConfirmation) {
          print("Signup successful. Welcome, $newUsername!");
          return;
        } else {
          print("Signup failed. Passwords do not match.");
        }
      }
    }
  }

  User? retrieveUser(String username) {
    final List<User> users = [
      User("yusra48", "yy0987"),
      User("Ahmed45", "treadmil"),
    ];

    try {
      return users.firstWhere((user) => user.username == username);
    } catch (e) {
      return null;
    }
  }
  void ViewExpense(List<String> expenses) {
  if (expenses.isEmpty) {
    print('No expenses to display.');
  } else {
    print('\nExpense List:');
    for (int i = 0; i < expenses.length; i++) {
      print('${i + 1}: ${expenses[i]}');
    }
  }
}

void AddExpense(List<String> expenses) {
  stdout.write('Enter the expanse amount: ');
  String? amount = stdin.readLineSync();

  if (amount != null && amount.isNotEmpty) {
    expenses.add(amount);
    print('Expense added successfully!');
  } else {
    print('Invalid amount. Please enter a valid number.');
  }
}

void previousMonthExpense(List<String> expenses) {
  if (expenses.isEmpty) {
    print('No expenses to display.');
  } else {
    DateTime now = DateTime.now();
    DateTime firstDayOfCurrentMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfPreviousMonth =
        firstDayOfCurrentMonth.subtract(Duration(days: 1));

    print('\nPrevious Month Expense List:');
    for (int i = 0; i < expenses.length; i++) {
      print('${i + 1}: ${expenses[i]}');
    }
  }
}

}

void main() {
  final currentUser = CurrentUser('', '');

  while (true) {
    printMainMenu();

    try {
      final choice = int.parse(stdin.readLineSync() ?? '');
      handleMenuChoice(choice, currentUser);
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
    }
  }
}

void printMainMenu() {
  print('\nWelcome to Expense Tracker');
  print('1: Login');
  print('2: Signup');
  print('3: Add Expense');
  print('4: View Expense');
  print('5:Previous Month Expanse');
  print('5: Exit');
  stdout.write('Enter your choice: ');
}

void handleMenuChoice(int choice, CurrentUser currentUser) {
  switch (choice) {
    case 1:
      currentUser.login();
      break;

    case 2:
      currentUser.signup();
      break;

    case 3:
      currentUser.AddExpense([]);
      break;

    case 4:
      currentUser.ViewExpense([]);
      break;

    case 5:
      currentUser.previousMonthExpense([]);
      break;

    case 6:
      exit(0);

    default:
      print('Invalid choice. Please enter a valid option.');
  }
}
