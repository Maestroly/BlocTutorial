import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_name/feature/profile/cubit/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<ProfileCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text("Users"),
              centerTitle: true,
              actions: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    int counter = 0;
                    if (state is ProfileLoaded) {
                      counter = state.counter;
                    }
                    return Row(
                      children: [
                        IconButton(icon: const Icon(Icons.remove), onPressed: () => cubit.decreaseCounter()),
                        Text("$counter", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(icon: const Icon(Icons.add), onPressed: () => cubit.increaseCounter()),
                      ],
                    );
                  },
                ),
              ],
            ),
            body: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProfileLoaded) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 35, backgroundImage: NetworkImage(user.image ?? "")),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${user.firstName} ${user.lastName}", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text("@${user.username}", style: TextStyle(color: Colors.grey[600])),
                                  const SizedBox(height: 6),
                                  Text(user.email ?? "", style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.work, size: 16),
                                      const SizedBox(width: 4),
                                      Expanded(child: Text(user.company?.name ?? "No company", style: const TextStyle(fontSize: 13))),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.school, size: 16),
                                      const SizedBox(width: 4),
                                      Expanded(child: Text(user.university ?? "Unknown university", style: const TextStyle(fontSize: 13))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          );
        },
      ),
    );
  }
}
