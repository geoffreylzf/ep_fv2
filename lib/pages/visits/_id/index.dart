import 'package:ep_fv2/controllers/visit/_id/index.dart';
import 'package:ep_fv2/db/dao/bro_fa2_visit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdIndexPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdIndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Visit'),
        actions: [
          StreamBuilder<BroFa2VisitWithData>(
              stream: ctrl.streamVisit,
              builder: (context, snapshot) {
                final doc = snapshot.data;
                if (doc == null || doc.broFa2Visit.isDelete || doc.broFa2Visit.isUpload) {
                  return Container();
                }
                return IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => ctrl.softDelete(),
                );
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            StreamBuilder<BroFa2VisitWithData>(
                stream: ctrl.streamVisit,
                builder: (context, snapshot) {
                  final doc = snapshot.data;
                  if (doc == null || !doc.broFa2Visit.isDelete) {
                    return Container();
                  }
                  return Positioned.fill(
                    child: Opacity(
                      opacity: 0.1,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 400,
                      ),
                    ),
                  );
                }),
            ListView(
              shrinkWrap: true,
              children: [
                Header(),
                Container(height: 24),
                ModuleBtnList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final ctrl = Get.find<VisitIdIndexController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BroFa2VisitWithData>(
      stream: ctrl.streamVisit,
      builder: (context, snapshot) {
        final visit = snapshot.data;
        if (visit == null) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${visit.companyCode} ~ ${visit.companyName}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        "${visit.locationCode} ~ ${visit.locationName} ",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.home),
                    Container(width: 8),
                    Text(
                      "${visit.houseNoList.join(", ")}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.today_outlined),
                    Container(width: 8),
                    Text(
                      "Day " + visit.broFa2Visit.age.toString(),
                    ),
                  ],
                ),
                Text(
                  visit.broFa2Visit.timestamp,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            if (visit.broFa2Visit.isUpload) Icon(Icons.cloud_upload),
          ],
        );
      },
    );
  }
}

class ModuleBtnList extends StatelessWidget {
  final ctrl = Get.find<VisitIdIndexController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BroFa2VisitWithData>(
      stream: ctrl.streamVisit,
      builder: (context, snapshot) {
        final visit = snapshot.data;
        bool isEditable = false;
        if (visit != null) {
          if (visit.broFa2Visit.isUpload || visit.broFa2Visit.isDelete) {
            isEditable = false;
          } else {
            isEditable = true;
          }
        }

        Map<String, VoidCallback> moduleList = {
          "Flock Observation": () => ctrl.openFlockObservation(),
          "Post Mortem": () => ctrl.openPostMortem(),
          "DOC Objective": () => ctrl.openDocObservation(),
          "Pasgar Score": () => ctrl.openPasgar(),
          "Management Audit": () => ctrl.openManagementAudit(),
          "Weight": () => ctrl.openWeight(),
        };
        final btnList = <Widget>[];
        moduleList.forEach((key, value) {
          btnList.add(ElevatedButton(
            child: Text(
              key,
              style: TextStyle(fontSize: 16),
            ),
            onPressed: isEditable ? value : null,
          ));
        });

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisExtent: 120,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),

          itemCount: btnList.length,
          itemBuilder: (ctx, idx) {
            return btnList[idx];
          },
        );
      },
    );
  }
}
