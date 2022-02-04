import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/products/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } catch (error, stack) {
      _loading.toggle();
      log(
        'Erro ao buscar produto',
        error: error,
        stackTrace: stack,
      );
      _message(MessageModel(
        message: 'Erro ao buscar menu',
        title: 'Erro',
        type: MessageType.error,
      ));
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }

  Future<void> refreshPage() async {
    try {
      await findAllProducts();
    } catch (error, stack) {
      log(
        'Erro ao buscar produto',
        error: error,
        stackTrace: stack,
      );
      _message(MessageModel(
        message: 'Erro ao buscar menu',
        title: 'Erro',
        type: MessageType.error,
      ));
    }
  }
}
