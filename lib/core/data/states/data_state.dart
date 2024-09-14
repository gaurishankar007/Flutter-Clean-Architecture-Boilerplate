import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'data_error_type.dart';
part 'failure_state.dart';
part 'success_state.dart';
part 'loading_state.dart';

/// Stores the data received from the api.
/// Also receives error if error is occurs in the path way.
@immutable
sealed class DataState<T> extends Equatable {
  final T? data;
  final String? error;
  final DataErrorType? errorType;

  const DataState({
    this.data,
    this.error,
    this.errorType,
  });

  @override
  List<Object?> get props => [
        data,
        error,
        errorType,
      ];
}