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
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 1);
  double _scrollPosition = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(() {
        if (_scrollController.hasClients) {
          setState(() {
            _scrollPosition = _scrollController.offset;
          });
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  padding: EdgeInsets.only(
                    left: 60,
                    right: 24.98,
                    bottom: _scrollPosition < 10 ? 16 : 0,
                  ),
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
                            style: _scrollPosition < 10
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.black,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.black),
                          ),
                          if (_scrollPosition < 10)
                            const Text(
                              'Выполнено - 5',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                        ],
                      ),
                      const Icon(
                        Icons.remove_red_eye_rounded,
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
      ),
    );
  }
}
