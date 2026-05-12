import '../models/gift_card_model.dart';
import '../sources/remote/gift_card_api_service.dart';

class GiftCardRepository {
  final GiftCardApiService remoteSource;
  GiftCardRepository({required this.remoteSource});

  Future<List<GiftCardModel>?> getGiftCardStatus() async {
    return await remoteSource.getGiftCardStatus();
  }
}
