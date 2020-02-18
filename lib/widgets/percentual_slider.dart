import 'package:flutter/material.dart';

class PercentualSlider extends StatelessWidget {
  final String title;
  final double percentual;
  final Function onChanged;
  final Color colour;

  PercentualSlider({
    this.percentual,
    this.onChanged,
    this.title,
    this.colour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Slider(
                  activeColor: colour,
                  inactiveColor: colour.withOpacity(0.1),
                  onChanged: onChanged,
                  value: percentual,
                  divisions: 20,
                ),
              ),
              Text(
                '${(percentual * 100).toInt()}%',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }
}
