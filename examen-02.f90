PROGRAM gaussian_elimination
    IMPLICIT NONE

    INTEGER,PARAMETER::n=5
    REAL(8),PARAMETER::pi=3.14159265358979323846
    REAL(8),PARAMETER::h=pi/(n+1)
    INTEGER::i

    REAL(8),DIMENSION(n,n+1)::a=0.0
    REAL(8),DIMENSION(n)::y
    REAL(8),DIMENSION(n)::x
    REAL(8),DIMENSION(n)::u

    OPEN(1,FILE='output.txt')

    ! Ejemplo de Numerical Methods... de Bose
    !a = reshape([1, 7, 13, 11, 2, 10, 6, 14, 3, 5, 2, 8, 4, 2, -3, -1, 10, 40, 34, 64], [n, n+1])

    DO i=1,n
        x(i)=i*h
        ! Solución analítica
        u(i)=sin(x(i))
    END DO

    CALL esquema(n,a)
    CALL imprimeMatriz(n,a)


    !CALL gauss(n,a,y)

    !PRINT *,"RESULTADOS"
    !DO i=1,n
    !    PRINT *, "y", i, y(i)
    !END DO

    ! Esto para escribir a un archivo
    !WRITE(1,9)"X=",(x(i),i=1,n)

    ! Formatos de escritura
    !8 FORMAT(a,/,3(4(f7.2,3x),/))
    !9 FORMAT(a,/,3(f7.2,/))

END PROGRAM

SUBROUTINE pivota(n,a,j)
    IMPLICIT NONE
    INTEGER::n,i,j,k
    REAL(8),DIMENSION(n,n+1)::a
    REAL(8),DIMENSION(n+1)::t

    k=j
    DO i=j,n
        IF(ABS(a(i,j))>ABS(a(k,j))) k=i
    END DO

    t=a(j,:)
    a(j,:)=a(k,:)
    a(k,:)=t
END SUBROUTINE

! Elimina el primer coeficiente de la fila i al sumarla con la fila i - 1 escalada
SUBROUTINE elimina(n,a,j)
    IMPLICIT NONE
    INTEGER::n,i,j
    REAL(8),DIMENSION(n,n+1)::a

    DO i=j+1,n
        a(i,:)=a(i,:)-a(j,:)*a(i,j)/a(j,j)
    END DO
END SUBROUTINE

! Sustituye desde la última fila para encontrar la solución
SUBROUTINE retrosus(n,a,y)
    IMPLICIT NONE
    INTEGER::n,i,j
    REAL(8),DIMENSION(n,n+1)::a
    REAL(8),DIMENSION(n)::y
    REAL(8)::s

    DO i=n,1,-1
        s=a(i,n+1)
        DO j=i+1,n
            s=s-a(i,j)*y(j)
        END DO
        y(i)=s/a(i,i)
    END DO
END SUBROUTINE

SUBROUTINE imprimeMatriz(n,a)
    INTEGER::n,i,j
    REAL(8),DIMENSION(n,n+1)::a

    DO i=1,n
        PRINT *, (a(i,j),j=1,n+1)
    END DO
END SUBROUTINE

! Algoritmo de eliminación gaussiana completo
SUBROUTINE gauss(n,a,y)
    INTEGER::n,j
    REAL(8),DIMENSION(n,n+1)::a
    REAL(8),DIMENSION(n)::y

    PRINT *,"Matriz aumentada"
    CALL imprimeMatriz(n,a)

    DO j=1,n
        CALL pivota(n,a,j)
        CALL elimina(n,a,j)
    END DO

    CALL retrosus(n,a,y)
END SUBROUTINE

! Crea la matriz aumentada que representa el esquema de diferencias finitas
SUBROUTINE esquema(n,a)
    INTEGER::n,i
    REAL(8),DIMENSION(n,n+1)::a

    DO i=1,n
        a(i,i)=2-h*h
        IF (i .GT. 1) THEN
            a(i,i-1) = 1.0
            a(i-1,i) = 1.0
        END IF
    END DO

    a(1,n+1) = -1
    a(n,n+1) = 1

END SUBROUTINE
