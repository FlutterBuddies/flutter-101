import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';
import 'product_row_item.dart';

class ProductListTab extends StatelessWidget {
  const ProductListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final products = model.getProducts();
        final isFetching = model.isFetching;
        final isFetchingSucceeded = model.isFetchingSucceeded;
        final isFetchingError = model.isFetchingError;

        return CustomScrollView(
          semanticChildCount: products.length,
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
                  children: [
                    if (isFetchingSucceeded && products.isNotEmpty)
                      for (var product in products)
                        ProductRowItem(
                          product: product,
                        )
                    else if (isFetchingError)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('Fetching Error'),
                      )
                    else if (isFetching)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CircularProgressIndicator(),
                      )
                    else
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('No Data'),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
