


library(rvest)

url = "https://www.airkorea.or.kr/web/sidoQualityCompare?itemCode=10008&pMENU_NO=102"
html = read_html(url)
html

titles = html_nodes(html, "#sidoTable_thead") %>%
  html_text()

titles

# 특수 문자열들을 ""(empty string) 대체
titles = gsub("\r|\n|\t", "", titles)
titles
