import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/features/authentication/resource/user_repository.dart';
import 'package:youtube_clone/features/splash/resource/start_repository.dart';

class MultiRepositoryWrapper extends StatelessWidget {
  final Widget child;
  const MultiRepositoryWrapper(
    {Key? key,
     required this.child
     }): super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider
        (create:(context) => StartupRepository(),
    ),
    RepositoryProvider(create: (context) => UserRepository(),
    ),
      ],
      child: child,
    );
  }
}
