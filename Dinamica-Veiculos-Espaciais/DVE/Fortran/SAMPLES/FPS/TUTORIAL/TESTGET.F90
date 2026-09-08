PROGRAM testget
REAL x
CHARACTER (50) text
text = "12345.67"
READ (text,*) x
WRITE (*,*) x
END
