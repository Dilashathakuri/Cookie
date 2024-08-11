class HomeResponse {
  final List<dynamic> products;

  HomeResponse({required this.products});

  factory HomeResponse.fromJson(List<dynamic> json) {
    return HomeResponse(
      products: json,
    );
  }
}
