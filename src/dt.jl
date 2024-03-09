using DecisionTree, MLJ, JLD2
using CSV, DataFrames
using LinearAlgebra

function Mainf()
    n_basis = 6

    train_set = CSV.read("./stokes_up.csv", DataFrame, header=false)
    x = Array(train_set[1, :])
    x = reshape(x, length(x), 1)
    y = Array(train_set[2:end, :])
    u, s, v = svd(y) 
    Z = u[:, 1:n_basis]

    paras = Z' * y 
    paras = Array(
                  transpose(paras)
                #   paras
                  )

    _p = []
    for i in eachindex(paras[:, 1])
        push!(_p, paras[i, :])
    end
    paras = _p

    # paras = Array(randn(length(x[: ,1])))


    model = build_forest(paras, x)
    apply_forest(model, [0.75])
    paras
    @save "./2024-3-2/test.model" model
    
    # ! bugs with MLJ.jl
    # RandomForest = MLJ.@load RandomForestRegressor pkg = DecisionTree
    # myrandforest = RandomForest(#max_depth = -1,
    # #                             n_trees = 10,
    # #                             # min_samples_split = 5,
    # #                             min_samples_leaf = 2
    #                             )
    
    # # # # b = fit_data_scitype(myrandforest)
    # mach = machine(myrandforest, x, paras) |> MLJ.fit!

    # scitype(paras)
end

Mainf()


# TEST TEST