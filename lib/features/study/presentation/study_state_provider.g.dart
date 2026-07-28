// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StudyAnnotationNotifier)
final studyAnnotationProvider = StudyAnnotationNotifierProvider._();

final class StudyAnnotationNotifierProvider
    extends $NotifierProvider<StudyAnnotationNotifier, StudyAnnotationState> {
  StudyAnnotationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'studyAnnotationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$studyAnnotationNotifierHash();

  @$internal
  @override
  StudyAnnotationNotifier create() => StudyAnnotationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StudyAnnotationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StudyAnnotationState>(value),
    );
  }
}

String _$studyAnnotationNotifierHash() =>
    r'78916b0e8399514c78fd361ce4c10529c4e9b331';

abstract class _$StudyAnnotationNotifier
    extends $Notifier<StudyAnnotationState> {
  StudyAnnotationState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<StudyAnnotationState, StudyAnnotationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StudyAnnotationState, StudyAnnotationState>,
              StudyAnnotationState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
