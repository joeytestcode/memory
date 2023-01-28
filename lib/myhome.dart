import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:memory/item_adapter.dart';
import 'package:provider/provider.dart';

import 'Strings.dart';
import 'item.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemAdapter>(
      builder: (context, value, child) {
        final ItemAdapter items = value;

        return Scaffold(
          appBar: AppBar(title: const Text(Strings.appTitle)),
          bottomSheet: _MyBottomBar(items: items),
          body: _MyBody(items: items),
        );
      },
    );
  }
}

class _MyBody extends StatefulWidget {
  const _MyBody({
    Key? key,
    required this.items,
  }) : super(key: key);

  final ItemAdapter items;

  @override
  State<_MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<_MyBody> {
  @override
  Widget build(BuildContext context) {
    String text = widget.items.currentItem.lang1;
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          text = widget.items.currentItem.lang2;
        });
      },
      onTapUp: (details) {
        setState(() {
          text = widget.items.currentItem.lang1;
        });
      },
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class _MyBottomBar extends StatelessWidget {
  const _MyBottomBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  final ItemAdapter items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar.builder(
            minRating: 1,
            itemSize: 54,
            wrapAlignment: WrapAlignment.spaceEvenly,
            initialRating: items.currentItem.level.toDouble(),
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return const Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
                default:
                  return Container();
              }
            },
            onRatingUpdate: (rating) {
              rating == 0
                  ? items.currentItem.level = 1
                  : items.currentItem.level = rating.round();
              items.modifyOrders();
            },
          ),
        ],
      ),
    );
  }
}
