import 'package:midi_player/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:midi_player/core/usecase.dart';
import 'package:midi_player/features/player/domain/repositories/midi_repository.dart';

class GetReplicsPath extends UseCase<List<String>, int> {
  final MidiRepository _repository;

  GetReplicsPath(this._repository);

  @override
  Future<Either<Failure, List<String>>> call(int params) {
    return _repository.getReplicsPath(count: params);
  }
}

class NoParams {}
