import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creating a Modal Bottom Sheet'),
        backgroundColor: Colors.black38,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Modal Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet(
              context: context,

              builder: (context) {
                return Padding(
                  padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                child: Icon(Icons.add_alarm_rounded),
                              ),
                              title: Text("Hello $index"),
                              subtitle: Text("Yes"),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                autofocus: true,
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText: "Write message...",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            FloatingActionButton(
                              onPressed: () {},
                              child: Icon(Icons.send, color: Colors.white, size: 18),
                              backgroundColor: Colors.blue,
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}