  REAL(4) r1, r2 /-1.0/
  REAL(8) r3, r4 /-1.0/
  COMPLEX(4) c1, c2 /(0.0, 0.0)/
  r1 = LOG(r2)
  r3 = SQRT(r4)
  c1 = CLOG(c2)
 
  WRITE(*, *) r1
  WRITE(*, *) r3
  WRITE(*, *) c1
  END
