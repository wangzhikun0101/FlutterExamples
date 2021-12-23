import 'package:flutter/material.dart';

/**
 * 生命变量类
 */
class Product {
  final String title;
  final String strDec;
  Product(this.title, this.strDec);
}

void main(List<String> args) {
  runApp(MaterialApp(
    title: "路由交互传参",
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(accentColor: Colors.cyan),
    home: ProductList(
        products: List.generate(
            20, (index) => Product('商品$index', "this is produc list $index"))),
  ));
}

class ProductList extends StatelessWidget {
  final List<Product> products;
  ProductList({Key key, @required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("abc"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new DetailScreen(product: products[index]);
              }));
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Product product;
  DetailScreen({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${product.title}"),
      ),
      body: Center(
        child: Text("${product.strDec}"),
      ),
    );
  }
}
