import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bm_state.dart';

class BmCubit extends Cubit<BmState> {
  BmCubit() : super(BmInitial());
}
