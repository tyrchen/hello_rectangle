import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:hello_rectangle/converter_route.dart';
import 'package:hello_rectangle/unit.dart';

class Category extends StatelessWidget {
  final double height;
  final double iconSize;
  final double bgWidth;
  final double textSize;

  final String title;
  final IconData icon;
  final Color color;
  final List<Unit> units;

  Category({
    Key key,
    @required this.title,
    @required this.color,
    @required this.icon,
    @required this.units,
    this.height = 100.0,
    this.iconSize = 60.0,
    this.bgWidth = 70.0,
    this.textSize = 24.0,
  })  : assert(title != null),
        assert(color != null),
        assert(icon != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverter(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(title, style: Theme.of(context).textTheme.headline4),
          centerTitle: true,
          backgroundColor: color,
        ),
        body: ConverterRoute(
          color: color,
          units: units,
        )
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: height,
        width: double.infinity,
        child: InkWell(
          borderRadius: BorderRadius.circular(height / 2),
          splashColor: color,
          highlightColor: color,
          onTap: () {
            _navigateToConverter(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(icon, size: iconSize),
                ),
                Center(
                    child: Text(title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
