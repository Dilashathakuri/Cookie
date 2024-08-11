import 'package:practice/data/model/home_response.dart';

abstract class HomeRepo {
  Future<HomeResponse> fetchProducts();
}


