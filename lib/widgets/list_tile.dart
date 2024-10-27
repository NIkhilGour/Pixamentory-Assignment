import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key, required this.gamename, required this.onTap});
  final String gamename;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: const Color.fromARGB(39, 158, 158, 158),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: Text(
          gamename,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        trailing: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green)),
            onPressed: () {
              onTap();
            },
            child: const Text(
              "play",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
