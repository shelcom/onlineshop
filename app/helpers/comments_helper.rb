module CommentsHelper
def comment_author(comment)
 user_signed_in? && current_user.id == comment.user_id
end
end
