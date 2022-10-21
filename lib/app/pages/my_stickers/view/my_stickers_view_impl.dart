import 'package:flutter/widgets.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/models/group_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/my_stickers_page.dart';

import '../../../core/ui/helpers/messages.dart';
import './my_stickers_view.dart';

abstract class MyStickersViewImpl extends State<MyStickerPage>
    with Messages<MyStickerPage>, Loader<MyStickerPage>
    implements MyStickersView {
  //

  var album = <GroupStickers>[];

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getMyAlbum();
    });
    super.initState();
  }

  @override
  void error(String message) => showError(message);

  @override
  void loadedPage(List<GroupStickers> album) {
    setState(() {
      this.album = album;
    });
  }
}
