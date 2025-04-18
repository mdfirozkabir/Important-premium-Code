@echo off
set /p query="Enter your search: "
set query=%query: =+%
start https://www.youtube.com/results?search_query=%query%