//= require codemirror
//= require codemirror/addons/mode/overlay
//= require codemirror/modes/xml
//= require codemirror/modes/javascript
//= require codemirror/modes/css
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/liquid

// The liquid mode is from [https://github.com/axtro/codemirror_liquid_mod]
$(function() {
  $('.liquid-editor').each(function() {
    CodeMirror.fromTextArea(this, {
      mode: {name: 'htmlmixedliquid'},
      tabSize: 2,
      lineNumbers: true
    });
  });
});
