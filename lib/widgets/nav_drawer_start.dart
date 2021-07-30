import 'package:ep_fv2/controllers/utils/user_credential.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawerStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<UserCredentialController>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(Icons.account_circle, color: Colors.white),
                          ),
                          Obx(() => Text(
                            ctrl.username.value,
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.cloud_upload),
            title: Text('Upload'),
            onTap: () async {
              Get.toNamed("/upload");
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.dashboard),
            title: Text('Setup'),
            onTap: () async {
              Get.toNamed("/setup");
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.update),
            title: Text('Update App Version'),
            onTap: () async {
              Get.toNamed("/updateAppVer");
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign out'),
            onTap: () async {
              XanX.showConfirmDialog(
                title: 'Sign out',
                message: "Are you confirm?",
                btnPositiveText: 'Sign out',
                vcb: () async {
                  ctrl.signOut();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
