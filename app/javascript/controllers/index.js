// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"
import CommentEditController from "./comment_edit_controller"

application.register("comment-edit", CommentEditController)

