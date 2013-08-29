var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-43541604-1']);
_gaq.push(['_setDomainName', 'none']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

var gaEvents = {
  AccessPage: 'AccessPage'
}

function gatAccessPage(page){
  page = page === '' ? 'home' : page
  _gaq.push(['_trackEvent', gaEvents['AccessPage'], page]);
}