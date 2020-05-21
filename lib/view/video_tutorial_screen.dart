import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//"KTTguFrsioY";




class VideoTutorialScreen extends StatefulWidget {
  @override
  _VideoTutorialScreenState createState() => _VideoTutorialScreenState();
}

class _VideoTutorialScreenState extends State<VideoTutorialScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'KTTguFrsioY',

  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Tutorial"),
        backgroundColor: Color.fromRGBO(72, 103, 27, 1.0),
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("lib/view/assets/troca/fundo.png"), fit: BoxFit.cover,),
            ),
          ),

          ListView(
            children: [
              Container(height: 50,),
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                topActions: <Widget>[
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      _controller.metadata.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25.0,
                    ),
                    onPressed: () {
                      //_showSnackBar('Settings Tapped!');
                    },
                  ),
                ],
                onReady: () {
                  _isPlayerReady = true;
                },
                onEnded: (data) {
                  Navigator.of(context).pop();

                },
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


                        IconButton(
                          icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                          color: Colors.white,
                          onPressed: _isPlayerReady
                              ? () {
                            _muted
                                ? _controller.unMute()
                                : _controller.mute();
                            setState(() {
                              _muted = !_muted;
                            });
                          }
                              : null,
                        ),
                        IconButton(
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                          color: Colors.white,
                          onPressed: _isPlayerReady
                              ? () {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                            setState(() {});
                          }
                              : null,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.aspect_ratio
                          ),
                          color: Colors.white,
                          onPressed: _controller.value.isPlaying

                            ? () {
                            _controller.toggleFullScreenMode();
                          }
                              : null,
                        ),




                      ],
                    ),
                    _space,
//                    AnimatedContainer(
//                      duration: Duration(milliseconds: 800),
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(20.0),
//                        color: _getStateColor(_playerState),
//                      ),
//                      padding: EdgeInsets.all(8.0),
//                      child: Text(
//                        _playerState.toString(),
//                        style: TextStyle(
//                          fontWeight: FontWeight.w300,
//                          color: Colors.white,
//                        ),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700];
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900];
      default:
        return Colors.blue;
    }
  }

  Widget get _space => SizedBox(height: 10);


}


