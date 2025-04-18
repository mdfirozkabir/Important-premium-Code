@echo off
setlocal

set /p query="Enter your search: "
set "query=%query: =+%"
set "source_lang=bn"
set "target_lang=en"
set "text_url=%query: =%%2%"
start "" "https://translate.google.com/?sl=%source_lang%&tl=%target_lang%&text=%text_url%&op=translate"
endlocal
