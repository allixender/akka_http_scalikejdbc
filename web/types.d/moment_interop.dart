@JS()
library moment_interop;

import "package:js/js.dart";

@JS()
external MomentInterface get moment;

class MomentInterface {
  external Function() get utc;
  external Function() get now;
}

/* different ways of modelling basic interop */

@JS("moment")
class utc {
  // @Ignore
  utc.fakeConstructor$();
  external factory utc();
  external DateTime subtract(num ts, String dtype);
}

/* // How to use in main.dart

import 'types.d/moment_interop.dart';

  var date = moment.utc();
  print(date.toString());

  var t = utc();
  print(t.toString());

*/