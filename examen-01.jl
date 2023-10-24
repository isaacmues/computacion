# Examen de computación

using Printf

x = 0.0:0.1:2.0
l = [0.0000, 0.0999, 0.1998, 0.2995, 0.3988, 0.4976, 0.5960, 0.6936, 0.7905,
     0.8865, 0.9815, 1.0755, 1.1682, 1.2596, 1.3497, 1.4382, 1.5252,
     1.6104, 1.6939, 1.7755, 1.8551]

# Integración numérica por regla del trapecio
# ∫ f dx ≈ [f(a) + f(b)](b - a) / 2
trapezoidal(fa, fb, dx) = 0.5 * (fb + fa) * dx

# El campo eléctrico estará dado por
# E = ∫ [λ /(x - 3)²] dx
electric_field(l, r) = 8.98e9 * l / r^2

@printf("Carga total:  %f C\n", sum(trapezoidal(l[1:20], l[2:21], 0.1)))

@printf("Campo eléctrico: %f V/m\n",
        sum(
            trapezoidal(
                map(electric_field, l[1:20], x[1:20] .- 3.0),
                map(electric_field, l[2:21], x[2:21] .- 3.0),
                0.1
               )
           )
       )


