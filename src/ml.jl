using Flux
using Plots
using LinearAlgebra
# using MLDatasets, Random, Statistics

# x_train, ytrain = MLDatasets.MNIST(split = :train)
# x_test, y_test = MLDatasets.MNIST(split = :test)

model = Chain(  x->[x],
                Dense(1 => 32, tanh),
                Dense(32 => 1),
                first)


x = (0:0.02:2pi)
y = cos.(x)
data = []
for i = 1:length(x)
    push!(data, (x[i], y[i]))
end
println(data)
loss(xx, yy) = sum(abs.(model.(x) .- y))

# Flux.train!(loss, Flux.params(model), data, ADAM(0.02))
println("step 1")

for i = 1:500
    Flux.train!(loss, Flux.params(model), data, ADAM(0.02))
    if i%100 == 0
        println("i = $i")
    end
end

plot(x, cos)
_y = model.(x)
plot!(x, _y)