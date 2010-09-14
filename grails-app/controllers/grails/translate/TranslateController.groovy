package grails.translate

import com.google.api.translate.Language;
import com.google.api.translate.Translate;
class TranslateController {

    def index = { render 'index' }
	def translate = {   
		println params	
        Translate.setHttpReferrer('http://localhost');
        def translatedText = Translate.execute(params['roadname'], Language.ENGLISH, Language.THAI);
		render translatedText	
		render(builder:"json") {
			output(source:params['roadname'] ,translated:translatedText)

		}
	}
	def form = { } 
}
