import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/models/client.dart';
import 'package:schmersal_poc/ui/base_widget.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';

class ClientCard extends StatelessWidget {
  ClientCard({Key key, this.client}) : super(key: key);
  final Client client;

  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation) {
        return FractionallySizedBox(
          widthFactor: getWidthFactor(sizingInformation.info()),
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: hexToColor('#00377B'), width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            // color: Colors.pink,
            // elevation: 5,
            child: Row(
              //main row
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("images/logos/${client.logo}"),
                          ),
                          Text(
                            this.client.name,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "Client code: ${this.client.clientId}",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "Address: ${this.client.address}",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    //column 2 for image
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage("assets/images/${client.image}.png"),
                        // width: 80,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  getWidthFactor(DeviceScreenType info) {
    switch (info) {
      case DeviceScreenType.Desktop:
        return .33333;
      case DeviceScreenType.Tablet:
        return .5;
      default:
        return 1;
    }
  }
}
