import 'package:get/get.dart';
import 'package:unimanga_app/app/modules/comment/repository/comment_reposotory.dart';

import '../../../models/chap_comic.dart';

class CommentController extends GetxController {
  CommentController({required this.commentRepository});
  final CommentRepository commentRepository;
  void onInit() {
    super.onInit();
  }
  var listCommentChap = <CommentChapComic>[].obs;
  Future<void> fetchCommentChap(String id, String idChap) async {
    try {
      List<CommentChapComic> commentchaps = await commentRepository.getCommentChapById(id, idChap);
      listCommentChap.value = commentchaps;
    } catch (e) {
      print('Error fetching comments chao: $e');
    }
  }
}