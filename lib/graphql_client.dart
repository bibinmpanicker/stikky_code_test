import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stikky_code_test/env.dart';

final HttpLink httpLink = HttpLink(
  'https://${Env.shopifyEndpoint}/api/2025-07/graphql.json',
  defaultHeaders: {'X-Shopify-Storefront-Access-Token': Env.shopifyToken},
);

ValueNotifier<GraphQLClient> graphqlClient = ValueNotifier(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: InMemoryStore()),
  ),
);
