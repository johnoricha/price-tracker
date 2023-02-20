
import 'package:web_socket_channel/web_socket_channel.dart';

class DerivWebSocketChannel {

  WebSocketChannel getChannel() {
    return WebSocketChannel.connect(
      Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'),
    );


  }


}