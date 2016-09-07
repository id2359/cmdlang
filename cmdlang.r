rebol []

m: make object! [
	r1: 0
	r2: 0
	r3: 0

]

	 
instructions: [  add-cmd | mul-cmd | clr-cmd | rot-cmd | put-cmd | display-cmd ]

add-cmd: [ 'add set n integer! ( m/r1: m/r1 + n ) ]

mul-cmd: [ 'mul set n integer! ( m/r1: m/r1 * n ) ]

clr-cmd: [ 'clr ( m/r1: 0 ) ]

rot-cmd: [ 'rot ( tmp: m/r1
                  m/r1: m/r2
		  m/r2: m/r3
		  m/r3: tmp ) ]

put-cmd: [ 'put set n integer!  set x integer!
            ( blk:  reduce  [ to set-path! rejoin [ "m r" n ]  x]
	      bind blk 'm
	      do blk ) ]


display-cmd: [ 'display ( print rejoin [ "R1: " m/r1  " R2: " m/r2 " R3: " m/r3 ] ) ]

prog: [  add 100
         display
	 rot
	 display
	 add 200
	 display
	 rot
	 mul 10
	 display
	 rot
	 display
     add 1
     mul 3
     rot
     put 2 27
     display 
     put 3 78
     display
     put 1 101
     display
     clr
     display

]


parse prog [ some instructions ]


         
	      
	      




   	        


