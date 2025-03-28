function pcwd
  set home_path_regex (string join '' "^" $HOME)
  set short_path (string replace -r $home_path_regex '~' $PWD)
  set sections (string split "/" $short_path)
  if test (count $sections) -gt 4
    set first_section (string join "/" $sections[1 2])
    set last_section (string join "/" $sections[-2 -1])
    set sections $first_section "..." $last_section
  end

  echo (string join "/" $sections)
end