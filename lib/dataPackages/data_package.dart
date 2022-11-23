

enum DataPackageType {
  requestEnums,
  enumPackage,
  iobStateChanged,
  iobStateChangeRequest,
  enumUpdateRequest,
  enumUpdate,
  subscribeToDataPoints,
  firstPingFromIob,
  firstPingFromIob2,
  subscribeHistory,
  historyDataUpdate,
  requestLogin,
  answerLogin,
  loginDeclined,
  loginApproved,
  loginKey,

}

class DataPackage {
  DataPackageType type;
  Map<String, dynamic> content;

  DataPackage({required this.type, required this.content});
}

class RequestEnumsPackage extends DataPackage {
  RequestEnumsPackage()
      : super(type: DataPackageType.requestEnums, content: {});
}

class EnumsPackage extends DataPackage {
  EnumsPackage({required Map<String, dynamic> content})
      : super(type: DataPackageType.enumPackage, content: content);

  List<Map<String, dynamic>> getList() {
    return content["list"];
  }
}

class StateChangedIobPackage extends DataPackage {
  StateChangedIobPackage({required Map<String, dynamic> content})
      : super(type: DataPackageType.iobStateChanged, content: content);
}

class StateChangeRequestIobPackage extends DataPackage {
  StateChangeRequestIobPackage(
      {required String stateID, required dynamic value})
      : super(
            type: DataPackageType.iobStateChangeRequest,
            content: {"stateID": stateID, "value": value});
}

class EnumUpdateRequestIobPackage extends DataPackage {
  EnumUpdateRequestIobPackage()
      : super(
      type: DataPackageType.enumUpdateRequest,
      content: {"id": "enum.hiob.*"});
}

class SubscribeToDataPointsIobPackage extends DataPackage {
  SubscribeToDataPointsIobPackage({required List<String> dataPoints})
      : super(
      type: DataPackageType.subscribeToDataPoints,
      content: {"dataPoints": dataPoints});
}

class RequestLoginPackage extends DataPackage {
  RequestLoginPackage({required String? deviceName, required String? deviceID, required String? key, required String? user, required String? password}) : super(type: DataPackageType.requestLogin, content: {
    "deviceName": deviceName,
    "deviceID": deviceID,
    "key": key,
    "user": user,
    "password": password
  });

}

class LoginAnswerPackage extends DataPackage {
  LoginAnswerPackage({required String key, required suc}) : super(type: DataPackageType.answerLogin, content: {

  });

}

class FirstPingFromIobPackage extends DataPackage {
  FirstPingFromIobPackage()
      : super(
      type: DataPackageType.firstPingFromIob,
      content: {});
}



