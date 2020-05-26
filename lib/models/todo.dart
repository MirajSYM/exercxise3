//-----------------------------------------------------------
// Mobile Application Programming (SCSJ3623)
// Semester 2, 2019/2020
// Exercise 3: HTTP and JSON
//
// Name 1:  Miraj Ahmed
//
//-----------------------------------------------------------

// TODO Complete the definition of class Todo. Add the methods, fromJson() and toJson()

class Todo {
  int id;
  String title;
  bool completed;

  Todo({this.id, this.title, this.completed = false});
}
