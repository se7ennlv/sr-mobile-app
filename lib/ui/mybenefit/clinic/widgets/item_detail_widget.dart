import 'package:flutter/material.dart';
import 'package:flutter_sr/core/models/mybenefit/clinic_model.dart';

class ItemDetailWidget extends StatelessWidget {
  final itemDetail;

  ItemDetailWidget({this.itemDetail});

  @override
  Widget build(BuildContext context) {
    final Future<List<Child>> _futureDetail = Future<List<Child>>(
      () => itemDetail,
    );

    const EdgeInsets _padding = EdgeInsets.symmetric(
      vertical: 12.0,
      horizontal: 18.0,
    );

    return FutureBuilder(
      future: _futureDetail,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            return Padding(
              padding: _padding,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final Child item = snapshot.data[index];

                  return Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '- ${item.medName} | (${item.qtyUsed})',
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return _buildNoDetail(_padding);
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }

        return LinearProgressIndicator();
      },
    );
  }

  Widget _buildNoDetail(_padding) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: _padding,
                child: Text('No detail'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
