import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stikky_code_test/graphql_client.dart';
import 'package:stikky_code_test/product_list/cubit/product_list_cubit.dart';
import 'package:stikky_code_test/product_list/product_list_page.dart';
import 'package:stikky_code_test/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlClient,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => ProductRepository(graphqlClient.value),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    ProductListCubit(context.read<ProductRepository>())
                      ..fetchProducts(),
              ),
            ],
            child: ProductListPage(),
          ),
        ),
      ),
    );
  }
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF7F7F7),
  // light grey background
  primaryColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.redAccent,
    primary: Colors.black,
  ),

  cardTheme: CardThemeData(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 4,
    shadowColor: Colors.black.withValues(alpha: .3),
  ),
);
