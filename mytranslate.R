#' @title Language Translation
#' @description # Defining own function to translate using the RYandexTranslate package (https://github.com/mukul13/RYandexTranslate)
#' This is because the original RYandexTranslate::translate() function has an issue with spaces-gives a lexical error.(https://github.com/mukul13/RYandexTranslate/issues/2)
#' @aliases mytranslate
#' @param api_key  132ken38rnfjefnjnf
#' @param text "traitement  rapide de la demande"
#' @param lang en
#' @return data frame
#' @examples mytranslate(api_key,survey$Survey.Comment[i],"en")[2]
#' @name mytranslate

mytranslate <- function(api_key, text = "", lang = "")
{
  url = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
  url = paste(url, "key=", api_key, sep = "")
  if (text != "") {
    url = paste(url, "&text=", text, sep = "")
  }
  if (lang != "") {
    url = paste(url, "&lang=", lang, sep = "")
  }
  url = gsub(pattern = " ", replacement = "%20", x = url)
  d = RCurl::getURL(url, ssl.verifyhost = 0L, ssl.verifypeer = 0L)
  d = jsonlite::fromJSON(d)
  d$code = NULL
  return(d)
}
