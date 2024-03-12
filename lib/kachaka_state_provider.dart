import 'package:flutter/material.dart';
import 'package:kachaka_bgm_while_running/grpc_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kachaka_bgm_while_running/generated/kachaka-api.pb.dart';

class KachakaStateProvider with ChangeNotifier {
  final GrpcService _grpcService = GrpcService();

  KachakaStateProvider() {
    _checkCommandStateContinuously();
  }

  void _checkCommandStateContinuously() async {
    AudioPlayer audioPlayer = AudioPlayer();
    while (true) {
      try {
        final commandState = await _grpcService.getCommandState();
        if (commandState == CommandState.COMMAND_STATE_RUNNING) {
          debugPrint("Start playing music.");
          await audioPlayer.play(AssetSource("happy_birthday.mp3"));
        } else {
          debugPrint("Stop playing music.");
          await audioPlayer.stop();
        }

        notifyListeners();
      } catch (e) {
        debugPrint('Error fetching command state: $e');
      }
    }
  }
}
