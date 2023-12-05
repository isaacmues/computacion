! 
PROGRAM DiferenciasFinitas
    IMPLICIT NONE

    INTEGER,PARAMETER::n=19
    REAL(8),PARAMETER::pi=3.14159265358979323846
    REAL(8),PARAMETER::h=pi/(n+1)
    INTEGER::i

    REAL(8),DIMENSION(n,n+1)::a=0.0
    REAL(8),DIMENSION(n)::x,y,u

    ! Solución analítica
    DO i=1,n
        x(i)=i*h
        u(i)=cos(x(i))
    END DO

    CALL esquema(n,a)
    CALL gauss(n,a,y)

    OPEN(1,FILE='resultados.dat')

    PRINT *,"Resultados"
    PRINT *,"=========================================================="
    DO i=1,n
        PRINT *,i,y(i),u(i)
        WRITE(1,*) x(i), y(i), u(i)
    END DO

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

! Elimina el primer coeficiente de la fila i al sumarla con la fila  i-1 escalada
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

! Simplemente para comprobar que estén bien escritas las matrices
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
        a(i,i)=h*h-2
        IF (i .GT. 1) THEN
            a(i,i-1) = 1.0
            a(i-1,i) = 1.0
        END IF
    END DO

    a(1,n+1) = -1
    a(n,n+1) = 1

END SUBROUTINE
