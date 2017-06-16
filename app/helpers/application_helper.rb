module ApplicationHelper
  def ifAdminSession
    if current_admin
      return "ADMIN SESSION"
    else
      return ""
    end
  end
end
