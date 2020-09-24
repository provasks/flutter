import 'package:flutter/material.dart';
import 'package:schmersal_poc/models/client.dart';
import 'package:schmersal_poc/styles/styles.dart';
import 'package:schmersal_poc/utils/api.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';
import 'package:schmersal_poc/widgets/client_card_list.dart';

class ClientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<List<Client>> clients = fetchClients();
    // if(clients) return;
    // print(clients);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "CLIENTS",
                    style: Styles.clientName.copyWith(
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        color: hexToColor("#00377B"),
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Text("Add Client"),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(left: 10.0),
                      //   child: FlatButton(
                      //     color: Colors.blue,
                      //     textColor: Colors.white,
                      //     onPressed: () {},
                      //     child: Text("Sync"),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            FutureBuilder<List<Client>>(
              future: clients,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return ClientCardList(clients: snapshot.data);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// child: Column(
//   children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         RichText(
//           text: TextSpan(
//             text: "Clients",
//             style: Styles.h1,
//           ),
//         ),
//         Container(
//           child: Row(
//             children: <Widget>[
//               FlatButton(
//                 color: Colors.blue,
//                 textColor: Colors.white,
//                 onPressed: () {},
//                 child: Text("Add Client"),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 10.0),
//                 child: FlatButton(
//                   color: Colors.blue,
//                   textColor: Colors.white,
//                   onPressed: () {},
//                   child: Text("Sync"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     Wrap(
//       children: [
//         FractionallySizedBox(
//           widthFactor: 0.33,
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             color: Colors.pink,
//             elevation: 20,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 ListTile(
//                   title: Text('Heart Shaker',
//                       style: TextStyle(color: Colors.white)),
//                   subtitle: Text('TWICE',
//                       style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   ],
// )),
