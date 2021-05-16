import 'package:flutter/material.dart';

const _teamSize = 30.0;
const _dotSize = 18.0;

class TeamTimeLine extends StatefulWidget {
  @override
  _TeamTimeLineState createState() => _TeamTimeLineState();
}

class _TeamTimeLineState extends State<TeamTimeLine> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final centerDot = constraints.maxWidth / 2 - _dotSize / 2;
      return Stack(
        children: <Widget>[
          Positioned(
            left: constraints.maxWidth / 2 - _teamSize / 2,
            top: 120,
            bottom: 110.0,
            child: TeamAndLine(),
          ),
          Positioned(
            left: centerDot,
            top: 200,
            child: TimeLineDot(
              selected: true,
            ),
          ),
          Positioned(
            left: centerDot,
            top: 280,
            child: TimeLineDot(),
          ),
          Positioned(
            left: centerDot,
            top: 350,
            child: TimeLineDot(
              selected: true,
            ),
          ),
          Positioned(
            left: centerDot,
            top: 420,
            child: TimeLineDot(),
          ),
          Positioned(
            left: centerDot,
            top: 490,
            child: TimeLineDot(
              selected: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: const Color(0xff45005C),
              child: Icon(Icons.people),
              onPressed: () {
                print('pressed');
              },
            ),
          )
        ],
      );
    });
  }
}

class TeamAndLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _teamSize,
      child: Column(
        children: <Widget>[
          Icon(
            Icons.people,
            color: Color(0xff45005C),
            size: _teamSize,
          ),
          Expanded(
            child: Container(
              width: 10,
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }
}

class TimeLineDot extends StatelessWidget {
  final bool selected;

  const TimeLineDot({Key key, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _dotSize,
      width: _dotSize,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundColor:
              selected ? Colors.purple[500] : Color.fromARGB(90, 69, 0, 92),
        ),
      ),
    );
  }
}
