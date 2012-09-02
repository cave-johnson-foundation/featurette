ActiveAdmin.register App do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :url
      f.input :logo, :as => :file, :hint => f.template.image_tag(f.object.logo.url(:medium))
      f.input :screenshot, :as => :file, :hint => f.template.image_tag(f.object.screenshot.url(:medium))
    end
    f.buttons
  end
end
