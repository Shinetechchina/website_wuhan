$(function() {
  $('.liquid-editor').each(function() {
    CodeMirror.fromTextArea(this, {
      height: "500px",
      parserfile: "../parseliquid.js"  ,
      stylesheet: ["/assets/codemirror/xmlcolors.css", "/assets/codemirror/liquidcolors.css"],
      path: "/assets/codemirror/",
      textWrapping: false,
      lineNumbers: true
    });
  });
});
