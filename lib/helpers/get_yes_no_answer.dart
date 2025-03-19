import 'package:toxica_2/domain/entities/message.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  Future<Message> GetAnswer() async {
    final _dio = Dio(BaseOptions(baseUrl:'https://yesno.wtf'));
    final response = await _dio.get('api');
    print(response.data);
    return Message(
      text: 'hola', 
      fromWho: FromWho.hers,
      imageUrl: 'https://yesno.wtf/assets/no/8-5e08abbe5aacd2cf531948145b787e9a.gif'
      );
  }
}