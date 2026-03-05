import 'package:aplikasifilem/models/movie.dart';
import 'package:aplikasifilem/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  List<movie> _allMovies = [];
  List<movie> _trendingMovies = [];
  List<movie> _popularMovies = [];

  void _loadmovies() async {
    final List<Map<String, dynamic>> allmoviesData = await apiService.getAllMovies();
    final List<Map<String, dynamic>> trendingMoviesData = await apiService.getTrendingMovies();
    final List<Map<String, dynamic>> popularMoviesData = await apiService.getPopularMovies();

    setState(() {
      _allMovies = allmoviesData.map((e) => movie.fromJson(e)).toList();
      _trendingMovies = trendingMoviesData.map((e) => movie.fromJson(e)).toList();
      _popularMovies = popularMoviesData.map((e) => movie.fromJson(e)).toList();
    });

  }

  @override
  void initState() {
    super.initState();
    _loadmovies();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text('filem'),
    ),
    body: SingleChildScrollView(
      child: column(
        CrossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
      )
    )
    )
    
  }


}
