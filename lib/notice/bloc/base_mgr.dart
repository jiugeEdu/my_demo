
class BaseMgr {
  static final BaseMgr _singleton = new BaseMgr._internal();
  factory BaseMgr() {
    return _singleton;
  }
  BaseMgr._internal();



}