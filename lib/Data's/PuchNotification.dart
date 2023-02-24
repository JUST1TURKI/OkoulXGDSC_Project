// ignore_for_file: file_names

//  class NotificationService {
//   Future<void> scheduleNotifications() async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         "Notification Title",
//         "This is the Notification Body!",
//         tz.TZDateTime.now(tz.local).add(const Duration(minutes: 5)),
//         platformChannelSpecifics,
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }
// }