set.seed(1)
train_x = train_x_1
train_y = train_y_1
test_x = test_x_1
test_y = test_y_1
score_x=score_x_1
score_y = score_y_1

train_data = train_data_1
test_data = test_data_1
data_scoreMSE = data_score_1
##岭回归
#生成一个lambda网格
grid <- 10^seq(5, -5, length=100)

star = Sys.time()

train_control <- trainControl(method = "timeslice",
                              initialWindow = floor(0.7*nrow(train_x)),
                              horizon = 5,
                              skip = 5,
                              fixedWindow = TRUE,
                              allowParallel = TRUE)

tuneGrid <- expand.grid(
  alpha = 0,
  lambda = 10^seq(5, -5, length=10)
) # 尝试不同的抽样比例


model <- train(train_x, train_y,
               method = "glmnet",
               tuneGrid = tuneGrid,
               trControl = train_control);


# 打印最佳模型
#print(model)


end = Sys.time()

# 输出最佳模型和参数
#print(paste("total cv time", end-star))
#print(model$results)
#print(model$bestTune)

#用最优调节参数对测试集作预测， 得到预测均方误差
ridge.pred <- predict(model, newdata = test_x)
mse <- mean((ridge.pred - test_data[, 1])^2)
print(paste("MSE of the rest 30% data (1 month prediction): ", mse)) #mse=0.0137244296926847"
#print(paste("regression prediction：", ridge.pred))

ridge.pred <- predict(model, newdata  = score_x )
mse_score <- mean((ridge.pred - data_scoreMSE[, 1])^2)
print(paste("MSE of real test data (1 month prediction): ", mse_score)) #mse=0.0898581804404448"
#print(paste("regression prediction：", ridge.pred))

##LASSO
#生成一个lambda网格
grid <- 10^seq(5, -5, length=100)

star = Sys.time()

train_control <- trainControl(method = "timeslice",
                              initialWindow = floor(0.7*nrow(train_x)),
                              horizon = 5,
                              skip = 5,
                              fixedWindow = TRUE,
                              allowParallel = TRUE)

tuneGrid <- expand.grid(
  alpha = 1,
  lambda = 10^seq(5, -5, length=15)
) # 尝试不同的抽样比例


model <- train(train_x, train_y,
               method = "glmnet",
               tuneGrid = tuneGrid,
               trControl = train_control);


# 打印最佳模型
#print(model)


end = Sys.time()

# 输出最佳模型和参数
#print(paste("total cv time", end-star))
#print(model$results)
#print(model$bestTune)

#用最优调节参数对测试集作预测， 得到预测均方误差
lasso.pred <- predict(model, newdata = test_x)
mse <- mean((lasso.pred - test_data[, 1])^2)
print(paste("MSE of the rest 30% data (1 month prediction): ", mse)) #mse=0.0137244296926847"
#print(paste("regression prediction：",lasso.pred))

lasso.pred <- predict(model, newdata  = score_x )
mse_score <- mean((lasso.pred - data_scoreMSE[, 1])^2)
print(paste("MSE of real test data (1 month prediction): ", mse_score)) #mse=0.0898581804404448"
#print(paste("regression prediction：", lasso.pred))




#3 month
train_x = train_x_3
train_y = train_y_3
test_x = test_x_3
test_y = test_y_3
score_y = score_y_3

train_data = train_data_3
test_data = test_data_3
data_scoreMSE = data_score_3

set.seed(3)
##岭回归
#生成一个lambda网格
grid <- 10^seq(5, -5, length=100)

star = Sys.time()

train_control <- trainControl(method = "timeslice",
                              initialWindow = floor(0.7*nrow(train_x)),
                              horizon = 5,
                              skip = 5,
                              fixedWindow = TRUE,
                              allowParallel = TRUE)

tuneGrid <- expand.grid(
  alpha = 0,
  lambda = 10^seq(5, -5, length=10)
) # 尝试不同的抽样比例


model <- train(train_x, train_y,
               method = "glmnet",
               tuneGrid = tuneGrid,
               trControl = train_control);


# 打印最佳模型
#print(model)


end = Sys.time()

# 输出最佳模型和参数
#print(paste("total cv time", end-star))
#print(model$results)
#print(model$bestTune)

#用最优调节参数对测试集作预测， 得到预测均方误差
ridge.pred <- predict(model, newdata = test_x)
mse <- mean((ridge.pred - test_data[, 1])^2)
print(paste("MSE of the rest 30% data (3 month prediction): ", mse)) #mse=0.0137244296926847"
#print(paste("regression prediction：", ridge.pred))

ridge.pred <- predict(model, newdata  = score_x )
mse_score <- mean((ridge.pred - data_scoreMSE[, 1])^2)
print(paste("MSE of real test data (3 month prediction): ", mse_score)) #mse=0.0898581804404448"
#print(paste("regression prediction：", ridge.pred))

##LASSO
#生成一个lambda网格
grid <- 10^seq(5, -5, length=100)

star = Sys.time()

train_control <- trainControl(method = "timeslice",
                              initialWindow = floor(0.7*nrow(train_x)),
                              horizon = 5,
                              skip = 5,
                              fixedWindow = TRUE,
                              allowParallel = TRUE)

tuneGrid <- expand.grid(
  alpha = 1,
  lambda = 10^seq(5, -5, length=15)
) # 尝试不同的抽样比例


model <- train(train_x, train_y,
               method = "glmnet",
               tuneGrid = tuneGrid,
               trControl = train_control);


# 打印最佳模型
#print(model)


end = Sys.time()

# 输出最佳模型和参数
#print(paste("total cv time", end-star))
#print(model$results)
#print(model$bestTune)

#用最优调节参数对测试集作预测， 得到预测均方误差
lasso.pred <- predict(model, newdata = test_x)
mse <- mean((lasso.pred - test_data[, 1])^2)
print(paste("MSE of the rest 30% data (3 month prediction): ", mse)) #mse=0.0137244296926847"
#print(paste("regression prediction：",lasso.pred))

lasso.pred <- predict(model, newdata  = score_x )
mse_score <- mean((lasso.pred - data_scoreMSE[, 1])^2)
print(paste("MSE of real test data (3 month prediction): ", mse_score)) #mse=0.0898581804404448"
#print(paste("regression prediction：", lasso.pred))

#12 month
train_x = train_x_12
train_y = train_y_12
test_x = test_x_12
test_y = test_y_12
score_y = score_y_12

train_data = train_data_12
test_data = test_data_12
data_scoreMSE = data_score_12

set.seed(12)
##岭回归
#生成一个lambda网格
grid <- 10^seq(5, -5, length=100)

star = Sys.time()

train_control <- trainControl(method = "timeslice",
                              initialWindow = floor(0.7*nrow(train_x)),
                              horizon = 5,
                              skip = 5,
                              fixedWindow = TRUE,
                              allowParallel = TRUE)

tuneGrid <- expand.grid(
  alpha = 0,
  lambda = 10^seq(5, -5, length=10)
) # 尝试不同的抽样比例


model <- train(train_x, train_y,
               method = "glmnet",
               tuneGrid = tuneGrid,
               trControl = train_control);


# 打印最佳模型
#print(model)


end = Sys.time()

# 输出最佳模型和参数
#print(paste("total cv time", end-star))
#print(model$results)
#print(model$bestTune)

#用最优调节参数对测试集作预测， 得到预测均方误差
ridge.pred <- predict(model, newdata = test_x)
mse <- mean((ridge.pred - test_data[, 1])^2)
print(paste("MSE of the rest 30% data (3 month prediction): ", mse)) #mse=0.0137244296926847"
#print(paste("regression prediction：", ridge.pred))

ridge.pred <- predict(model, newdata  = score_x )
mse_score <- mean((ridge.pred - data_scoreMSE[, 1])^2)
print(paste("MSE of real test data (3 month prediction): ", mse_score)) #mse=0.0898581804404448"
#print(paste("regression prediction：", ridge.pred))

##LASSO
#生成一个lambda网格
grid <- 10^seq(5, -5, length=100)

star = Sys.time()

train_control <- trainControl(method = "timeslice",
                              initialWindow = floor(0.7*nrow(train_x)),
                              horizon = 5,
                              skip = 5,
                              fixedWindow = TRUE,
                              allowParallel = TRUE)

tuneGrid <- expand.grid(
  alpha = 1,
  lambda = 10^seq(5, -5, length=15)
) # 尝试不同的抽样比例


model <- train(train_x, train_y,
               method = "glmnet",
               tuneGrid = tuneGrid,
               trControl = train_control);


# 打印最佳模型
#print(model)


end = Sys.time()

# 输出最佳模型和参数
#print(paste("total cv time", end-star))
#print(model$results)
#print(model$bestTune)

#用最优调节参数对测试集作预测， 得到预测均方误差
lasso.pred <- predict(model, newdata = test_x)
mse <- mean((lasso.pred - test_data[, 1])^2)
print(paste("MSE of the rest 30% data (12 month prediction): ", mse)) #mse=0.0137244296926847"
#print(paste("regression prediction：",lasso.pred))

lasso.pred <- predict(model, newdata  = score_x )
mse_score <- mean((lasso.pred - data_scoreMSE[, 1])^2)
print(paste("MSE of real test data (12 month prediction): ", mse_score)) #mse=0.0898581804404448"
#print(paste("regression prediction：", lasso.pred))