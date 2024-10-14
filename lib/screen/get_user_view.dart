import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/cubit/user_cubit.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 8.0),
                child: state is LoadingToGetUserData
                    ? const CircularProgressIndicator()
                    : state is GetUserDataSuccess
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage:
                                    NetworkImage(state.model.profilePic),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(state.model.name),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(state.model.phone),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(state.model.email),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(state.model.createdAt),
                            ],
                          )
                        : const Text("Failer To Data")),
          ),
        );
      },
    );
  }
}
