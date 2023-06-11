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

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(
            snap: true,
            pinned: true,
            floating: true,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Balance \n \$250",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Icon(
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
            hasScrollBody: true,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
