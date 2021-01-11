import 'package:flutter/material.dart';

class MeasurementInfoOnJobDetailsScreen extends StatelessWidget {
  final String shoulder;
  final String chest;
  final String bust;
  final String bustSpan;
  final String waist;
  final String band;
  final String hips;
  final String shoulderN;
  final String shoulderU;
  final String halfL;
  final String blouseL;
  final String skirtL;
  final String gownL;
  final String sleeve;
  final String armH;
  final String thighCirc;
  final String kneeCirc;
  final String bandKnee;
  final String soleCirc;
  final String bandSole;
  final String placeholder1;
  final String placeholder2;
  final String placeholder3;
  final String placeholder4;
  final String placeholder5;
  final String placeholder6;
  final String placeholder7;
  final String placeholder8;
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String value5;
  final String value6;
  final String value7;
  final String value8;

  MeasurementInfoOnJobDetailsScreen(
    this.shoulder,
    this.chest,
    this.bust,
    this.bustSpan,
    this.band,
    this.waist,
    this.hips,
    this.shoulderN,
    this.shoulderU,
    this.halfL,
    this.blouseL,
    this.skirtL,
    this.gownL,
    this.sleeve,
    this.armH,
    this.thighCirc,
    this.kneeCirc,
    this.bandKnee,
    this.soleCirc,
    this.bandSole,
    this.placeholder1,
    this.value1,
    this.placeholder2,
    this.value2,
    this.placeholder3,
    this.value3,
    this.placeholder4,
    this.value4,
    this.placeholder5,
    this.value5,
    this.placeholder6,
    this.value6,
    this.placeholder7,
    this.value7,
    this.placeholder8,
    this.value8,
  );

  DataRow _buildDataRow(String measurement1, String value1, String measurement2,
      String value2, bool selectedValue) {
    return DataRow(
      selected: selectedValue,
      cells: [
        DataCell(
          Text(
            measurement1 == null ? 'measurement' : measurement1,
          ),
          // placeholder: true,
          // showEditIcon: true,
        ),
        DataCell(
          Text(value1 == null ? 'nill' : value1),
          // placeholder: true,
          // showEditIcon: true,
        ),
        DataCell(
          Text(measurement2 == null ? 'measurement' : measurement2),
          // placeholder: true,
          // showEditIcon: true,
        ),
        DataCell(
          Text(value2 == null ? 'nill' : value2),
          // placeholder: true,
          // showEditIcon: true,
        ),
      ],
    );
  }

  Widget _renderLineDetails(
    BuildContext context,
    String text1,
    String text2,
    Widget icontype,
  ) {
    return Container(
      width: double.infinity,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Icon(
          //   Icons.person,
          //   size: 10,
          // ),
          icontype,
          FittedBox(
            child: Text(
              text1 == null ? 'Nill' : text1,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FittedBox(
            child: Text(
              text2 == null ? 'Nill' : text2,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  DataColumn _renderTableHeading(String value) {
    return DataColumn(
      label: Text(
        value == null ? 'Nill' : value,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: 'QuickSand',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.5,
          child: SingleChildScrollView(
            // height: 300,
            // color: Theme.of(context).primaryColor,

            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // Card(
                    //   child:
                    FittedBox(
                      child:
                          //     // height: 200,

                          //     // width: 150,
                          //     child:
                          DataTable(
                        // sortColumnIndex: 0,
                        sortAscending: true,
                        columns: [
                          _renderTableHeading('Measurement'),
                          _renderTableHeading('Value'),
                          _renderTableHeading('Measurement'),
                          _renderTableHeading('Value'),
                        ],
                        rows: [
                          _buildDataRow(
                            'Shoulder :',
                            shoulder.toString(),
                            'Chest :',
                            chest.toString(),
                            true,
                          ),
                          _buildDataRow(
                            'Bust : ',
                            bust.toString(),
                            'Bust - Span : ',
                            bustSpan.toString(),
                            false,
                          ),
                          _buildDataRow(
                            'Waist : ',
                            waist.toString(),
                            'Band : ',
                            band.toString(),
                            true,
                          ),
                          _buildDataRow(
                            'Hips : ',
                            hips.toString(),
                            'Shoulder-Nipple :',
                            shoulderN.toString(),
                            false,
                          ),
                          _buildDataRow(
                            'Shoulder - Underbust : ',
                            shoulderU.toString(),
                            'Half  Length :',
                            halfL.toString(),
                            true,
                          ),
                          _buildDataRow(
                            'Blouse  Length : ',
                            blouseL.toString(),
                            'Skirt  Length :',
                            skirtL.toString(),
                            false,
                          ),
                          _buildDataRow(
                            'Gown  Length : ',
                            gownL.toString(),
                            'Sleeve :',
                            sleeve.toString(),
                            true,
                          ),
                          _buildDataRow(
                            'Arm Hole : ',
                            armH.toString(),
                            'Thigh Circumference :',
                            thighCirc.toString(),
                            false,
                          ),
                          _buildDataRow(
                            'Knee Circumference : ',
                            kneeCirc.toString(),
                            'Band Knee :',
                            bandKnee.toString(),
                            true,
                          ),
                          _buildDataRow(
                            'Sole Circumference : ',
                            soleCirc.toString(),
                            'Band Sole :',
                            bandSole.toString(),
                            false,
                          ),
                          _buildDataRow(
                            placeholder1,
                            value1.toString(),
                            placeholder2,
                            value2.toString(),
                            true,
                          ),
                          _buildDataRow(
                            placeholder3,
                            value2.toString(),
                            placeholder4,
                            value4.toString(),
                            false,
                          ),
                          _buildDataRow(
                            placeholder5,
                            value5.toString(),
                            placeholder6,
                            value6.toString(),
                            true,
                          ),
                          _buildDataRow(
                            placeholder7,
                            value7.toString(),
                            placeholder8,
                            value8.toString(),
                            false,
                          ),
                        ],
                      ),
                      // ),
                    ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
    // Container(
    //   width: double.infinity,
    //   height: 230,
    //   padding: EdgeInsets.symmetric(
    //     vertical: 2,
    //   ),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Flexible(
    //         flex: 2,
    //         child: Container(
    //           width: double.infinity,
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 3,
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '1.  ' + 'Shoulder :',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(227, 25, 13, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       shoulder == null ? 'nill' : shoulder.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(227, 25, 13, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '2.  ' + 'Chest : ',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(118, 245, 15, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       chest == null ? 'nill' : chest.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(118, 245, 15, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '3.  ' + 'Bust : ',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(28, 235, 186, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       bust == null ? 'nill' : bust.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(28, 235, 186, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '4.  ' + 'Bust Span : ',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(13, 26, 212, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       bustSpan == null ? 'nill' : bustSpan.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(13, 26, 212, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '5.  ' + 'Waist : ',
    //                       style: TextStyle(
    //                           color: Color.fromRGBO(251, 13, 255, 1),
    //                           fontWeight: FontWeight.w700),
    //                     ),
    //                     Text(
    //                       waist == null ? 'nill' : waist.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(251, 13, 255, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '6.  ' + 'Band : ',
    //                       style: TextStyle(
    //                           color: Color.fromRGBO(255, 5, 76, 1),
    //                           fontWeight: FontWeight.w700),
    //                     ),
    //                     Text(
    //                       band == null ? 'nill' : band.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(255, 5, 76, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '7.  ' + 'Hips :',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(160, 11, 224, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       hips == null ? 'nill' : hips.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(160, 11, 224, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Flexible(
    //         flex: 3,
    //         child: Container(
    //           width: double.infinity,
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 3,
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '8.  ' + 'Shoulder Nipple :',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(227, 25, 13, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       shoulderN == null ? 'nill' : shoulderN.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(227, 25, 13, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '9.  ' + 'Shoulder Underbust : ',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(118, 245, 15, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       shoulderU == null ? 'nill' : shoulderU.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(118, 245, 15, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '10.  ' + 'Thigh Circ. : ',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(28, 235, 186, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       thighCirc == null ? 'nill' : thighCirc.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(28, 235, 186, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '11.  ' + 'Blouse Length : ',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(13, 26, 212, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       blouseL == null ? 'nill' : blouseL.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(13, 26, 212, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '12.  ' + 'Skirt Length : ',
    //                       style: TextStyle(
    //                           color: Color.fromRGBO(251, 13, 255, 1),
    //                           fontWeight: FontWeight.w700),
    //                     ),
    //                     Text(
    //                       skirtL == null ? 'nill' : skirtL.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(251, 13, 255, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '13.  ' + 'Gown Length : ',
    //                       style: TextStyle(
    //                           color: Color.fromRGBO(255, 5, 76, 1),
    //                           fontWeight: FontWeight.w700),
    //                     ),
    //                     Text(
    //                       gownL == null ? 'nill' : gownL.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(255, 5, 76, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               FittedBox(
    //                 child: Row(
    //                   children: <Widget>[
    //                     const Text(
    //                       '14.  ' + 'Band Sole :',
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(160, 11, 224, 1),
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     Text(
    //                       bandSole == null ? 'nill' : bandSole.toString(),
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Color.fromRGBO(160, 11, 224, 1),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Divider(
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Flexible(
    //         flex: 2,
    //         child: Container(
    //             width: double.infinity,
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 3,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Divider(
    //                   color: Theme.of(context).primaryColor,
    //                 ),
    //                 FittedBox(
    //                   child: Row(
    //                     children: <Widget>[
    //                       const Text(
    //                         '15.  ' + 'Arm Hole :',
    //                         style: TextStyle(
    //                           color: Color.fromRGBO(227, 25, 13, 1),
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Text(
    //                         armH == null ? 'nill' : armH.toString(),
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           color: Color.fromRGBO(227, 25, 13, 1),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Divider(
    //                   color: Theme.of(context).primaryColor,
    //                 ),
    //                 FittedBox(
    //                   child: Row(
    //                     children: <Widget>[
    //                       const Text(
    //                         '16.  ' + 'Half L. : ',
    //                         style: TextStyle(
    //                           color: Color.fromRGBO(118, 245, 15, 1),
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Text(
    //                         halfL == null ? 'nill' : halfL.toString(),
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           color: Color.fromRGBO(118, 245, 15, 1),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Divider(
    //                   color: Theme.of(context).primaryColor,
    //                 ),
    //                 FittedBox(
    //                   child: Row(
    //                     children: <Widget>[
    //                       const Text(
    //                         '17.  ' + 'Knee C. : ',
    //                         style: TextStyle(
    //                           color: Color.fromRGBO(28, 235, 186, 1),
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Text(
    //                         kneeCirc == null ? 'nill' : kneeCirc.toString(),
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           color: Color.fromRGBO(28, 235, 186, 1),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Divider(
    //                   color: Theme.of(context).primaryColor,
    //                 ),
    //                 FittedBox(
    //                   child: Row(
    //                     children: <Widget>[
    //                       const Text(
    //                         '18.  ' + 'Band K. : ',
    //                         style: TextStyle(
    //                           color: Color.fromRGBO(13, 26, 212, 1),
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Text(
    //                         bandKnee == null ? 'nill' : bandKnee.toString(),
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           color: Color.fromRGBO(13, 26, 212, 1),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Divider(
    //                   color: Theme.of(context).primaryColor,
    //                 ),
    //                 FittedBox(
    //                   child: Row(
    //                     children: <Widget>[
    //                       const Text(
    //                         '19.  ' + 'Sole C. : ',
    //                         style: TextStyle(
    //                             color: Color.fromRGBO(251, 13, 255, 1),
    //                             fontWeight: FontWeight.w700),
    //                       ),
    //                       Text(
    //                         soleCirc == null ? 'nill' : soleCirc.toString(),
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           color: Color.fromRGBO(251, 13, 255, 1),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Divider(
    //                   color: Theme.of(context).primaryColor,
    //                 ),
    //                 FittedBox(
    //                   child: Row(
    //                     children: <Widget>[
    //                       const Text(
    //                         '20.  ' + 'Sleeve : ',
    //                         style: TextStyle(
    //                             color: Color.fromRGBO(255, 5, 76, 1),
    //                             fontWeight: FontWeight.w700),
    //                       ),
    //                       Text(
    //                         sleeve == null ? 'nill' : sleeve.toString(),
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           color: Color.fromRGBO(255, 5, 76, 1),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Divider(
    //                   color: Theme.of(context).primaryColor,
    //                 ),
    //               ],
    //             )),
    //       ),
    //     ],
    //   ),
    // );
  }
}
