import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/view/component/swiped_widget.dart';

class MainView extends StatefulWidget {
  /// [MainView] constructor
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late ScrollController _scrollController;
  double? _scrollPosition;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_getControllerValue);
  }

  void _getControllerValue() {
    if (_scrollController.hasClients) {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 16),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            snap: true,
            pinned: true,
            floating: true,
            expandedHeight: 164,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              centerTitle: true,
              title: Padding(
                padding:
                    const EdgeInsets.only(left: 60, right: 24.98, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Мои дела',
                          style: TextStyle(
                            fontSize:
                                _scrollPosition != null && _scrollPosition! < 10
                                    ? 50
                                    : 20,
                            color: Colors.black,
                          ),
                        ),
                        if (_scrollController.offset < 10)
                          const Text(
                            'Выполнено - 5',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                      ],
                    ),
                    const Icon(
                      Icons.wallet_membership,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ), //FlexibleSpaceBar

            backgroundColor: Colors.white,
          ),
          SliverFillRemaining(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const SwipedWidget();
                  },
                  itemCount: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
