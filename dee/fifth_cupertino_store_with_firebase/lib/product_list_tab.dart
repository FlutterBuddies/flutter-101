import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:third_cupertino_store/model/product.dart';

import 'model/app_state_model.dart';
import 'product_row_item.dart';
import 'firebase_helper.dart';

class ProductListTab extends StatefulWidget {
  const ProductListTab({super.key});

  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = 
    FirebaseFirestore.instance.collection('products').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (context, snapshot) {
        return Consumer<AppStateModel>(
          builder: (context, model, child) {
            if (snapshot.hasError) {
              return const Text('something went wrong');
            } 
            if (snapshot.connectionState == ConnectionState.waiting ) {
              return const Text('Loading');
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
                          document.data()! as Map<String, dynamic>;
                          return ProductRowItem(product: Product(
                            category: Category.values.byName(data['category']), 
                            id: data['id'], 
                            isFeatured: data['isFeatured'], 
                            name: data['name'], 
                            price: data['price'])
                          );
                      })
                      .toList()
                      .cast(),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    );
  }
}