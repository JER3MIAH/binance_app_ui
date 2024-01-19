import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getProductData() async {
    try {
      final res = await http.get(
        Uri.parse(
            'https://85a01f90-53aa-40a1-ad48-db0feacab16c.mock.pstmn.io/products'),
      );

      final data = jsonDecode(res.body);

      if (res.statusCode != 200) {
        throw 'An unexpected error occurred';
      }
      return data['data'];
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> checkout(
      String productName, double price, int quantity) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://85a01f90-53aa-40a1-ad48-db0feacab16c.mock.pstmn.io/checkout'),
        body: jsonEncode({
          "productName": productName,
          "price": price,
          "quantity": quantity,
        }),
      );

      if (response.statusCode != 200) {
        throw 'Failed to checkout';
      }

      print('Checkout successful');
    } catch (e) {
      throw e.toString();
    }
  }
}
