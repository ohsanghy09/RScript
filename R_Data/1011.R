install.packages("readxl")
library(readxl)

#전체 데이터
data = read_excel("C:/Users/AISW-509-189/Desktop/day.xls", sheet = "Sheet1")

data

install.packages("gganimate")
install.packages("gifski")
library(gganimate)
library(ggplot2)
library(gifski)


anim = ggplot(df, aes(x=지역, y=초미세먼지농도)) + 
  geom_bar(stat = "identity") + 
  # 제목, 라벨 추가
  labs(title="지역별 초미세먼지농도(일평균)", x="지역별", y="초미세먼지농도") + 
  transition_states(지역)
anim


#애니메이션 효과 및 실행
animate(anim, width=NULL, height=NULL, duration=10, render=gifski_renderer(loop=5))


#애니메이션으로 ENCODING된 그래프를 GIF 형식의 이미지로 저장하는 방법
anim_save("일평균 지역별 초미세먼지 농도.gif", path="C:/Users/AISW-509-189/Desktop/R_Data")


