import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'model/app_state_model.dart';
import 'product_row_item.dart';
import 'model/product.dart';

class ProductListTab extends StatefulWidget {
  const ProductListTab({super.key});

  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  final Stream<QuerySnapshot> _productsStream =
      FirebaseFirestore.instance.collection('products').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (context, snapshot) {
        return Consumer<AppStateModel>(builder: (context, model, child) {
          return CustomScrollView(
            slivers: <Widget>[
              const CupertinoSliverNavigationBar(
                largeTitle: Text('Cupertino Store'),
              ),
              SliverSafeArea(
                top: false,
                minimum: const EdgeInsets.only(top: 0),
                sliver: SliverToBoxAdapter(
                  child: CupertinoListSection(topMargin: 0, children: [
                    ...(snapshot.data!.docs
                        .map((document) =>
                            document.data() as Map<String, dynamic>)
                        .where((element) => element.containsKey("id"))
                        .map(Product.fromDocs)
                        .map((product) => ProductRowItem(
                              product: product,
                            )))
                  ]),
                ),
              )
            ],
          );
        });
      },
    );
  }
}
