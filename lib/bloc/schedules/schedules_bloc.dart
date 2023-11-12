import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/response/schedule_response_model.dart';

part 'schedules_event.dart';
part 'schedules_state.dart';
part 'schedules_bloc.freezed.dart';

class SchedulesBloc extends Bloc<SchedulesEvent, SchedulesState> {
  SchedulesBloc() : super(_Initial()) {
    on<SchedulesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
