CanRemind
=========

A simple iOS app to demonstrate how to create a local notification

###Step 1: Clone me
- See we created a template this time

###Step 2: Remind me in 10
- Add a button with the title "Remind me in 10 seconds"
- Add an IBAction that triggers a notification in 10 seconds
  - Shift now by 10 seconds
  - Initialize a UILocalNotification
  - Add the fireDate and other settings
  - Schedule the notification with the [UIApplication sharedApplication]

It will pop up now 10 seconds after you tap the button (but only when the app is closed)

###Step 3: Handle the notification when the app is not closed
- Add the didReceiveLocalNotification method to your app delegate
- When the method is called set the badge to 0 and show an alert view

###Step 4: Remind me on date
- Add another button and a UIDatePicker
- Add the outlet for the picker
- Add an IBAction that triggers a notification on selected date
  - Follow code from 10 second notification
  - Set the fire date to the picker's date property
