// Standalone beginner exercise, not part of the profile UI.
// ignore_for_file: avoid_print

// 1. Variables & Null Safety
String clubName = 'App Dev Club';
String? nullableUser; // Can hold a value or be null

// 2. Class
class Student {
  String name;
  Student(this.name);
}

// 3. Async/Await Function
Future<void> fetchData() async {
  await Future.delayed(const Duration(seconds: 1));
  print('Data loaded successfully!');
}

Future<void> main() async {
  print('Welcome to $clubName');

  // Null safety check
  print('User: ${nullableUser ?? "Guest User"}');

  // Class instance
  var student = Student('Kanishk Saini');
  print('Student Name: ${student.name}');

  // Asynchronous operation
  await fetchData();
}
