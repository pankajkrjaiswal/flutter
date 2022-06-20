import 'package:bloc/bloc.dart';
import 'package:youtube_clone/features/authentication/resource/user_repository.dart';
part 'social_state.dart';
class SocialCubit extends Cubit<SocialState> {
  SocialCubit({required this.userRepository}) : super(SocialInitial());
  final UserRepository userRepository;
  loginWithGoogle() async {
    emit(SocialLoading());
    final _res = await userRepository.loginWithGoogle();
    if (_res.status) {
      emit(SocialSuccess());
    } else {
      emit(
        SocialError(message: _res.message),
      );
    }
  }
}
