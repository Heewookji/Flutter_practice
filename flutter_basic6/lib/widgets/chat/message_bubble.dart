import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.isMine, this.userName, {this.key});
  final Key key;
  final String message;
  final String userName;
  final bool isMine;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment:
          isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment:
              isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.33,
              decoration: BoxDecoration(
                color:
                    isMine ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft:
                      !isMine ? Radius.circular(0) : Radius.circular(12),
                  bottomRight:
                      isMine ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.only(
                  top: 5,
                  bottom: 15,
                  left: screenWidth * 0.04,
                  right: screenWidth * 0.04),
              child: Text(
                message,
                style: TextStyle(
                  color: isMine
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.headline6.color,
                ),
                textAlign: isMine ? TextAlign.end : TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
