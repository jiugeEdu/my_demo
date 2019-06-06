import 'package:my_demo/notice/bloc/me_state.dart';
import 'package:my_demo/uiutils/uuid.dart';
import 'dart:math';

class MeStateMgr {
  static final MeStateMgr _singleton = new MeStateMgr._internal();
  factory MeStateMgr() {
    return _singleton;
  }
  MeStateMgr._internal();


  Map < String, Map < String, MeState >> _notice = {};
  Map < String, bool > _onlyId = {};
  Map < String, String > _idName = {};


  void registerNotice( String name, MeState baseUI) {
    Map < String, MeState > tmp = {};

    if (_notice[name] != null) {
      tmp = _notice[name];
    }

    String id = baseUI.getStateId();
    if (tmp[id] != null) {
      print('the notice name haved register, pelase in initState func call "registerNotice"');
      return;
    }

    tmp[id] = baseUI;
    _notice[name] = tmp;
    _idName[id] = name;
  }


  void sendNotice(String name, dynamic data, {
    int dataType,
  }) {
    Map < String, MeState > tmp = _notice[name];
    if (tmp == null) {
      return;
    }

    tmp.forEach((String key, MeState value) {
      value.reveiveNotice(data, dataType: dataType);
    });
  }


  void sendAllNotice(dynamic data) {
    _notice.forEach((String key, Map<String, MeState> value) {
      value.forEach((String k, MeState baseUI) {
        if(baseUI != null) {
          baseUI.reveiveAllNotice(data);
        }
      });
    });
  }


  String generateStateId() {
    int count1 = 0;
    int count2 = 0;
    final kMaxCount = 500;
    String stateId = Uuid().generateV4();

    while (true) {
      if (_onlyId[stateId] != true) break;
      if (count1 == kMaxCount) break;
      stateId = Uuid().generateV4();
      count1++;
    }

    if (count1 == kMaxCount) {
      while (true) {
        stateId = _gererateId();
        if (_onlyId[stateId] != true) break;
        if (count2 == kMaxCount) break;
        count2++;
      }
    }

    if (count2 == kMaxCount) {
      //报错
    }

    _onlyId[stateId] = true;

    return stateId;
  }


  void removeStateId(String stateId) {
    String name = _idName[stateId];
    Map < String, MeState > tmp = _notice[name];
    if (tmp != null) {
      tmp.remove(stateId);
    }

    _onlyId.remove(stateId);
    _idName.remove(stateId);
  }


  void printNotice() {
    print('_notice');
    _notice.forEach((String key, Map<String, MeState> value) {
      print('_notice key:' + key);
      value.forEach((String k, MeState bui) {
        print('        val:' + k);
      });
    });

    print('_onlyId');
    _onlyId.forEach((String key, bool val) {
      print('_notice key:' + key + '  val:' + val.toString());
    });

    print('_idName');
    _idName.forEach((String key, String val) {
      print('_idName key:' + key + '  val:' + val.toString());
    });
  }



  String _gererateId() {
    final kMaxRandom = 5000;
    int time = DateTime.now().millisecondsSinceEpoch - kMaxRandom;
    int random = Random().nextInt(kMaxRandom);
    int resultId = time + random;
    return resultId.toString();
  }



  void testBaseUI() {
  }
}