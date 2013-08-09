module CustomBoxesHelper
  def select_box_name_by(box_type)
    select "box", "boxable_id", box_type.constantize.all.collect{|b| [b.name, b.id]}
  end
end
