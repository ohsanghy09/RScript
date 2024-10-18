install.packages("readxl")
library(readxl)

#전체 데이터
data = read_excel("C:/Users/AISW-509-189/Desktop/week.xls", sheet = "Sheet1")

data
str(data$날짜)


install.packages("gganimate")
install.packages("gifski")
library(gganimate)
library(ggplot2)
library(gifski)


anim = ggplot(data=data, aes(x=날짜, y=초미세먼지농도, group=지역)) + 
  geom_line(aes(color=지역), size=2) + 
  geom_point(aes(color=지역), size=5, alpha=0.5) +
  labs(title="주간 지역별 초미세먼지농도", x="날짜", y="초미세먼지농도")+
  transition_reveal(as.Date(날짜))



#애니메이션 효과 및 실행
animate(anim, width=500, height=300, duration=5, render=gifski_renderer(loop=5))


#애니메이션으로 ENCODING된 그래프를 GIF 형식의 이미지로 저장하는 방법
anim_save("주간 지역별 초미세먼지 농도.gif", path="C:/Users/AISW-509-189/Desktop/R_Data")


