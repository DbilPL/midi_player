import 'package:flutter/material.dart';
import 'package:midi_player/features/player/domain/entities/replic.dart';

class ReplicModel extends Replic {
  final String replicPath;
  final Duration timeBefore;
  final Duration timeAfter;

  const ReplicModel(
      {@required this.replicPath,
      @required this.timeBefore,
      @required this.timeAfter})
      : super(
            replicPath: replicPath,
            timeBefore: timeBefore,
            timeAfter: timeAfter);
}
