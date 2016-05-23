class PickerViewExampleScreen < PM::Screen
  title "Picker View"
  stylesheet PickerViewExampleScreenStylesheet

  RGB_MAX = 255.0
  COLOR_VALUE_OFFSET = 5 # increment by 5
  MAX_NUMBER_OF_OPTIONS = (RGB_MAX / COLOR_VALUE_OFFSET).ceil + 1

  attr_accessor :red, :green, :blue

  def on_load
    @red = @green = @blue = 0
    # Refer to stylesheet class to see how these views are styled.
    append(UIView, :color_swatch)
    append(UIPickerView, :picker).attr(delegate: self)
    # Use this method to manually select a row, passing integers for the row and component values
    # find(:picker).get.selectRow(row, inComponent: component, animated: true)
    update_color_swatch
  end

  def update_color_swatch
    find(:color_swatch).style {|st| st.background_color = rmq.color(red, green, blue) }
  end

  #
  # UIPickerViewDataSource methods
  # https://developer.apple.com/library/ios/documentation/iPhone/Reference/UIPickerViewDataSource_Protocol/index.html#//apple_ref/occ/intf/UIPickerViewDataSource
  #

  def numberOfComponentsInPickerView(pickerView)
    # three options: red, green, blue
    3
  end

  def pickerView(pickerView, numberOfRowsInComponent: component)
    MAX_NUMBER_OF_OPTIONS
  end

  #
  # UIPickerViewDelegate methods
  # https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIPickerViewDelegate_Protocol/index.html#//apple_ref/occ/intf/UIPickerViewDelegate
  #

  def pickerView(pickerView, titleForRow: row, forComponent: component)
    color_value = row * COLOR_VALUE_OFFSET
    color_value.to_s
  end

  # To display titles using different colors, use this method.
  # Working with Attributed Strings can be a pain. Use the motion-mastr gem to make it easier on yourself.
  # def pickerView(pickerView, attributedTitleForRow: row, forComponent: component)
  # end

  # To use custom views for displaying the titles, use this method.
  # def pickerView(pickerView, viewForRow: row, forComponent: component, reusingView: view)
  # end

  def pickerView(pickerView, didSelectRow: row, inComponent: component)
    color_value = COLOR_VALUE_OFFSET * row
    case component
    when 0 then @red   = color_value
    when 1 then @green = color_value
    when 2 then @blue  = color_value
    end
    update_color_swatch
  end

  #
  # UIPickerViewAccessibilityDelegate
  #
  def pickerView(pickerView, accessibilityLabelForComponent: component)
    case component
    when 0 then "Red color component value"
    when 1 then "Green color component value"
    when 2 then "Blue color component value"
    end
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end
