import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'study_state_provider.g.dart';

class StudyAnnotationState {
  final Map<String, String> notes; // blockId -> note text
  final Map<String, List<String>> highlights; // blockId -> highlighted texts

  StudyAnnotationState({this.notes = const {}, this.highlights = const {}});

  StudyAnnotationState copyWith({
    Map<String, String>? notes,
    Map<String, List<String>>? highlights,
  }) {
    return StudyAnnotationState(
      notes: notes ?? this.notes,
      highlights: highlights ?? this.highlights,
    );
  }
}

@riverpod
class StudyAnnotationNotifier extends _$StudyAnnotationNotifier {
  @override
  StudyAnnotationState build() {
    return StudyAnnotationState();
  }

  void addNote(String blockId, String note) {
    state = state.copyWith(
      notes: {...state.notes, blockId: note},
    );
  }

  void addHighlight(String blockId, String highlight) {
    final blockHighlights = state.highlights[blockId] ?? [];
    state = state.copyWith(
      highlights: {
        ...state.highlights,
        blockId: [...blockHighlights, highlight],
      },
    );
  }
}
