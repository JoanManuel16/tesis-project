import 'package:flutter/material.dart';
import 'package:flutter_application_14/class/models/downloadModel.dart';
import 'package:flutter_application_14/class/models/tesisModel.dart';
import 'package:flutter_application_14/class/widgets/downloading_dialog.dart';
import 'package:flutter_application_14/class/widgets/gradient.dart';
import 'package:flutter_application_14/class/widgets/tesis_data.dart';

class tesisInformation extends StatelessWidget {
  const tesisInformation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TesisModel? tesis =
        ModalRoute.of(context)!.settings.arguments as TesisModel?;

    return Scaffold(
      appBar: AppBar(title: Text(tesis!.name)),
      body: Stack(
        children: [Gradiente(), TesisData(tesis)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>  DownloadingDialog(repo_name: tesis.name),
          );

        },
        child: Icon(Icons.download_for_offline_sharp),
      ),
    );
  }


  Widget downloadProcess(String name){
    return DownloadingDialog();
  }
}
