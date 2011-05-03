module Admissions::SubmissionsHelper

  def submission_zip_path(submission)
    attachment_admissions_submission_path(submission.id, 
      "#{submission.user.name.underscore}_#{submission.id}", 
      :format => "zip")
  end
  
  def link_to_submission_user(submission)
    if current_access_level.allows? :manage_users
      link_to submission.user.name, edit_admin_user_path(submission.user)
    else
      link_to submission.user.name, admissions_submission_path(submission)
    end
  end
end