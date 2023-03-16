Rating your apps

Packages:
rate_my_app

step_1:::——>

//variuable declared karye tya………..

RateMyApp rateMyApp = RateMyApp(
  preferencesPrefix: 'rateMyApp_',
  minDays: 0,
  minLaunches: 2,
  googlePlayIdentifier: 'gujarati.kids.learning',
  appStoreIdentifier: '1661741363',
);

Step 2——>

Oppress:(){

rateMyApp.showStarRateDialog(
context,
title: 'Rate this app',
// The dialog title.
message:"You like this app ? Then take a little bit of your time to leave a rating :",
actionsBuilder: (context, stars) {

return [
TextButton(
child: const Text('OK',style: TextStyle(fontFamily: "Myfontlight",color: Colors.black),),
onPressed: () async {
print('Thanks for the ' +
(stars == null ? '0' : stars.round().toString()) + ' star(s) !');

await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);

},
),
];
},
ignoreNativeDialog: Platform.isAndroid,
dialogStyle: const DialogStyle(
titleAlign: TextAlign.center,
messageAlign: TextAlign.center,
messagePadding: EdgeInsets.only(bottom: 20),
),
starRatingOptions: const StarRatingOptions(),
onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
);



}


