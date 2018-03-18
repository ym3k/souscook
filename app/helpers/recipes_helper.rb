module RecipesHelper
  def link_to_add_fields(name, f, association)
    new_obj = f.object.send(association).klass.new
    id = new_obj.object_id
    fields = f.fields_for(association, new_obj, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, "#", class: "add_fields btn btn-warning", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
