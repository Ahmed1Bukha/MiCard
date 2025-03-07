import 'package:business_card/src/models_classes/cloud_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  saveInfo(List<String> infos) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('info', infos);
  }

  getInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('info');
    return items;
  }

  getIds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String>? ids = prefs.getStringList('cardsIDs');
    if (ids != null) {
      return ids;
    } else {
      return [];
    }
  }

  signOutPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('info');
  }

  addScannedCard(String? info) async {
    await ColudStore().addScannedCardID(info.toString());
    print(info);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? ids = prefs.getStringList('cardsIDs');

    if (ids == null) {
      await prefs.setStringList(
        'cardsIDs',
        <String>[info.toString()],
      );
    } else {
      ids.add(info.toString());
      var distinctIds = ids.toSet().toList();

      await prefs.setStringList(
        'cardsIDs',
        distinctIds,
      );
    }
  }
}
