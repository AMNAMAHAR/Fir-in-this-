
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voice_message_package/voice_message_package.dart';



class AudioPlay extends StatefulWidget {
  File audioPath;
  AudioPlay(this.audioPath);

  @override
  State<AudioPlay> createState() => _AudioPlayState();
}

class _AudioPlayState extends State<AudioPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:VoiceMessage(
        audioSrc: 'YOUR_AUDIO_URL',
        played: false, // To show played badge or not.
        me: true, // Set message side.
        onPlay: () {}, // Do something when voice played.
      ),
      ) );
  }
}
