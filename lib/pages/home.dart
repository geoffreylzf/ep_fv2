import 'package:ep_fv2/controllers/home.dart';
import 'package:ep_fv2/db/dao/bro_fa2_visit.dart';
import 'package:ep_fv2/widgets/form.dart';
import 'package:ep_fv2/widgets/nav_drawer_start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: NavDrawerStart(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/visits/create/"),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Row(
        children: [
          Expanded(child: Text("asasas")),
          VerticalDivider(width: 0),
          Expanded(child: RightPanel()),
        ],
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  final ctrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormItemTitle("Recent Farm Visit"),
          StreamBuilder<List<BroFa2VisitWithData>>(
              stream: ctrl.faDocRecentStream,
              initialData: [],
              builder: (_, snapshot) {
                final list = snapshot.data;
                if (list == null || list.length == 0) {
                  return Center(child: Text("No record"));
                }

                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: list.length,
                    separatorBuilder: (_, index) => Divider(height: 0),
                    itemBuilder: (_, idx) {
                      final visit = list[idx];
                      return InkWell(
                        onTap: () {
                          ctrl.openVisit(visit);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Stack(
                            children: [
                              if (visit.broFa2Visit.isDelete)
                                Positioned.fill(
                                  child: Opacity(
                                    opacity: 0.1,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 48,
                                    ),
                                  ),
                                ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.location_on, size: 14),
                                            Container(width: 4),
                                            Flexible(
                                                fit: FlexFit.loose,
                                                child: Text(
                                                  "${visit.locationName}",
                                                  overflow: TextOverflow.clip,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.home, size: 12),
                                            Container(width: 4),
                                            Text(
                                              visit.houseNoList.join(", "),
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.today_outlined, size: 12),
                                            Container(width: 4),
                                            Text(
                                              "Day " + visit.broFa2Visit.age.toString(),
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          visit.broFa2Visit.timestamp,
                                          style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (visit.broFa2Visit.isUpload)
                                    Icon(Icons.cloud_upload, size: 14),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("ALL VISIT"),
              onPressed: () {
                Get.toNamed("/visits");
              },
            ),
          )
        ],
      ),
    );
  }
}
