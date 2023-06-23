import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/model/task.dart';

/// [MainCubit]
class MainCubit extends Cubit<MainState> {
  ///
  MainCubit() : super(LoadState()) {
    init();
  }

  bool eyeState = false;
  final _repo = FakeTaskRepository();
  int up = 0;

  Future init() async {
    await _repo.init();
    update();
  }

  Future<void> update() async {
    up++;
    if (eyeState) {
      emit(
        LoadedState(
          eyeState,
          _repo.getTasks().where((element) => element.done == false).toList(),
          up,
        ),
      );
    } else {
      emit(LoadedState(eyeState, _repo.getTasks(), up));
    }
  }

  Future<void> toggleEye() async {
    eyeState = !eyeState;
    await update();
  }

  Future<void> changeTask(Task task) async {
    _repo.editTask(task);
    await update();
  }

  Future<void> deleteTask(Task task) async {
    _repo.removeTask(task);
    await update();
  }

  Future<void> addTask(Task task) async {
    _repo.addTask(task);
    await update();
  }
}

class MainState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadState extends MainState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends MainState {
  LoadedState(this.eyeState, this.tasks, this.up);
  List<Task> tasks;
  bool eyeState;
  int up;
  @override
  List<Object?> get props => [eyeState, tasks, up];
}

class ErrorState extends MainState {
  @override
  List<Object?> get props => [];
}
