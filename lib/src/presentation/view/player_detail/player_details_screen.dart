import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/presentation/bloc/player/player_event.dart';
import 'package:player/src/presentation/bloc/player/player_state.dart';
import '../../../data/models/player.dart';
import '../../bloc/player/player_bloc.dart';


class PlayerDetailsScreen extends StatefulWidget {
  const PlayerDetailsScreen({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  State createState() => _PlayerDetailsScreenState();
}

class _PlayerDetailsScreenState extends State<PlayerDetailsScreen> {
  late PlayerBloc _playerDetailBloC;

  @override
  void initState() {
    _playerDetailBloC = BlocProvider.of<PlayerBloc>(context);
    _playerDetailBloC.add(const OnPlayerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color red = Color(0xFF760707);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        elevation: 0,
        title: const Text(
          "Player Detail",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: detailPage(),
    );
  }

  Widget detailPage() {
    return BlocProvider(
      create: (_) => _playerDetailBloC,
      child: BlocListener<PlayerBloc, PlayerState>(
        listener: (context, state) {
          if (state is PlayerStateFail) {
            log("Error -> ${state.message}");
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            if (state is PlayerStateInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PlayerStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PlayerStateSuccess) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/image.png'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(widget.player.id.toString())
                ],
              );
            } else if (state is PlayerStateFail) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

