pkg = installed.packages()
pkg

.libPaths()
data(package="datasets")

#함수 설정
getRectangleArea = function(w, h){
  area = w * h
  return (area)
}

#데이터 값 입력
w = 20
h = 35

#함수 호출
getRectangleArea(w, h)


#커스텀 함수
cal = function(a, b){
  result = a + b
  return (result)
}

#커스텀 함수 출력
cal(3, 4)


# 3장 데이터구조
# 벡터: 선형으로 1개이상의 숫자 또는 문자열들을 저장가능
# 인덱스는 1부터 시작

score=80
score

score=c(95, 78, 92)
score

score[2]=88
score[4]=100
score

name=c("장발장", "자베르", "코제트", "팡틴")
name

name[5] = "웅장한 음악"
name


# 연속적인 값들을 벡터에 저장

#sequence 함수 사용
x1=seq(0, 100, by=10)
x1

# 1씩 증가하는 값 저장
x2=1:10
seq(1, 10, by=1)
x2

# 1씩 감소하는 값 저장
x3=10:1
seq(10, 1, by=-1)
x3

# 지정 값을 5등분
x4=seq(0, 10, length.out=5)
x4

# 반복(repeat) 함수 : rep()
x5=c(1, 2, 3)
y1=rep(x5, times=3)
y1

# 각각 3번씩 반복
x6=c(1, 2, 3)
y2=rep(x6, each=3)
y2

# 연산자

# 산술연산자

#거듭제곱(제곱승) 연산자
10^3

a=5
b=5

r1 = a^b
r1

x=c(10, 20, 30, 40)
y=c(1, 6, 11, 16)
w=c(100, 200)

x+5
x+y
# 벡터 개수가 다를 때는 인덱스 개수가 작은 쪽의 인덱스를 반복해서 연산한다
x+w

# 비교연산자
a=7
b=10

a>b

x=c(10, 20, 30)
x <= 10

# 벡터에 있는 요소의 값들중에 하나라도 비교연산 결과에 true가 있으면 결과는 true
any(x<=10)

# 벡터에 있는 요소의 값들이 비교연산 결과에 true가 되야 결과는 true
all(ㅌ<=10)

# 벡터에서 20이상인 요소를 반환
x[x>=20]

# 논리 연산자: 논리값 TRUE, FALSE로 결과를 반환

x=c(TRUE, TRUE, FALSE, FALSE)
y=c(TRUE, FALSE, TRUE, FALSE)
x | y
x & y
xor (x, y)
!x

# NA(Not Available(결측치):누락된 경우)
# NULL(변수를 선언하고 값을 초기화하지 않은 것)
# Inf(Infinity: 0이 아닌 숫자를 0으로 나누었을때)
# NaN(Not a Number: 0울 0으로 나누었을 때)

z = NULL
z
is.null(z)

k
is.null(k) # k를 찾지 못해서 오류가 발생, 벡터에 값을 넣지 않을 때는 NULL로 대입해야함


y = c(1, 2, 3, NA, 5)
y

z = 5/0
z

t = 0/0
t

# 요인(factor)
# 벡터에 저장된 동일한 값들을 요인으로 찾아내서 대표값들만 분류해서 반환

gender=c("여", "남", "남", "여", "여", "남")
gender

gender.factor = factor(gender)
gender.factor













