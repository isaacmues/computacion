PROGRAM gaussian_elimination
    IMPLICIT NONE

    INTEGER,PARAMETER::n=3
    REAL(8), PARAMETER :: pi = 3.14159265358979323846
    REAL(8), PARAMETER :: h = pi / 20.0
    INTEGER::i,j

    REAL(8),DIMENSION(n,n+1)::a
    REAL(8),DIMENSION(n)::y

    OPEN(1,FILE='output.txt')

    ! Ejemplo de Numerical Methods... de Bose
    a = reshape([1, 3, 2, 1, 1, -3, 2, -3, -5, 4, -4, -5], [n, n+1])

    PRINT *,"Matriz aumentada"
    CALL imprimeMatriz(n,a)

    DO j=1,n
        CALL pivota(n,a,j)
        CALL elimina(n,a,j)
    END DO

    PRINT *,"Después de la eliminación"
    CALL imprimeMatriz(n,a)

    CALL retrosus(n,a,y)

    PRINT *,"RESULTADOS"
    DO i=1,n
        PRINT *, "y", i, y(i)
    END DO

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

SUBROUTINE elimina(n,a,j)
    IMPLICIT NONE
    INTEGER::n,i,j
    REAL(8),DIMENSION(n,n+1)::a

    DO i=j+1,n
        a(i,:)=a(i,:)-a(j,:)*a(i,j)/a(j,j)
    END DO
END SUBROUTINE

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
