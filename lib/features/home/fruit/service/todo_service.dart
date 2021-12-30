import 'dart:convert';
import 'dart:io';

import 'package:samplesibra/features/home/fruit/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Todo>> getAllTodos() async {
    final response = await http.post("$baseUrl/todos", body: Todo());

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = jsonDecode(response.body);

        if (responseBody is List) {
          return responseBody.map((e) => Todo.fromJson(e)).cast<Todo>().toList();
        }
        break;
      default:
    }

    return null;
  }
}
