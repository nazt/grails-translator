package grails.translate

import com.google.api.translate.Language;
import com.google.api.translate.Translate;
class TranslateController {

    def index = { redirect(action: form) }
	def go = {   
        Translate.setHttpReferrer('http://g-translator.appspot.com');
        def translatedText = Translate.execute(params['input'], Language.ENGLISH, Language.THAI);
		render(builder:"json") {
			output(source:params['input'] ,translated:translatedText)
		}
	}
	def form = { } 
	def html = { }
}
