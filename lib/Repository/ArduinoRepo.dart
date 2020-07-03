import 'dart:convert';
import 'package:signalr_client/signalr_client.dart';
import 'package:smartautomatedhome/network/apiprovider.dart';
import 'package:smartautomatedhome/models/AllState.dart';

import 'package:logging/logging.dart';
import 'package:signalr_client/signalr_client.dart';

class ArduinoRepo {
  ApiProvider api = new ApiProvider();

  Future<AllState> GetAllStates() async {
    var res = await api.get('HomeSates/GetAllState');
    var jsons = json.decode(res.body);
    var response = AllState.fromJson(jsons);

    return response;
  }

  void changeledstate() {
    api.post('GeneralState/ChangLedState', null);
  }

}
