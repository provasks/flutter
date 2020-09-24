import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/models/client.dart';
import 'package:schmersal_poc/styles/styles.dart';
import 'package:schmersal_poc/ui/base_widget.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
              side: BorderSide(
                color: hexToColor('#00377B'),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            // color: Colors.pink,
            // elevation: 5,
            child: Row(
              //main row
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    //column 2 for image
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage("${config.imagePath}/${client.image}"),

                        // width: 100,
                        // height: 200,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 2, 0, 10),
                            child: Image(
                              image: AssetImage(
                                  "${config.imagePath}/logos/${client.logo}"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 4, 5),
                            child: Text(
                              this.client.customerName,
                              style: Styles.clientName,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 72,
                                  child: Text(
                                    "Client Code:",
                                    style: Styles.label,
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    this.client.customerCode,
                                    style: Styles.value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 72,
                                  child: Text(
                                    "Address:",
                                    style: Styles.label,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  child: Text(
                                    this.client.customerAddress,
                                    style: Styles.value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 72,
                                  child: Text(
                                    "Contact:",
                                    style: Styles.label,
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    this.client.contact,
                                    style: Styles.value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 72,
                                  child: Text(
                                    "Location:",
                                    style: Styles.label,
                                  ),
                                ),
                                SizedBox(
                                  child: GestureDetector(
                                    onTap: () => openLocation(this
                                        .client
                                        .location), // handle your image tap here
                                    child: Image.asset(
                                      '${config.imagePath}/icons/Map.png',
                                      // fit: BoxFit
                                      //     .cover, // this is the solution for border
                                      width: 32.0,
                                      height: 26.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
        return 1.0;
    }
  }

  openLocation(url) async {
    // url = this.client.location
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
