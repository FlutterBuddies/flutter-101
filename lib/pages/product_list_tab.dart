import 'package:cupertino_store/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/app_state_model.dart';
import '/components/product_row_item.dart';

class ProductListTab extends StatefulWidget {
  const ProductListTab({super.key});

  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  final Stream<QuerySnapshot> _productsStream =
      FirebaseFirestore.instance.collection("products").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return Consumer<AppStateModel>(
          builder: (context, model, child) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      radius: 20.0
                    ),
                    SizedBox(height: 20),
                    Text("Loading...")
                  ],
                ),
              );
            }

            return CustomScrollView(
              slivers: <Widget>[
                const CupertinoSliverNavigationBar(
                  largeTitle: Text('Cupertino Store'),
                ),
                SliverSafeArea(
                  top: false,
                  minimum: const EdgeInsets.only(top: 0),
                  sliver: SliverToBoxAdapter(
                    child: CupertinoListSection(
                      topMargin: 0,
                      children: snapshot.data!.docs
                        .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          return ProductRowItem(product: Product(
                              category: Category.values.byName(data['category']),
                              id: data['id'],
                              isFeatured: data['isFeatured'],
                              name: data['name'],
                              price: data['price'],
                            ),
                          );
                      })
                      .toList()
                      .cast()
                    ),
                  )
                )
              ],
            );
          },
        );
      }
    );
  }
}
