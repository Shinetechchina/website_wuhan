//= require codemirror
//= require codemirror/addons/mode/overlay
//= require codemirror/modes/xml
//= require codemirror/modes/javascript
//= require codemirror/modes/css
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/liquid

// Initialze codemirror editors
// The liquid mode is from [https://github.com/axtro/codemirror_liquid_mod]
$(function() {
  $('.codemirror-editor').each(function() {
    var textarea = $(this);

    CodeMirror.fromTextArea(this, {
      mode: {name: textarea.data('mode')},
      tabSize: 2,
      lineNumbers: true
    }).on('change', function(cm) {
      cm.save();
    });
  });
});
