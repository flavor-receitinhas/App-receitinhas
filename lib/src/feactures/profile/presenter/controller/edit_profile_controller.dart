import 'dart:io';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_manager/export_manager.dart';

class EditProfileController extends ManagerStore {
  final ProfileRepository _repository;

  EditProfileController(this._repository);

  File? image;
  ProfileEntity? profile;
  TextEditingController biographyController = TextEditingController();
  bool isRemoveImage = false;

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          profile = arguments['profile'] as ProfileEntity;
          biographyController.text = profile!.biography;
        },
      );

  Future<void> updateImageProfile() async {
    if (image == null) return;
    await _repository.updateImageProfile(profile!.userID, image!.path);
  }

  Future<void> pickImageLogo() async {
    final fileImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (fileImage == null) {
      return;
    }
    image = File(fileImage.path);
    isRemoveImage = false;
    notifyListeners();
  }

  Future<void> updateProfile(ProfileEntity profile) =>
      _repository.updateProfile(profile);

  void removeImage() {
    image = File('');
    isRemoveImage = true;
    profile!.image = null;
    notifyListeners();
  }
}
