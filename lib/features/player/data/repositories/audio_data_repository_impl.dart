import 'package:midi_player/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:midi_player/features/player/data/datasources/audio_data_source.dart';
import 'package:midi_player/features/player/domain/repositories/audio_data_repository.dart';

class AudioDataRepositoryImpl extends AudioDataRepository {
  final AudioDataSource _dataSource;

  AudioDataRepositoryImpl(this._dataSource);

  Future<Either<Failure, T>> _handleCalls<T>(Future<T> Function() call) async {
    try {
      final result = await call();

      return Right(result);
    } catch (e) {
      return Left(
        Failure(
          message: 'Something went wrong! $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Duration>>> getReplicDurations(
      {List<String> replicPaths}) {
    return _handleCalls<List<Duration>>(
      () => _dataSource.getReplicDurations(replicPaths: replicPaths),
    );
  }

  @override
  Future<Either<Failure, List<String>>> getReplicsPath({int count}) {
    return _handleCalls<List<String>>(
      () => _dataSource.getReplicsPath(count: count),
    );
  }

  @override
  Future<Either<Failure, List<List<Duration>>>> getTimeCodesFromMidiFile(
      {String midiFilePath}) {
    return _handleCalls<List<List<Duration>>>(
      () => _dataSource.getTimeCodesFromMidiFile(
        midiFilePath: midiFilePath,
      ),
    );
  }

  @override
  Future<Either<Failure, int>> getBitAmount({String midiFilePath}) {
    return _handleCalls<int>(
      () => _dataSource.getBitAmount(
        midiFilePath: midiFilePath,
      ),
    );
  }
}