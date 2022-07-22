import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/products.dart';
import 'package:graduation_project/network/cubit/add_post_states.dart';

import '../../repository/auth_repository.dart';

class PostProductCubit extends Cubit<PostProductStates> {
  PostProductCubit() : super(PostProductInitialState());

  final authRepository = AuthRepository();

  static PostProductCubit get(context) => BlocProvider.of(context);

  Future addPost(
      {File? image,
      String? title,
      String? name,
      int? price,
      String? description,
      Size? size}) async {
    emit(PostProductLoadingState());
    final data = FormData();
    if (image != null) {
      final multipartImage = await MultipartFile.fromFile(image.path);
      data.files.add(
        MapEntry('images', multipartImage),
      );

      data.fields.addAll({
        MapEntry('title', title!),
        MapEntry('price', price!.toString()),
        MapEntry('description', description!),
        MapEntry('size', json.encode({'name': name})),
      });
    }
    final response = await authRepository.postProduct(data);
    response.fold(
      (error) => emit(PostProductErrorState(error)),
      (response) {
        emit(PostProductSuccessState(response));
      },
    );
  }
}
