#= require active_admin/base
//= require active_admin/base
//= require tinymce

# $(document).ready(function() {
#   tinyMCE.init({
#      mode: 'textareas',
#      theme: 'advanced'
#    });
# });
$(document).ready ->
  tinyMCE.init
    mode: 'textareas'
    # theme: 'modern'
    # plugins: "lists"
    theme: 'inlite',
    plugins: 'lists table link paste contextmenu textpattern autolink codesample',
    insert_toolbar: 'quickimage quicktable media codesample',
    selection_toolbar: 'bold italic | quicklink h2 h3 blockquote',
    inline: true,
    # toolbar: "numlist bullist"
    # plugins: "advlist"
    # inline: true
  return
