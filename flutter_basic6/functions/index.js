const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
exports.myFunction = functions.firestore
  .document('chats/{message}')
  .onCreate((change, context) => {
    return admin.messaging().sendToTopic('chats', {
      notification: {
        title: change.data().userName,
        body: change.data().text,
        clickAction: 'FLUTTER_NOTIFICATION_CLICK',
      },
    });
  });