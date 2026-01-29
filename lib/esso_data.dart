import 'package:html/dom.dart';
import 'package:sofa_gas_buddy/car.dart';
import 'package:requests/requests.dart';
import 'package:html/parser.dart';
import 'package:sofa_gas_buddy/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EssoData {
  final storage = const FlutterSecureStorage();

  //static values from the website
  // ignore: non_constant_identifier_names
  static String URL = "https://odin.aafes.com/esso/";
  static String idField =
      "_ctl0:ContentPlaceHolder1:ucAuthenticate:tbxSponsorID";
  static String idTypeField =
      "_ctl0:ContentPlaceHolder1:ucAuthenticate:ddlSponsorType";
  static String vrnField = "_ctl0:ContentPlaceHolder1:ucAuthenticate:tbxVRN";
  static String submitID = "_ctl0:ContentPlaceHolder1:ucAuthenticate:btnLogIn";
  static String balanceID =
      "_ctl0_ContentPlaceHolder1_ucESSOPanel_lblAccountBalance";
  static String vehicleTableID =
      "_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList";

  Future<(String, String, Status)> getData() async {
    //Get the first page so we can the most current cookies and other random strings that appear necessary validating the request
    var initialResponse = await Requests.get(URL);
    initialResponse.raiseForStatus();
    var initialResponseContent = parse(initialResponse.content());
    String? eventTarget = initialResponseContent
        .querySelector("input[name='__VIEWSTATE']")
        ?.attributes['value'];
    String? eventArgument = initialResponseContent
        .querySelector("input[name='__EVENTARGUMENT']")
        ?.attributes['value'];
    String? viewState = initialResponseContent
        .querySelector("input[name='__VIEWSTATE']")
        ?.attributes['value'];
    String? viewStateGen = initialResponseContent
        .querySelector("input[name='__VIEWSTATEGENERATOR']")
        ?.attributes['value'];
    String? eventValidation = initialResponseContent
        .querySelector("input[name='__EVENTVALIDATION']")
        ?.attributes['value'];
    try {
      //get vrn, id and idType from storage
      String? vrn = await storage.read(key: "vrn");
      String? id = await storage.read(key: "id");
      String? idType = await storage.read(key: "idType");

      if (idType == null || id == null || vrn == null) {
        return ("Blank creds", "Blank creds", Status.blankCreds);
      }
      var accountDataRequest = await Requests.post(
        URL,
        body: {
          '__EVENTTARGET': eventTarget,
          '__EVENTARGUMENT': eventArgument,
          '__VIEWSTATE': viewState,
          '__VIEWSTATEGENERATOR': viewStateGen,
          '__EVENTVALIDATION': eventValidation,
          idField: id,
          idTypeField: idType,
          vrnField: vrn,
          submitID: 'Log In',
        },
        bodyEncoding: RequestBodyEncoding.FormURLEncoded,
        timeoutSeconds: 15,
      );
      accountDataRequest.raiseForStatus();
      var accountDataContent = parse(accountDataRequest.content());
      if (accountDataRequest.statusCode != 200) {
        await storage.write(
          key: "LAST_ERROR",
          value: "Got something other than 200 from Esso server",
        );
        return ("bad response", "bad response", Status.badResponse);
      }

      String? balance = getBalance(accountDataContent);
      if (balance == null) {
        await storage.write(
          key: "LAST_ERROR",
          value: "Balance was empty or null",
        );
        return ("Balance error", "Balance error", Status.dataParseError);
      }

      List cars = getCars(accountDataContent);
      if (cars == []) {
        await storage.write(
          key: "LAST_ERROR",
          value: "Cars were empty or null",
        );
        return ("Cars error", "Cars error", Status.dataParseError);
      }

      final buffer = StringBuffer();
      buffer.writeln("Account Balance: $balance\n");
      for (var car in cars) {
        if (car.status == "Active") {
          buffer.writeln("VRN: ${car.vrn}");
          buffer.writeln("Ration Remaining: ${car.rationRemaining}L");
          buffer.writeln("Expiration Date: ${car.expDate}\n");
        }
      }
      String labelData = buffer.toString();
      String labelRefreshData =
          "Last Refresh: ${Utils.getPrettyDate(DateTime.now())}";
      await storage.write(key: "LastData", value: buffer.toString());
      await storage.write(key: "LastRefresh", value: DateTime.now().toString());
      return (labelData, labelRefreshData, Status.success);
    } catch (ex) {
      await storage.write(key: "LAST_ERROR", value: "$ex");
      return ("Last error: $ex", "Error", Status.genericError);
    }
  }

  static String? getBalance(Document accountDataContent) {
    return accountDataContent
        .getElementById(balanceID)
        ?.text;
  }

  static List<Car> getCars (Document accountDataContent) {
    bool first = true;
    List<Car> cars = [];
    var vehicles = accountDataContent
        .getElementById(vehicleTableID)
        ?.getElementsByTagName('tr');
    if (vehicles == null) {
      return ([]);
    }
    for (var vehicle in vehicles) {
      //Skip the first row, as it is just the table headers
      if (first) {
        first = false;
        continue;
      }
      var cols = vehicle.getElementsByTagName('td');
      Car car = Car();
      car.vrn = cols[0].text.trim();
      car.type = cols[1].text.trim();
      car.status = cols[2].text.trim();
      car.ration = cols[3].text.trim();
      car.rationRemaining = cols[4].text.trim();
      car.expDate = cols[5].text.trim();

      //Only add active cars, otherwise the screen is cluttered with garbage
      if (car.status == 'Active') {
        cars.add(car);
      }
    }
    return cars;
  }

  Future<String> loadOldData() async {
    try {
      String? lastData = await storage.read(key: "LastData");

      if (lastData != null) {
        return lastData;
      }
      return "Unable to load old data";
    } catch (ex) {
      await storage.write(key: "LAST_ERROR", value: "Unable to load old data");
      return "Unable to load old data";
    }
  }

  Future<String> lastRefreshedTime() async {
    String? lastRefresh = await storage.read(key: "LastRefresh");

    if (lastRefresh != null) {
      DateTime lr = DateTime.parse(lastRefresh);
      return "Last Refresh: ${Utils.getPrettyDate(lr)}";
    } else {
      return 'Unable to load old data';
    }
  }
}
