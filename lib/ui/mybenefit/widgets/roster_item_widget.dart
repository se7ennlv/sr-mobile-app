import 'package:flutter/material.dart';
import 'package:flutter_sr/core/models/mybenefit/roster_model.dart';
import 'package:intl/intl.dart';

class RosterItemWidget extends StatefulWidget {
  final Roster item;

  RosterItemWidget({this.item});

  @override
  _RosterItemWidgetState createState() => _RosterItemWidgetState();
}

class _RosterItemWidgetState extends State<RosterItemWidget> {
  bool showItemDetail = false;

  @override
  Widget build(BuildContext context) {
    var bgColor = Colors.blue;

    if (widget.item.shiftCode.startsWith('C')) {
      if (DateTime.parse(widget.item.workday).isBefore(DateTime.now())) {
        setState(() {
          showItemDetail = true;
        });

        if (widget.item.lateCheckIn.length > 0 ||
            widget.item.earlyCheckOut.length > 0) {
          bgColor = Colors.red;
        } else {
          bgColor = Colors.green;
        }
      }
    } else if (widget.item.shiftCode.startsWith('D')) {
      bgColor = Colors.grey;
    } else {
      bgColor = Colors.amber;
    }

    return ExpansionTile(
      leading: _buildLeading(bgColor),
      title: _buildTitle(),
      children: [
        showItemDetail ? _buildDetails() : Text('-'),
      ],
    );
  }

  Widget _buildLeading(dynamic bgColor) {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: bgColor,
      foregroundColor: Colors.white,
      child: Text(
        '${widget.item.shiftCode}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildTitle() {
    var format = "dd-MMM-yy";

    final workDay = DateTime.parse(widget.item.workday);
    final workDayFormatted = DateFormat(format).format(workDay);

    final updatedAt = DateTime.parse(widget.item.updatedAt);
    final updatedAtFormatted = DateFormat(format).format(updatedAt);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('$workDayFormatted'),
            Text('$updatedAtFormatted', style: TextStyle(fontSize: 12.0)),
          ],
        ),
      ],
    );
  }

  Widget _buildDetails() {
    final String format = "dd-MMM-yy H:mm a";

    final chkIn = DateTime.parse(widget.item.firstCheckIn);
    var chkInFormatted = new DateFormat(format).format(chkIn);

    if ((chkIn.year).toString().startsWith('19')) {
      chkInFormatted = '-';
    }

    final chkOut = DateTime.parse(widget.item.lastCheckOut);
    var chkOutFormatted = new DateFormat(format).format(chkOut);

    if ((chkOut.year).toString().startsWith('19')) {
      chkOutFormatted = '-';
    }

    final lateIn = widget.item.lateCheckIn;
    final earlyOut = widget.item.earlyCheckOut;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Check-in: $chkInFormatted',
                textAlign: TextAlign.left,
              ),
              Text(
                'Check-out: $chkOutFormatted',
                textAlign: TextAlign.left,
              ),
              Text(
                'Late check-in: $lateIn (Min)',
                textAlign: TextAlign.left,
              ),
              Text(
                'Early check-out: $earlyOut (Min)',
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
