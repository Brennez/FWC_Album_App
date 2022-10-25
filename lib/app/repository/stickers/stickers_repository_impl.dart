import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/group_stickers.dart';
import 'package:fwc_album_app/app/models/register_sticker_model.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  //
  CustomDio dio;

  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      // Convertendo objetos em lista
      return result.data
          .map<GroupStickers>((g) => GroupStickers.fromMap(g))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar álbum do usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar album do usuario');
    }
  }

  @override
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber) async {
    try {
      final result = await dio.auth().get('/api/sticker-search',
          queryParameters: {
            'sticker_code': stickerCode,
            'sticker_number': stickerNumber
          });
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      log('Erro ao buscar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar figurinha');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({
        // Forma feia
        // 'sticker_code': registerStickerModel.stickerCode,
        // 'sticker_number': registerStickerModel.stickerNumber,
        // 'sticker_image_upload': '',
        // Forma legal
        ...registerStickerModel.toMap(),
        'sticker_image_upload': '',
      });
      final result = await dio.auth().post('/api/sticker', data: body);
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao registrar figurinha no album', error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao registrar figurinha no album');
    }
  }

  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().post('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao inserir figurinnha no álbum do usuário',
          error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao inserir figurinnha no álbum do usuário');
    }
  }

  @override
  Future<void> updateUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().put('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao atualizar figurinnha no álbum do usuário',
          error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao atualizar figurinnha no álbum do usuário');
    }
  }
}
