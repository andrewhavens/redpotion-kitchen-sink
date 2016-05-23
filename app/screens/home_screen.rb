class HomeScreen < PM::TableScreen
  title "Kitchen Sink"
  stylesheet HomeScreenStylesheet

  def table_data
    [{
      cells: [
        # { title: "UIActivityIndicatorView" },
        # { title: "UIAlertController" },
        # { title: "UIButton" },
        # { title: "UIDatePicker" },
        # { title: "UIImageView" },
        # { title: "UIPageControl" },
        { title: "Picker View", action: :view_example, arguments: { screen: PickerViewExampleScreen } },
        # { title: "UIProgressView" },
        # { title: "UISearchBar" },
        # { title: "UISearchController" },
        # { title: "UISegmentedControl" },
        # { title: "UISlider" },
        # { title: "UIStackView" },
        # { title: "UIStepper" },
        # { title: "UISwitch" },
        # { title: "UITextField" },
        # { title: "UITextView" },
        # { title: "UIToolbar" },
        # { title: "UIWebView" }
      ]
    }]
  end

  def view_example(args)
    open args[:screen]
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
    find.all.reapply_styles
  end
end
