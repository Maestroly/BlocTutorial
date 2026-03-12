import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_name/feature/home/bloc/home_bloc.dart';
import 'package:my_app_name/feature/profile/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"), centerTitle: true),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeLoadedState) {
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final comment = state.posts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 22, child: Text(comment.user?.username?.substring(0, 1).toUpperCase() ?? "?")),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(comment.user?.fullName ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    Text("@${comment.user?.username ?? ''}", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20)),
                                child: Text("Post ${comment.postId}", style: const TextStyle(fontSize: 12, color: Colors.blue)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(comment.body ?? '', style: const TextStyle(fontSize: 15)),
                          const SizedBox(height: 12),
                          Row(children: [const Icon(Icons.favorite_border, size: 18), const SizedBox(width: 4), Text("${comment.likes} likes")]),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text("Something went wrong"));
          },
        ),
      ),
    );
  }
}
