//-----------------------------------------------------------
// Mobile Application Programming (SCSJ3623)
// Semester 2, 2019/2020
// Exercise 3: HTTP and JSON
//
// Name 1:  Miraj Ahmed
//-----------------------------------------------------------

import '../models/todo.dart';

class DataService {
  static const String baseUrl =
      'http://192.168.137.1:3000'; // Change the IP address to your PC's IP. Remain the port number 3000 unchanged.

  // TODO 1: Complete this method. It is an helper for the HTTP GET request
  Future get(String endpoint) async {}

  // TODO 2: Complete this method. It is an helper for the HTTP POST request
  Future post(String endpoint, {dynamic data}) async {}

  // TODO 3: Complete this method. It is an helper for the HTTP PATCH request
  Future patch(String endpoint, {dynamic data}) async {}

  // TODO 4: Complete this method. It is an helper for the HTTP DELETE request
  Future delete(String endpoint) async {}

  // TODO 5: Complete this method. It is meant for getting the list of TODO s from the server
  Future<List<Todo>> getTodoList() async {}

  // TODO 6: Complete this method. It is meant for updating the status of a given TODO  (whether is completed or not) in the server
  Future<Todo> updateTodoStatus({int id, bool status}) async {}

  // TODO 7: Complete this method. It is meant for creating a new TODO  in the server
  Future<Todo> createTodo({Todo todo}) async {}

  // TODO 8: Complete this method. It is meant for deleting a given TODO  from the server
  Future<Todo> deleteTodo({int id}) async {}
}

final dataService = DataService();
