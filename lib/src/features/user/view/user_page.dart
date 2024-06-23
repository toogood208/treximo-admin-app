import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treximino_admin_app/src/features/user/notifier/user_notifier.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UsersState();
}

class _UsersState extends State<UserPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Consumer(builder: (context, ref, child) {
          final users = ref.watch(userNotifierProvider);
          return users.when(
            data: (data) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              ref
                                  .read(userNotifierProvider.notifier)
                                  .searchItems(value);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search with name or email',
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: const Text(
                            "Add User",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final user = data[index];
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
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${user.firstName} ${user.lastName}"),
                                        Text(user.email ?? ''),
                                      ],
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("edit"),
                                    ),
                                  ],
                                );
                              } else {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    Text("${user.firstName} ${user.lastName}"),
                                    Text(user.email ?? ''),
                                    Text(user.phoneNumber ?? ''),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("edit"),
                                    ),
                                  ],
                                );
                              }
                            }),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
            error: (err, stk) {
              return Text(err.toString());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        }),
      ),
    );
  }
}
