import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixametory/core/game_urls.dart';
import 'package:pixametory/core/games_list.dart';
import 'package:pixametory/screens/web_view_screen.dart';
import 'package:pixametory/services/providers/game_url_provider.dart';
import 'package:pixametory/widgets/list_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return ListTileWidget(
            onTap: () {
              ref
                  .watch(gameUrlNotifierProvider.notifier)
                  .updateString(url[index]);

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const WebViewScreen();
                },
              ));
            },
            gamename: games[index],
          );
        },
      ),
    );
  }
}
