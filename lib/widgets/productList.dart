import 'package:online_printing/widgets/responsive.dart';
import 'package:flutter/material.dart';



class productList extends StatelessWidget {
  final double width = 300;
final double height = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 10,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.pages),
                          title: Text('Normal Paper'),
                          subtitle: Text('---------------'),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Click to Order'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 10,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.pages),
                          title: Text('Hard Cover'),
                          subtitle: Text('---------------'),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Click to Order'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                  elevation: 10,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.pages),
                          title: Text('Poster'),
                          subtitle: Text('---------------'),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Click to Order'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                              ),
                ),
            ],
          ),
          Row(
            children: [
              Card(
                elevation: 10,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.pages),
                        title: Text('Greetings card'),
                        subtitle: Text('---------------'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Click to Order'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.pages),
                        title: Text('Postcard'),
                        subtitle: Text('---------------'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Click to Order'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
                Card(
                elevation: 10,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.pages),
                        title: Text('Corporate Folder'),
                        subtitle: Text('---------------'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Click to Order'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ); 
  }
}