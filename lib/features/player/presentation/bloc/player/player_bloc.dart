import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:midi_player/features/player/domain/entities/midi_event.dart';
import 'package:midi_player/features/player/domain/entities/replic.dart';
import 'package:midi_player/features/player/domain/usecases/play.dart';
import 'package:rxdart/rxdart.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final Play _play;

  PlayerBloc(
    this._play,
  );

  @override
  PlayerState get initialState => PlayerInitial();

  @override
  Stream<PlayerState> mapEventToState(
    PlayerEvent event,
  ) async* {
    if (event is PlayE) {
      await _play(
        PlayParams(
          onMidiEvents: event.onMidiEvents,
          songPath: event.songPath,
          volumeMusic: event.volumeMusic,
          player: event.player,
          replics: event.replics,
          volumeReplic: event.volumeReplic,
          replicGap: event.replicGap,
        ),
      );
    }
  }
}
