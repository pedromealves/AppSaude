// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photoview_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Photoview on PhotoviewStore, Store {
  late final _$userImageAtom =
      Atom(name: 'PhotoviewStore.userImage', context: context);

  @override
  Uint8List? get userImage {
    _$userImageAtom.reportRead();
    return super.userImage;
  }

  @override
  set userImage(Uint8List? value) {
    _$userImageAtom.reportWrite(value, super.userImage, () {
      super.userImage = value;
    });
  }

  late final _$filePickerAsyncAction =
      AsyncAction('PhotoviewStore.filePicker', context: context);

  @override
  Future<dynamic> filePicker(ImageSource source) {
    return _$filePickerAsyncAction.run(() => super.filePicker(source));
  }

  @override
  String toString() {
    return '''
userImage: ${userImage}
    ''';
  }
}
