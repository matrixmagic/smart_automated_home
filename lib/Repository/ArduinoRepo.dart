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

  Future<void> shomakan() async {
    print('pressed');
    // final serverUrl = "http://192.168.137.1:8089/eventHub";

// Prints log messages to the console.
// final logger = ConsoleLogger();
// Creates the connection by using the HubConnectionBuilder.
    /*
    final hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
// When the connection is closed, print out a message to the logger.
    print(hubConnection.state);
    hubConnection.start();
    print(hubConnection.state);
    hubConnection.onclose((error) => print(error));

    hubConnection.on("getSate", _handleAClientProvidedFunction);
*/

    Logger.root.level = Level.ALL;
// Writes the log messages to the console
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });

// If you want only to log out the message for the higer level hub protocol:
    final hubProtLogger = Logger("SignalR - hub");
// If youn want to also to log out transport messages:
    final transportProtLogger = Logger("SignalR - transport");

// The location of the SignalR Server.
    final serverUrl = "http://192.168.137.1:8089/eventHub";
    final connectionOptions = HttpConnectionOptions;
    final httpOptions = new HttpConnectionOptions(logger: transportProtLogger);
//final httpOptions = new HttpConnectionOptions(logger: transportProtLogger, transport: HttpTransportType.WebSockets); // default transport type.
//final httpOptions = new HttpConnectionOptions(logger: transportProtLogger, transport: HttpTransportType.ServerSentEvents);
//final httpOptions = new HttpConnectionOptions(logger: transportProtLogger, transport: HttpTransportType.LongPolling);

// If you need to authorize the Hub connection than provide a an async callback function that returns
// the token string (see AccessTokenFactory typdef) and assigned it to the accessTokenFactory parameter:
// final httpOptions = new HttpConnectionOptions( .... accessTokenFactory: () async => await getAccessToken() );

// Creates the connection by using the HubConnectionBuilder.
    final hubConnection = HubConnectionBuilder()
        .withUrl(serverUrl, options: httpOptions)
        .configureLogging(hubProtLogger)
        .build();
    hubConnection.start();
    final result = await hubConnection.invoke("poooo");

    print(result);
// When the connection is closed, print out a message to the console.
    hubConnection.onclose((error) => print("Connection Closed"));
    hubConnection.on("poooo", _handleAClientProvidedFunction);
  }

  void _handleAClientProvidedFunction(List<Object> parameters) {
    print("Server invoked the method hhh");
  }
}
