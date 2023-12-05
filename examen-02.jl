using LinearAlgebra, DataFrames, CSV

h = pi / 20

# Construcción del esquema de diferencias finitas
dv = (h^2 - 2) * ones(1,19) |> vec
ev = ones(1,18) |> vec
A  = SymTridiagonal(dv, ev)
B = zeros(19)
B[1] = -1.0
B[19] = 1.0

# Solución Numérica
Y = A \ B

# Solución Analítica
X = h:h:pi-h
U = cos.(X)

println("Numérica","\t\t", "Analítica")
for i in 1:1:19
    println(Y[i],"\t", U[i])
end

df = DataFrame(num_sol=Y)
CSV.write("resultados-julia.csv", df)
