$("#footer span.footerText a").first().click(function(){
  event.preventDefault();
  orig = $('#mainApp object param[name="flashvars"]').attr('value');
  replacement = orig.replace('superduperdevtime=false', 'superduperdevtime=true');
  $('#mainApp object param[name="flashvars"]').attr('value', replacement);
});
