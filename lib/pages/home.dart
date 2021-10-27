import 'package:ep_fv2/controllers/home.dart';
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
          Expanded(child: LeftPanel()),
          VerticalDivider(width: 0),
          Expanded(child: RightPanel()),
        ],
      ),
    );
  }
}

class LeftPanel extends StatelessWidget {
  final ctrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: FormItemTitle("Pending Upload"),
          ),
          Obx(() => Text(
                ctrl.rxNotYetUploadCount.toString(),
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              )),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(child: Text("UPLOAD"), onPressed: () => ctrl.openUpload()),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Refresh Setup Location\n",
                    style: TextStyle(fontSize: 11),
                    children: [
                      TextSpan(
                          text: "(Press this when you cannot see location name)",
                          style: TextStyle(fontSize: 9)),
                    ]),
              ),
              onPressed: () => ctrl.refreshSetupLocation(),
            ).paddingSymmetric(vertical: 8, horizontal: 4),
          ),
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
          Obx(() {
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
                                          "Schedule Day " +
                                              (visit.broFa2Visit.scheduleDay ?? '-').toString() +
                                              " Age " +
                                              visit.broFa2Visit.age.toString(),
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
                              if (visit.broFa2Visit.isUpload) Icon(Icons.cloud_upload, size: 14),
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
