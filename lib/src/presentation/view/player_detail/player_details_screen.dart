import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/presentation/bloc/player_detail/player_detail_bloc.dart';
import 'package:player/src/presentation/bloc/player_detail/player_detail_state.dart';
import '../../../data/models/player.dart';
import '../../bloc/player/player_state.dart';


class PlayerDetailsScreen extends StatefulWidget {
  const PlayerDetailsScreen({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  State createState() => _PlayerDetailsScreenState();
}

class _PlayerDetailsScreenState extends State<PlayerDetailsScreen> {

  @override
  void initState() {
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
    return Center(
      child: BlocBuilder<PlayerDetailsBloc, PlayerDetailState>(
        builder: (context, state) {
          if (state is PlayerDetailStateLoading) {
            return const CircularProgressIndicator();
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
                Text('Full Name: ${widget.player.firstName} ${widget.player.lastName}'),
              ],
            );
          } else if (state is PlayerDetailStateFail) {
            log("Error -> ${state.message}");
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is PlayerStateInitial) {
            return const Text('Initial');
          }
          return Container();
        },
      ),
    );
  }
}

