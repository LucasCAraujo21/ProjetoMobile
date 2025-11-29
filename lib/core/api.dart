import 'package:dio/dio.dart';

const kBaseUrl = 'https://api.themoviedb.org/3';
const kApiKey =
'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNWNmOWJlNDAyMjE1Yjg4N2U0YzhjZTUyMGIyOWI2NyIsIm5iZiI6MTc2NDQ0Njc1OC42NTUsInN1YiI6IjY5MmI1MjI2N2JiZGM3N2JmOGRmNzVhMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Z7d6-UN76p8xDm3QhevHZmlcO0q6iqcPOMJkK_8FCnc';

const kServerError = 'Failed to connect to the server. Try again later.';
final kDioOptions = BaseOptions(
baseUrl: kBaseUrl,
  connectTimeout: const Duration(milliseconds: 5000),
  receiveTimeout: const Duration(milliseconds: 3000),
contentType: 'application/json; charset=utf-8',
headers: {'Authorization' : 'Bearer $kApiKey' },

);