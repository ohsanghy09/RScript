install.packages("readxl")
library(readxl)

#전체 데이터
data = read_excel("C:/Users/AISW-509-189/Desktop/ASOS.xlsx")

data


install.packages("gganimate")
install.packages("gifski")
library(gganimate)
library(ggplot2)
library(gifski)


anim = ggplot(data=data, aes(x=일시, y=평균기온, group=지점명)) + 
  geom_line(aes(color=지점명), size=2) + 
  geom_point(aes(color=지점명), size=5, alpha=0.5) +
  labs(title="최근 일주일간 지점별 평균기온", x="일시", y="평균기온")+
  transition_reveal(일시)



#애니메이션 효과 및 실행
animate(anim, width=500, height=300, duration=5, render=gifski_renderer(loop=5))


#애니메이션으로 ENCODING된 그래프를 GIF 형식의 이미지로 저장하는 방법
anim_save("최근 일주일간 지점별 평균기온.gif", path="C:/Users/AISW-509-189/Desktop/R_Data")


