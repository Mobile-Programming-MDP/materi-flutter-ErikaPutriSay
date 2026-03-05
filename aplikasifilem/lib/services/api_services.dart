import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '9d6b1a75df5833e0e59a8534172adb39';

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey"),
    );
    final data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/movie/trending/week?api_key=$apiKey"),
    );
    final data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"),
    );
    final data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse("$baseUrl/search/movie?api_key=$apiKey&query=$query"),
    );
    final data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }
}
//API Read Access Token :
//eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZDZiMWE3NWRmNTgzM2UwZTU5YTg1MzQxNzJhZGIzOSIsIm5iZiI6MTc3MjYwMDU4Ni4xMDIwMDAyLCJzdWIiOiI2OWE3YmQwYTFhZDJhMzRjYTM5NjRhMGQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.3ukqdaQSPodOYfZuyjt7464FNIkwyWsjeoX_KW9ik_Q

//API Key
//9d6b1a75df5833e0e59a8534172adb39
