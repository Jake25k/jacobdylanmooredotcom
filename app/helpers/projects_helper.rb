module ProjectsHelper

  def project_cover_image_with_text(project)
    if project.cover_image.url == "default-thumbnail.jpg"
      content_tag(:div, content_tag(:div, project.project_title, class: "project-panel-title center", data: {toggle: "tooltip", placement: "bottom"}, title: "#{project.description}"), class: "cover_image", style: "background-image: asset_url('default-thumbnail.jpg');")
    else
      content_tag(:div, content_tag(:div, project.project_title, class: "project-panel-title center", data: {toggle: "tooltip", placement: "bottom"}, title: "#{project.description}"), class: "cover_image", style: "background-image: url('#{project.cover_image.url}');');")
    end
  end

  def render_project_types_as_json(projects)
    # render json:
    array = []
    projects.all.map(&:project_type).each do |p|
      array.append(p.split(/\s*,\s*/))
    end
    array.flatten!
    array.uniq!
    render json: array
  end

  def project_types_as_array(projects)
    array = []
    if current_admin
      projects.all.map(&:project_type).each do |p|
        array.append(p.split(/\s*,\s*/))
      end
      array.flatten!
      array.uniq
    else
      projects.notDrafted.map(&:project_type).each do |p|
        array.append(p.split(/\s*,\s*/))
      end
      array.flatten!
      array.uniq
    end
  end
end
