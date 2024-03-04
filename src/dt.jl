using DecisionTree, MLJ

function Mainf()
    RandomForest = @load RandomForestClassifier pkg = DecisionTree
    myrandforest = RandomForest(max_depth = -1,
                                n_trees = 10,
                                min_samples_split = 5,
                                min_samples_leaf = 2
                                )
    X, y = @load_iris
    mach = machine(myrandforest, X, y) |> MLJ.fit!
    println(X)
end

Mainf()