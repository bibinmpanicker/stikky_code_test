import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stikky_code_test/product_list/product_list_query.dart';
import 'package:stikky_code_test/product_list/product_list_response.dart';

class ProductRepository {
  final GraphQLClient client;

  ProductRepository(this.client);

  Future<ProductListResponse> fetchProducts({String? endCursor}) async {
    final result = await client.query(
      QueryOptions(
        document: gql(getProductsQuery),
        variables: {"cursor": endCursor},
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      debugPrint(result.exception.toString());

      throw Error();
    }

    return ProductListResponse.fromJson(result.data!['products']);
  }
}
