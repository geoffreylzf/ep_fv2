import 'package:ep_fv2/controllers/visit/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIndexPage extends StatelessWidget {
  final ctrl = Get.put(VisitIndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Farm Visit Listing')),
      body: Obx(() {
        final list = ctrl.rxBroFa2VisitWithDataList.value;
        if (list.length == 0) {
          return Center(child: Text("No record"));
        }
        return ListView.separated(
          shrinkWrap: true,
          itemCount: list.length,
          separatorBuilder: (_, index) => Divider(height: 0),
          itemBuilder: (_, idx) {
            final visit = list[idx];
            return Stack(
              children: [
                if (visit.broFa2Visit.isDelete)
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.2,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 64,
                      ),
                    ),
                  ),
                InkWell(
                  onTap: () {
                    ctrl.openVisit(visit);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.business, size: 14),
                                Text(" ${visit.companyCode} ~ ${visit.companyName} "),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 14),
                                Text(" ${visit.locationCode} ~ ${visit.locationName} "),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.home, size: 14),
                                Text(
                                  visit.houseNoList.join(", "),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text("Day ${visit.broFa2Visit.age}"),
                            Text(
                              visit.broFa2Visit.timestamp,
                              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                            ),
                          ],
                        ),
                        if (visit.broFa2Visit.isUpload) Icon(Icons.cloud_upload),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      }),
    );
  }
}
