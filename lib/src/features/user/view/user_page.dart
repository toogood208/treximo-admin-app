import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UsersState();
}

class _UsersState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.secondary),
              child: const Text(
                "Add User",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      LayoutBuilder(builder: (context, constraint) {
                        if (constraint.maxWidth < 450) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              const SizedBox(width: 8),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ikem Frank"),
                                  Text("frank@gmail.com"),
                                ],
                              ),
                              const Spacer(),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text("edit"))
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              const Text("Ikem Frank"),
                              const Text("frank@gmail.com"),
                              const Text("090 8334 1993"),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text("edit"))
                            ],
                          );
                        }
                      }),
                      const Divider()
                    ],
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
