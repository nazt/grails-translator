<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head> 
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/> 
    <title>Google AJAX Language API - Basic Translation</title> 
    <script type="text/javascript" src="http://www.google.com/jsapi"></script> 
    <script type="text/javascript"> 
	google.load("jquery", "1.4.2"); 
    google.load("language", "1");
 
    function initialize() {
		// NAzT
		// http://www.together.in.th 
		var callback = function(result) {
			var translated;
			if (result.translation) {
				translated = result.translation;
				jQuery('#translation').html(translated);
				jQuery('#loading').hide();
			}
		};
		jQuery(document).ready(function() {
		    detection = function() {
			    var	text = jQuery('#input').val(); 
				jQuery('#loading').show();
				google.language.detect(text, function(result) {
					if (!result.error && result.language) {
						google.language.translate(text, result.language, "th", callback)
					}
				}); 
			} // end detection
			detection();
			jQuery('#input').keyup(function(){ detection() });
		}); // document.ready
	}
	google.setOnLoadCallback(initialize);
    </script> 
  </head> 
  <body> 
	Input : <input size = "80" type="text" id='input' value = 'Sukhumwit 21, Ari 21, Siam, siam paragon, Victory Monument'/> <img src='http://together.in.th/ajax/loading.gif' id='loading' /> <br \>
	<br \>	
    Output : <span id="translation"></span> 
  </body> 
</html> 

