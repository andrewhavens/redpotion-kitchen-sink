class PickerViewExampleScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def picker(st)
    # FIXME: setting width to :full with RMQ does not work when device is rotated.
    st.frame = { left: 0, top: 51, width: :full, height: 216 }
  end

  def color_swatch(st)
    st.frame = { left: 0, top: 275, width: :full, height: screen_height - 275, padding: 20 }
  end
end
