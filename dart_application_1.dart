import 'dart:io';

class user{
String username;
String Password;
user (this.username , this.Password)
}
class ExpenseTracker{
  List<String> Expenses = [];
  user ? currentuser;
   
   void Login or Signup{
    print('\n Expense Tracker');
print ('1:Login:');
print ('2:Signup');
print ('3:Exit');

stdout.write('Enter your choice');
String ? choice =stdin.readLineSync();
   }
}
