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
  VisitPageParameter: 'VisitPageParameter',
  AccessPage: 'AccessPage',
  AccessBox: 'AccessBox'
}

function trackAccessPage(page){
  page = page === '' ? 'home' : page
  _gaq.push(['_trackEvent', gaEvents['AccessPage'], page]);
}

function trackAccessBox(element){
  var boxMarker = element.attr('data-boxable-type') + '/' + element.attr('data-boxable-name');
  
  _gaq.push(['_trackEvent', gaEvents['AccessBox'], boxMarker]);
}

function trackUtmParameter(){
  utmId = getUtmParameter('utm_id');
  utmSource = getUtmParameter('utm_source');
  utmMedium = getUtmParameter('utm_medium');
  utmTerm = getUtmParameter('utm_term');
  utmContent = getUtmParameter('utm_content');
  utmCampaign = getUtmParameter('utm_campaign');
  utmParams = '';
  if(typeof(utmId) != 'undefined'){
    utmParams += 'utm_id: '+ utmId;
  }
  if(typeof(utmSource) != 'undefined') {
    utmParams += 'utm_source: '+ utmSource;
  } 
  if(typeof(utmMedium) != 'undefined') {
    utmParams += 'utm_medium: '+ utmMedium;
  }
  if(typeof(utmTerm) != 'undefined'){
    utmParams += 'utm_term: '+ utmTerm;
  }
  if(typeof(utmContent) != 'undefined'){
    utmParams += 'utm_content: '+ utmContent
  }
  if(typeof(utmCampaign) != 'undefined'){
    utmParams += 'utm_id: '+ utmCampaign;
  }
  _gaq.push(['_trackEvent', gaEvents['VisitPageParameter'], utmParams]);
}

var getUtmParameter = function(term) {
  if(top.location==self.location){
    r = document.referrer;
  }else{
    r = top.location;
  }
  qs = parseQuery(self.location.toString());
  u = qs[term];

  if(u == undefined && r.toString().length > 0){
    u = getDomain(r.toString());
    u = u.toString().replace(/^\./,"");
  }
  cd = getDomain(self.location);
  cd = cd.toString().replace(/^\./,"");
  if(u == cd){
    u = "";
  }
  return u;
};

function parseQuery(url) {
  var queries = {};
  var query = url.split("?")[1];
  if(!query){
    return queries;
  }
  var vars = query.split('&');
  for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split('=');
    queries[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1]);
  }
  return queries;
};

function urlDomain(url) {
  var a = document.createElement('a');
  a.href = url;
  return a.hostname;
}

var getDomain = function(url){
  var dm = '';
  hn=location.hostname;
  if(url){
    hn = urlDomain(url)
  }
  str=hn.replace(/\.(com|net|org$)\.?.*/,"");
  if(str.lastIndexOf(".") == -1){
    dm = "." + hn;
  }else{
    str = str.substring(str.lastIndexOf("."));
    dm = hn.substring(hn.lastIndexOf(str));
  }
  return dm;
};