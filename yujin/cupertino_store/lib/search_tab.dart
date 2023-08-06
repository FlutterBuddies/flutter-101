import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';
import 'product_row_item.dart';
import 'search_bar.dart';
import 'styles.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);

    final results = model.search(_terms);
    final isFetching = model.isFetching;
    final isFetchingSucceeded = model.isFetchingSucceeded;
    final isFetchingError = model.isFetchingError;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.scaffoldBackground,
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSearchBox(),
            Expanded(
              child: SingleChildScrollView(
                child: CupertinoListSection(
                  topMargin: 0,
                  children: [
                    if (isFetchingSucceeded && results.isNotEmpty)
                      for (var product in results)
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
        ),
      ),
    );
  }
}
