import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/logic/main_bloc.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/view/component/swiped_widget.dart';
import 'package:todo_list/view/custom_color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [MainView] the main window that the user sees when entering the program
class MainView extends StatefulWidget {
  // ignore: public_member_api_docs
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
    final customColor = Theme.of(context).extension<CustomColorScheme>()!;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40, right: 16),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/editPage', arguments: Task.empty());
            },
            child: const Icon(Icons.add),
          ),
        ),
        body: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            if (state is LoadedState) {
              return CustomScrollView(
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
                                  AppLocalizations.of(context)!.tasks,
                                  style: _scrollPosition < 10
                                      ? Theme.of(context).textTheme.bodyLarge!
                                      : Theme.of(context)
                                          .textTheme
                                          .titleMedium!,
                                ),
                                if (_scrollPosition < 10)
                                  Text(
                                    '${AppLocalizations.of(context)!.done} - '
                                    '${state.tasks.where((element) => element.done).toList().length}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: customColor.label_tertiary,
                                    ),
                                  ),
                              ],
                            ),
                            IconButton(
                              icon: AnimatedCrossFade(
                                duration: const Duration(milliseconds: 200),
                                firstChild: Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: customColor.blue,
                                ),
                                secondChild: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: customColor.blue,
                                ),
                                crossFadeState: state.eyeState
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                              ),
                              onPressed: () {
                                context.read<MainCubit>().toggleEye();
                              },
                            )
                          ],
                        ),
                      ),
                    ), //FlexibleSpaceBar
                  ),
                  SliverFillRemaining(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Card(
                        color: customColor.back_secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SwipedWidget(
                                state.tasks[index],
                              );
                            },
                            itemCount: state.tasks.length,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverFillRemaining(
                    child: SizedBox(),
                  ),
                ],
              );
            } else if (state is LoadState) {
              return const CircularProgressIndicator();
            }
            return const Text('err');
          },
        ),
      ),
    );
  }
}
