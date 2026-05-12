import 'package:flutter_riverpod/legacy.dart';

import '../../../core/network/api_clients.dart';
import '../../../data/models/gift_card_model.dart';
import '../../../data/repositories/gift_card_repository.dart';
import '../../../data/sources/remote/gift_card_api_service.dart';

final giftCardProvider =
    StateNotifierProvider<GiftCardViewModel, List<GiftCardModel?>>(
      (ref) => GiftCardViewModel(
        repository: GiftCardRepository(
          remoteSource: GiftCardApiService(apiClient: ApiClient()),
        ),
      ),
    );

class GiftCardViewModel extends StateNotifier<List<GiftCardModel?>> {
  final GiftCardRepository repository;
  GiftCardViewModel({required this.repository}) : super([]);

  Future<void> getGiftCardStatus() async {
    final response = await repository.getGiftCardStatus();
    state = response!;
  }
}
