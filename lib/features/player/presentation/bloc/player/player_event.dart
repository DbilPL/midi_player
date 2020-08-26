part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
}

class PlayE extends PlayerEvent {
  final BehaviorSubject<double> volumeMusic;
  final BehaviorSubject<double> volumeReplic;
  final BehaviorSubject<int> replicGap;
  final BehaviorSubject<bool> player;
  final List<Replic> replics;
  final String songPath;
  final Stream<MidiEventEntity> onMidiEvents;

  const PlayE({
    this.volumeMusic,
    this.volumeReplic,
    this.replicGap,
    this.replics,
    this.songPath,
    this.player,
    this.onMidiEvents,
  });

  @override
  List<Object> get props => [
        volumeMusic,
        volumeReplic,
        replicGap,
        replics,
        songPath,
        player,
      ];
}
