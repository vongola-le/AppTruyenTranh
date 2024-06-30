
import '../../../models/chap_comic.dart';
import '../provider/comment_provider.dart';

class CommentRepository {
  CommentRepository({required this.commentProvider});
  final CommentProvider commentProvider;
  Future<List<CommentChapComic>> getCommentChapById(String id, String idChuong) =>
    commentProvider.getCommentChapById(id, idChuong);
}