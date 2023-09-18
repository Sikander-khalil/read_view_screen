

import 'package:flutter/material.dart';

import 'package:graphview/GraphView.dart';


class RootedTree extends StatefulWidget {
  const RootedTree({super.key});

  @override
  State<RootedTree> createState() => _RootedTreeState();
}

class _RootedTreeState extends State<RootedTree> {

  Widget customNodeWidget(String label, TextStyle textStyle) {
    return CustomNodeWidget(label: label, textStyle: textStyle);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

        title: Text("Binary Tree"),
      ),
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.01,
        maxScale: 2.6,
        child: GraphView(
            graph: graph,
            algorithm: BuchheimWalkerAlgorithm(
              builder,
              TreeEdgeRenderer(builder)
            ),
          paint: Paint()
          ..color = Colors.black
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke,
          builder: (Node node){

            var label = 'Node ${node.key!.value}';
            TextStyle textStyle = TextStyle(color: Colors.black);
            if (label == 'Node 1') {
              textStyle = TextStyle(color: Colors.red); // Change text color for 'Node 1'
            }
            return customNodeWidget(
                 label,
              textStyle


            );




          },


        )
      ),
    );
  }






  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: CircleAvatar(
        radius: 23,

        backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU'

        ),
      ),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node7 = Node.Id(7);
    final node8 = Node.Id(8);
    final node9 = Node.Id(9);
    final node10 = Node.Id(10);
    final node11 = Node.Id(11);

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);

    graph.addEdge(node2, node4);
    graph.addEdge(node2, node5);


    graph.addEdge(node3, node8);
    graph.addEdge(node3, node9);

    graph.addEdge(node4, node6);

    graph.addEdge(node5, node7);

    graph.addEdge(node9, node10);

    graph.addEdge(node8, node11);


    builder
      ..siblingSeparation = (50)
      ..levelSeparation = (50)
      ..subtreeSeparation = (50)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}

class CustomNodeWidget extends StatelessWidget {
  final String label;
  final TextStyle textStyle;

  const CustomNodeWidget({
    required this.label,
    required this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: textStyle

      ),
    );
  }
}
