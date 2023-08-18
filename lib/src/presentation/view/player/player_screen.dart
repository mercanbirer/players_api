import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/player.dart';
import '../../bloc/player/player_bloc.dart';
import '../../bloc/player/player_event.dart';
import '../../bloc/player/player_state.dart';
import '../player_detail/player_details_screen.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late PlayerBloc _playerBloc;
  late List<Player> _resultPlayerList;
  late TextEditingController _textEditingController;
  late bool _notFound;
  late List<Player> _playerList;

  @override
  void initState() {
    _resultPlayerList = [];
    _playerBloc = BlocProvider.of<PlayerBloc>(context);
    _playerBloc.add(const OnPlayerEvent());
    _textEditingController = TextEditingController();
    _notFound = false;
    _playerList = [];

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
          "All Players",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _listPlayer(),
    );
  }

  Widget _listPlayer() {
    return BlocProvider(
      create: (_) => _playerBloc,
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
              return const _Loading();
            } else if (state is PlayerStateLoading) {
              return const _Loading();
            } else if (state is PlayerStateSuccess) {
              _playerList = state.player;
              _resultPlayerList.addAll(state.player);
              if (_resultPlayerList.isEmpty && !_notFound) {
                _resultPlayerList.addAll(_playerList);
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .08,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: _textEditingController,
                        onChanged: (String searchText) {
                          setState(() {
                            _resultPlayerList.clear();
                            _notFound = true;
                            if (searchText.isEmpty) {
                              _resultPlayerList.addAll(_playerList);
                              _notFound = false;
                            } else {
                              for (var element in _playerList) {
                                if (element.firstName!
                                    .toUpperCase()
                                    .contains(searchText.toUpperCase())) {
                                  _notFound = false;
                                  _resultPlayerList.add(element);
                                }
                              }
                            }
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _textEditingController.clear();
                                },
                                icon: const Icon(Icons.clear))),
                      ),
                    ),
                    _notFound
                        ? const Center(
                            child: Text("Aramanıza uygun sonuç bulunamadı."),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * .8,
                            child: ListView.builder(
                              itemCount: _resultPlayerList.length,
                              itemBuilder: (context, index) {
                                final resultPlayer = _resultPlayerList[index];
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: const Icon(Icons.person),
                                    title: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(resultPlayer.firstName!,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(resultPlayer.lastName!,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                        )
                                      ],
                                    ),
                                    trailing:
                                        const Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerDetailsScreen(
                                                  player: resultPlayer),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
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

class _Loading extends StatefulWidget {
  const _Loading();

  @override
  State<_Loading> createState() => _LoadingState();
}

class _LoadingState extends State<_Loading> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
