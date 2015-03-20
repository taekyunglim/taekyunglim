# 1-1. sample 함수를 사용하여 10000개의 데이터만 샘플링하시오.
  
library(ggplot2)
set.seed(201430428)
lim <- diamonds[sample(1:dim(diamonds)[1], 10000),]
head(lim)

# 1-2. index를 이용하여 carat, cut, color, price를 선택하여 새로운 object를 만드시오.

lim1 <- lim[,c(2:4,7)]
head(lim1)

# 1-3. 위에서 만든 object에서 cut이 Ideal인 obs을 선택하여 새로운 object를 만드시오.

lim.cut <- subset(lim, cut=="Ideal")
head(lim.cut)

# 1-4. 위에서 만든object에서 color가 E 이고 price가 350 이상인 새로운 object를 만드시오.

lim.cut1 <- subset(lim, color=="E" & price>="350")
head(lim.cut1)

# 1-5. diamonds 데이터(원본)의 price를 cut함수를 이용하여 아래 범주로 만들고 데이터에 price.f라는 새 변수로 추가 하시오.

price.f <- cut(diamonds$price, breaks = c(300, 1000, 3000, 5000, 10000, 20000))
diamonds1 <- data.frame(diamonds, price.f)
head(diamonds1)

# 2-1. carat 변수에 대한 price 분포

ggplot(data = lim, aes(x = carat, y = price)) + 
  geom_point(aes(color = clarity, size = price, alpha = 0.5))

# 2-2. 문제 1.4에서 만든 변수 price.f를 이용하여 pie chart를 그리시오.

ggplot(data = diamonds1, aes(x = factor(1), fill = price.f)) + 
  geom_bar(width = 1) + 
  coord_polar(theta = 'y')

# 2-3. 문제 1.4에서 만든 object를 이용하여 아래와 같은 그림을 그리시오.

ggplot(data = diamonds1, aes(x = color, fill = cut)) +
  geom_bar(position = 'dodge', stat = 'bin') +
  facet_wrap(~price.f, scale = 'free', nrow = 3)