install.packages("RCurl")
install.packages("RmecabKo")
install.packages("wordcloud2")

library(RCurl)
library(XML)
library(wordcloud2)
library(RmecabKo)

# 형태소 분석을 위한 기능 설치
install_mecab("C:/RmecabKo/mecab")
library(RmecabKo)

# Naver Open API에서 뉴스 검색을 위한 요청 주소를 작성
searchUrl = "https://openapi.naver.com/v1/search/news.xml"
Client_ID = "OXPY9oLstg5SMQ8Su1T3"
Client_Secret = "AmDyHr_aJU"

# 검색하고자 하는 키워드가 한글일 경우 UTF-8로 인코딩
query = URLencode(iconv("2024년도 인기팝송", "UTF-8"))

# 변수에 저장된 searchUrl, Client_Id, Client_Secret, query 하나의 url로 붙인다.
url = paste(searchUrl, "?query=", query, "&display=20", sep= "")
url

# url을 사용하여 검색한 결과 페이지를 요청해 반환
doc = getURL(url, httpheader=c('Content-Type'="application/xml", 'X-Naver-Client-Id'=Client_ID, 'X-Naver-Client-Secret'=Client_Secret))
doc


# 데이터 전처리 과정

# XML 구조로 변환
xmlFile = xmlParse(doc)
xmlFile


# XML 파일의 <item> 태그를 기준으로 데이터프레임으로 변환
df = xmlToDataFrame(getNodeSet(xmlFile, "//item"))
df
str(df)

# 전체 내용 중에서 description 컬럼의 값만 추출
description = df[, 4]
description


# 불필요한 글자들 삭제(empty String으로 제거, \\d는 숫자 제거, 태그, 큰따옴표)
description2 = gsub("\\d|<b>|</b>|&quot", "", description)
description2

# 뉴스별로 내용 중에 명사만 추출(인코딩)
nouns = nouns(iconv(description2, "UTF-8"))
nouns

# 기사 한 개당 나누어져 있는 벡터를 하나의 벡터로 통합(F로 설정해서 단어들만 통합)
nouns.all = unlist(nouns, use.names = F)
nouns.all

# 의미가 있는 두 글자 이상인 단어들만 추출
nouns.all.2 = nouns.all[nchar(nouns.all)>=2]
nouns.all.2

# 단어들의 빈도수 확인
nouns.freq = table(nouns.all.2)
nouns.freq

# 단어들의 빈도수를 데이터프레임으로 변환
nouns.df = data.frame(nouns.freq)
nouns.df


# 데이터프레임의 값 중에서 빈도수를 기준으로 내림차순 정렬
nouns.df.sortdesc = nouns.df[order(-nouns.df$Freq),]
nouns.df.sortdesc


# 워드 클라우드를 사용하여 빈도수의 따른 단어들을 시각화
wordcloud2(nouns.df.sortdesc, size=1, rotateRatio = 0.5)

wordcloud2(nouns.df.sortdesc, size=0.3, shape= 'star')













