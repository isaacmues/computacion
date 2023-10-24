program carga_y_campo_electrico
    implicit none

    real(8), dimension(21) :: x, l
    real(8) :: dx, carga_total, campo_total
    integer :: i

    ! Define el arreglo para x
    dx = 0.1
    do i = 1, 21
        x(i) = 0.0d0 + (i - 1) * dx
    end do

    ! Define el arreglo para lambda
    l = [0.0000d0, 0.0999d0, 0.1998d0, 0.2995d0, 0.3988d0, 0.4976d0, 0.5960d0, 0.6936d0, 0.7905d0, &
         0.8865d0, 0.9815d0, 1.0755d0, 1.1682d0, 1.2596d0, 1.3497d0, 1.4382d0, 1.5252d0, 1.6104d0, &
         1.6939d0, 1.7755d0, 1.8551d0]


    ! Calcula la carga total
    ! ∫ λ dx
    carga_total = 0.0d0
    do i = 1, 20
        carga_total = carga_total + integral(l(i), l(i + 1), dx)
    end do
    print *, "Carga total:     ", carga_total, " C"

    ! Calcula el campo eléctrico
    ! ∫ λ / (x - 3)² dx
    campo_total = 0.0d0
    do i = 1, 20
        campo_total = campo_total + &
            integral(campo_electrico(l(i), x(i) - 3.0d0), campo_electrico(l(i + 1), x(i + 1) - 3.0d0), dx)
    end do
    print *, "Campo eléctrico: ", campo_total, " N/m^2"

contains

    ! Función para calcular la integral por medio de la regla del trapecio
    real(8) function integral(fa, fb, dx)
        real(8), intent(in) :: fa, fb, dx
        integral = 0.5d0 * (fb + fa) * dx
    end function integral

    ! Función que aplica la ley de Coulomb
    real(8) function campo_electrico(l, r)
        real(8), intent(in) :: l, r
        campo_electrico = 8.98e9 * l/ r**2
    end function campo_electrico

end program carga_y_campo_electrico
