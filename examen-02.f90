PROGRAM gaussian_elimination
    IMPLICIT NONE

    INTEGER,PARAMETER::n=3
    INTEGER::i,j

    REAL::s
    REAL,DIMENSION(n,n+1)::a
    REAL,DIMENSION(n)::x

    OPEN(1,FILE='output.txt')

    ! Ejemplo de Numerical Methods... de Bose
    a = reshape([1, 3, 2, 1, 1, -3, 2, -3, -5, 4, -4, -5], [n, n+1])

    PRINT *,"Matriz aumentada"
    DO i=1,n
        PRINT *, (a(i,j),j=1,n+1)
    END DO

    ! Eliminación 

    DO j=1,n
        CALL pivot(n,a,j)
        DO i=j+1,n
            ! Elimina la fila i sumando la j escalada
            a(i,:)=a(i,:)-a(j,:)*a(i,j)/a(j,j)
        END DO
    END DO

    PRINT *,"Después de la eliminación"
    DO i=1,n
        PRINT *, (a(i,j),j=1,n+1)
    END DO

    ! Backsubstitution pasar a subrutina
    DO i=n,1,-1
        s=a(i,n+1)
        DO j=i+1,n
            s=s-a(i,j)*x(j)
        END DO
        x(i)=s/a(i,i)
    END DO

    PRINT *,"RESULTADOS"
    DO i=1,n
        PRINT *, "x", i, x(i)
    END DO

    ! Esto para escribir a un archivo
    !WRITE(1,9)"X=",(x(i),i=1,n)

    ! Formatos de escritura
    !8 FORMAT(a,/,3(4(f7.2,3x),/))
    !9 FORMAT(a,/,3(f7.2,/))

END PROGRAM


SUBROUTINE pivot(n,a,j)
    IMPLICIT NONE
    INTEGER::n,i,j,k
    REAL,DIMENSION(n,n+1)::a
    REAL,DIMENSION(n+1)::t

    k=j
    DO i=j,n
        IF(ABS(a(i,j))>ABS(a(k,j))) k=i
    END DO

    t=a(j,:)
    a(j,:)=a(k,:)
    a(k,:)=t
END SUBROUTINE
