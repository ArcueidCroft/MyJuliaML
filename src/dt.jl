using DecisionTree, MLJ
using CSV, DataFrames
using LinearAlgebra

function Mainf()
    # train_x = (0:0.02:1)
    # train_y = randn(2, length(train_x))
    n_basis = 6

    train_set = CSV.read("./stokes_up.csv", DataFrame, header=false)
    x = Array(train_set[1, :])
    x = reshape(x, length(x), 1)
    y = Array(train_set[2:end, :])
    u, s, v = svd(y) 
    Z = u[:, 1:n_basis]
    paras = Z' * y
    paras = Array(transpose(paras))
    _p = []
    for i in eachindex(paras[:, 1])
        push!(_p, paras[i, :])
    end
    paras = _p

    model = build_forest(paras, x)
    apply_forest(model, [0.75])
    # n, m,L = 10^3, 5,4
    # features = randn(n, m)
    # weights = rand( m,L)
    # labels = [features[[i],:]*weights for i in 1:n]
    # model = build_tree(labels, features)
    # # apply learned model
    # apply_tree(model, [-0.9,3.0,5.1,1.9,0.0])

    # RandomForest = @load RandomForestRegressor pkg = DecisionTree
    # myrandforest = RandomForest(max_depth = -1,
    #                             n_trees = 10,
    #                             # min_samples_split = 5,
    #                             min_samples_leaf = 2
    #                             )
    # # X, y = @load_iris
    # mach = machine(myrandforest, x, paras) |> MLJ.fit!
    # # println(X)
end

Mainf()