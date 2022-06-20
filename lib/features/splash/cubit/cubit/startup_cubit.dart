import 'package:bloc/bloc.dart';
import 'package:youtube_clone/common/utils/shared_pref.dart';

part 'startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(StartupInitial());
  fetchStartupData() async {
    emit(StartupLoading());
    final _isfirstTime = await SharedPref.getFirstTime();
    await Future.delayed(const Duration(seconds: 2));
    emit(
      StartupSucess(
        isFirstTime: true,
        isLoggedIn: false,
      ),
    );
  }
}