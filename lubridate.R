##### <lubridate> library
library(lubridate)
library(hms)

#### 시각을 나타내는 방법
# 1. 데이트형 <date>, 날짜
# 2. 타임형 <time>, 시간
# 3. 데이트타임형 <dttm>, 날짜+시간

### 날짜 및 시간 데이터 생성 1
today() # 데이트형 현재 시각
now()   # 데이트타임형 현재 시각

### 날짜 및 시간 데이터 생성 2
# 1. 파싱함수 사용 <readr>
#   --> parse_date, parse_time, parse_datetime
#   --> 공통 파라미터 format = "%Y%m%d"
#   --> 문자형 벡터를 입력으로 받는다 
# 2. 도우미 함수 사용
#   --> y(연도), m(월), d(일)을 조합하여 사용
#   --> 예시 : ymd, mdy, dmy
library(tidyverse)
parse_date(x="2017_03_01", format="%Y_%m_%d")
ymd(20170301); ymd("2017.03.01")

### 날짜 및 시간 데이터 생성 3
# 개별 구성요소에서 날짜 및 시간 데이터 생성
# --> 데이트(&타임)형의 개별 구성요소들이 여러 열에 걸쳐 있는 경우
# --> make_date(), make_datetime() 함수 사용
library(nycflights13)
flights %>% select(year, month, day, hour, minute) %>% 
  mutate(time = make_datetime(year, month, day, hour, minute)) %>% 
  select(time, everything())



#### 데이트-타임형 구성요소
# <date>, <time>, <dttm> 객체에 아래 함수 적용
# year()   : 연도를 반환
# month()  : 월을 숫자로 반환
# mday()   : 해당 월에서 며칠이 지났는지 반환
# yday()   : 해당 년도에서 며칠이 지났는지 반환
# wday()   : 한주에서 며칠인지 반환 (일요일:1 ~ 토요일:7)
# hour()   : 시간을 반환
# minute() : 분을 반환
# second() : 초를 반환
# month와 wday에서 label=T로 설정하면 월이나 일의 약식 이름 반환하며 abbr=F를 추가로 설정하면 full name 반환
# 반올림함수 : floor_date, round_date, ceiling_date
# 구성요소 설정 : update(datetime, ...)
time <- Sys.time()
time %>% year()
time %>% month()
time %>% mday()
time %>% yday()
time %>% wday()
time %>% hour()
time %>% minute()
time %>% second()
time %>% month(label=T)
time %>% month(label=T, abbr=F)

x <- ymd_hms("2017-12-02 06:48:53.23"); x
round_date(x, unit="minute")
round_date(x, unit="5 mins")
round_date(x, unit="hour")
round_date(x, unit="3 hour")
round_date(x, unit="day")
round_date(x, unit="week")
round_date(x, unit="quarter")
