import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:external_path/external_path.dart';
import 'package:uuid/uuid.dart';
import 'package:permission_handler/permission_handler.dart';
class DownloadingDialog extends StatefulWidget {

String repo_name='';
DownloadingDialog({Key? key,String repo_name=''}){
  this.repo_name=repo_name;
}
  
  @override
  _DownloadingDialogState createState() => _DownloadingDialogState(repo_name: repo_name);
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;
  String ?_repo_name;

_DownloadingDialogState({@required String repo_name=''}){
  this._repo_name=repo_name;
  
}


  @override
  void initState() {
    super.initState();
   
    startDownloading(_repo_name!);
  }
  Future permission()async{
    var permission=await Permission.storage.request().isGranted;
    return permission;
  }
    @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/loading.gif',
            width: 400,
          ),
          //const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  void startDownloading(String repo_name) async {
    
    //ejemplo de consulta
    //"https://raw.githubusercontent.com/Tesis-ULT/Ficha-de-Estudiantes/main/Ficha-de-Estudiantes.pdf"
   String url= 'https://raw.githubusercontent.com/Tesis-ULT/$repo_name/main/$repo_name.pdf';
    String path = await _getFilePath(repo_name);
    
    var permission=await Permission.storage.request();
    if(permission.isGranted){
      await dio.download(
      url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });
      },
      deleteOnError: true,
    ).then((_) {
      Navigator.pop(context);
    });
    }
  }

  Future<String> _getFilePath(String filename) async {
    //final dir = await getApplicationDocumentsDirectory();
    String dir = await await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    var uuid = Uuid();
    return "$dir/$filename-"+uuid.v4()+".pdf";
  }


}
