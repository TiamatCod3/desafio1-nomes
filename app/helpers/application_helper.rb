module ApplicationHelper
  def flash_class(level)
    bootstrap_alert_class = {
      "success" => "alert alert-success alert-dismissible",
      "error" => "alert alert-warning alert-dismissible",
      "notice" => "alert alert-warning alert-dismissible",
      "alert" => "alert alert-warning alert-dismissible",
      "warn" => "alert alert-warning alert-dismissible"
    }
    
    bootstrap_alert_class[level]
  end
end
