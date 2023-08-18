import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/player.dart';
import '../../bloc/player_detail/player_detail_bloc.dart';
import '../../bloc/player_detail/player_detail_event.dart';
import '../../bloc/player_detail/player_detail_state.dart';


class PlayerDetailsScreen extends StatefulWidget {
  const PlayerDetailsScreen({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  State createState() => _PlayerDetailsScreenState();
}

class _PlayerDetailsScreenState extends State<PlayerDetailsScreen> {
  late PlayerDetailBloc _playerDetailBloC;

  @override
  void initState() {
    _playerDetailBloC = BlocProvider.of<PlayerDetailBloc>(context);
    _playerDetailBloC.add(const OnPlayerDetailEvent());
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
      child: BlocListener<PlayerDetailBloc, PlayerDetailState>(
        listener: (context, state) {
          if (state is PlayerDetailStateFail) {
            log("Error -> ${state.message}");
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<PlayerDetailBloc, PlayerDetailState>(
          builder: (context, state) {
            if (state is PlayerDetailStateInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PlayerDetailStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PlayerDetailStateSuccess) {
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
            } else if (state is PlayerDetailStateFail) {
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

