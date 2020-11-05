import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final Function startAddNewTransaction;

  AdaptiveAppBar(this.startAddNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Personal Expenses',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(
                    CupertinoIcons.add,
                  ),
                  onTap: () => startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text('Personal Expenses'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => startAddNewTransaction(context),
              ),
            ],
          );
  }

  @override
  Size get preferredSize => Platform.isIOS
      ? CupertinoNavigationBar().preferredSize
      : AppBar().preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) {
  return CupertinoNavigationBar().shouldFullyObstruct(context);    
  }
}
