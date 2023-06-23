// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  @HiveField(0)
  String get text => throw _privateConstructorUsedError;
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  TaskImportance get importance => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get deadline => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get done => throw _privateConstructorUsedError;
  @HiveField(5)
  String get color => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get changedAt => throw _privateConstructorUsedError;
  @HiveField(8)
  int get deviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {@HiveField(0) String text,
      @HiveField(1) String id,
      @HiveField(2) TaskImportance importance,
      @HiveField(3) DateTime deadline,
      @HiveField(4) bool done,
      @HiveField(5) String color,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime changedAt,
      @HiveField(8) int deviceId});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? id = null,
    Object? importance = null,
    Object? deadline = null,
    Object? done = null,
    Object? color = null,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as TaskImportance,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String text,
      @HiveField(1) String id,
      @HiveField(2) TaskImportance importance,
      @HiveField(3) DateTime deadline,
      @HiveField(4) bool done,
      @HiveField(5) String color,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime changedAt,
      @HiveField(8) int deviceId});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? id = null,
    Object? importance = null,
    Object? deadline = null,
    Object? done = null,
    Object? color = null,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? deviceId = null,
  }) {
    return _then(_$_Task(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as TaskImportance,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: 'TaskAdapter')
class _$_Task extends _Task {
  _$_Task(
      {@HiveField(0) required this.text,
      @HiveField(1) required this.id,
      @HiveField(2) required this.importance,
      @HiveField(3) required this.deadline,
      @HiveField(4) required this.done,
      @HiveField(5) required this.color,
      @HiveField(6) required this.createdAt,
      @HiveField(7) required this.changedAt,
      @HiveField(8) required this.deviceId})
      : super._();

  @override
  @HiveField(0)
  final String text;
  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final TaskImportance importance;
  @override
  @HiveField(3)
  final DateTime deadline;
  @override
  @HiveField(4)
  final bool done;
  @override
  @HiveField(5)
  final String color;
  @override
  @HiveField(6)
  final DateTime createdAt;
  @override
  @HiveField(7)
  final DateTime changedAt;
  @override
  @HiveField(8)
  final int deviceId;

  @override
  String toString() {
    return 'Task(text: $text, id: $id, importance: $importance, deadline: $deadline, done: $done, color: $color, createdAt: $createdAt, changedAt: $changedAt, deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, id, importance, deadline,
      done, color, createdAt, changedAt, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);
}

abstract class _Task extends Task {
  factory _Task(
      {@HiveField(0) required final String text,
      @HiveField(1) required final String id,
      @HiveField(2) required final TaskImportance importance,
      @HiveField(3) required final DateTime deadline,
      @HiveField(4) required final bool done,
      @HiveField(5) required final String color,
      @HiveField(6) required final DateTime createdAt,
      @HiveField(7) required final DateTime changedAt,
      @HiveField(8) required final int deviceId}) = _$_Task;
  _Task._() : super._();

  @override
  @HiveField(0)
  String get text;
  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  TaskImportance get importance;
  @override
  @HiveField(3)
  DateTime get deadline;
  @override
  @HiveField(4)
  bool get done;
  @override
  @HiveField(5)
  String get color;
  @override
  @HiveField(6)
  DateTime get createdAt;
  @override
  @HiveField(7)
  DateTime get changedAt;
  @override
  @HiveField(8)
  int get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
