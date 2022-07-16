import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _lista = [];
  bool isLoading = false;
  int _latest = 0;
  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Views'),
      ),
      body: Stack(children: [
        _createList(),
        _createLoading(),
      ]),
    );
  }

  _createList() {
    return RefreshIndicator(
      onRefresh: getPage,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _lista.length,
          itemBuilder: (BuildContext context, int index) {
            final images = _lista[index];
            return FadeInImage(
                height: 300,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://picsum.photos/500/300?random=$images'),
                placeholder: const AssetImage('assets/loading.gif'));
          }),
    );
  }

  Future<void> getPage() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _lista.clear();
      _latest++;
      _addImages();
    });
    return Future.delayed(duration);  
  }

  _addImages() {
    for (var i = 0; i < 10; i++) {
      _latest++;
      _lista.add(_latest);
    }
    setState(() {});
  }

  Future fetchData() async {
    isLoading = true;
    const duration = Duration(seconds: 2);
    setState(() {});
    Timer(duration, callback);
  }

  void callback() {
    isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    _addImages();
  }

  _createLoading() {
    if (isLoading) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
            const SizedBox(height: 15)
          ]);
    }
    return Container();
  }
}
