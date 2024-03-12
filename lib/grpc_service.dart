import 'package:grpc/grpc.dart';
import 'package:kachaka_bgm_while_running/generated/kachaka-api.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';

class GrpcService {
  late KachakaApiClient _client;
  Int64 getCommandStateCursor = Int64.ZERO;

  GrpcService() {
    final channel = ClientChannel(
      '192.168.0.10',
      port: 26400,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    _client = KachakaApiClient(channel);
  }

  Future<CommandState> getCommandState() async {
    final response = await _client.getCommandState(
      GetRequest(metadata: Metadata()..cursor = getCommandStateCursor),
    );
    getCommandStateCursor = response.metadata.cursor;
    return response.state;
  }
}
