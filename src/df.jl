using Plots  
  
# 创建第一个子图  
subplot(2, 1, 1) # 2行1列，当前是第1个子图  
x1 = 0:0.1:10  
y1 = sin(x1)  
plot(x1, y1, label = "sin(x)", title = "First Plot")  
  
# 创建第二个子图  
subplot(2, 1, 2) # 2行1列，当前是第2个子图  
x2 = 0:0.1:10  
y2 = cos(x2)  
plot(x2, y2, label = "cos(x)", title = "Second Plot")  
  
# 显示图表  
display()