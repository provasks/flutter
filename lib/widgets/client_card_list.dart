import 'package:flutter/material.dart';
import 'package:schmersal_poc/models/client.dart';
import 'package:schmersal_poc/widgets/client_card.dart';

class ClientCardList extends StatelessWidget {
  final List<Client> clients;

  ClientCardList({Key key, this.clients});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: getCards(clients),
    );
    // return ListView.builder(
    //   itemCount: clients.length,
    //   itemBuilder: (context, index) {
    //     return GestureDetector(
    //       child: Wrap(
    //         children: getCards(clients),
    //         // children: [
    //         //   ClientCard(client: clients[index]),

    //         // ],
    //       ),

    //     );
    //   },
    // );
  }

  List<Widget> getCards(List<Client> clients) {
    var cards = List<Widget>();
    for (var client in clients) {
      cards.add(ClientCard(client: client));
    }
    return cards;
  }
}
