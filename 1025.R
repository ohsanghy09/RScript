# 행정경계지도와 지진분표 출력
# shapefile 읽어오기

map = st_read("C:/Users/AISW-509-189/Desktop/R_Data/map_datasets/Z_NGII_N3A_G0010000.shp")

map

# WGS84 좌표계로 변환(지구의 모든 곳을 좌표로 설정)
map = st_transform(map, crs=4326)

df = read.xlsx("C:/Users/AISW-509-189/Desktop/R_Data/map_datasets/국내지진목록.xlsx", sheet=1, startRow = 4, colNames = FALSE)
head(df)

# X8열에서 북한으로 시작하는 데이터의 행번호 추출
idx = grep("^북한", df$X8)
# 북한 지역의 x8열의 데이터를 확인
df[idx, "X8"]
# X8열에 북한으로 시작하는 행 삭제
df = df[-idx,]

#df에 있는 6열과 7열의 데이터 중 N과 E를 삭제하는 방법
df[, 6] = gsub("N", "", df[, 6])
df[, 7] = gsub("E", "", df[, 7])

# 6, 7열의 값을 숫자형으로 변환
df[, 6] = as.numeric(df[, 6])
df[, 7] = as.numeric(df[, 7])

df[, 6]

# 포인트 데이터를 sf객체로 변환(포인트 출력)
df_sf = df%>%st_as_sf(coords = c("X7", "X6"), crs=4326)


# 행정경계지도 출력

ggplot() + 
  geom_sf(data = map, fill="white", alpha = 0.5, color="black") + 
  geom_sf(data = df_sf, aes(size=X3), shape=21, fill="red", alpha = 0.3, color="black") +
  theme(legend.position="none") + 
  labs(title="지진분포", x="경도", y="위도")
  
  
# 7장 웹스크랩핑
install.packages("rvest")
library(rvest)

url = "C:/Users/AISW-509-189/Desktop/영화1.html"
html = read_html(url, encoding = "utf-8")
html

# 영화목록 추출
movie = html_nodes(html, "table tr td")%>%
        html_text()
movie


# 영화2.html에 있는 2개의 테이블 중 table태그에 설정된 id값에 따라서 필요한 데이터만 추출

url = "C:/Users/AISW-509-189/Desktop/영화2.html"
html = read_html(url, encoding = "utf-8")
html

# 현재 상영중인(<table id = "movie1">) 영화목록 추출
movie = html_nodes(html, "table tr td")%>%
  html_text()
movie


# 제목, 예매율(1, 2 데이터) 부분만 삭제해서 데이터를 추출
movie1 = html_nodes(html, "#movie1 tr td")[c(-1, -2)]%>%
  html_text()
movie1



# 영화3.html에 있는 2개의 테이블 중 table태그에 설정된 id값에 따라서 필요한 데이터만 추출

url = "C:/Users/AISW-509-189/Desktop/영화3.html"
html = read_html(url, encoding = "utf-8")
html

# 현재 상영중인(클래스가 title1) 영화제목만 추출
movie = html_nodes(html, "title1")%>%
  html_text()
movie


# 현재 상영중인 (클래스가 rate1) 영화 예매율만 추출
movie1 = html_nodes(html, ".rate1")%>%
  html_text()
movie1


# 개봉 예정 영화의 제목만 추출
movie1 = html_nodes(html, ".title2")%>%
  html_text()
movie1


# 개봉 예정 영화의 예매율만 추출
movie1 = html_nodes(html, ".rate2")%>%
  html_text()
movie1






