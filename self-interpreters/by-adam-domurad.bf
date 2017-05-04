#Written Sept 30 2009
#This program fscked the mind of Adam Domurad; It is not completely efficient for sure but I was more concerned with making a working interpreter
#You can use as many as 256 nested loops on a 8 bit cell interpreter
#NOTE code will be parsed a lot faster without comment characters
#[first place 0 at start and place code input, working out if its a comment and correcting [ -> 1, ] -> 2, + -> 3, - -> 4, > -> 5, < -> 6, . -> 7, , -> 8]
#[Ascii: + is 43, , is 44, - is 45, . is 46, < is 60, > is 62, [ is 91, ] is 93]
#[Data used is 8 + Data used by subprogram * 2 + non-comment instructions in subprogram.]
#[It is possible but a good deal more complex to not use double the data the subprogram uses, the data pointer would have to be stored]
#[numerically and then shifted through the data area, and then restored.]
->->>>-
[
   , #input char and see if its a valid command
   #if its minus 1 make it 0 to handle various EOF standards
   >+<
   +[->-]
   >[->]<<
   #if it is '%' we end the code processing and treat the rest as input
   >+<
   --- --- --- --- --- ---
   --- --- --- --- --- --- - #minus 37#
   [ +++ +++ +++ +++ +++ +++
     +++ +++ +++ +++ +++ +++ + > - ]
   >[->]<<
   [ #make sure it is not = 0
      >+++++ +++ #set cell plus 1 to 8
      [
         <----- #minus 40 in total
	     >-
      ] #cell plus 1 is 0

	  <--- #minus 43 in total

	  [   #was it NOT 43?
         -#minus 44 in total
  	     [#was it NOT 44
            -
            [#was it NOT 45?
		        -
                [#was it NOT 46?
					--- --- --- --- --
			        [#was it NOT 60 ?
			              --
			              [#was it NOT 62?
                                 >+++++ ++
				                 [
				                     <----#minusing 7*4 = 28 total minus of 90
			                         >-
				                 ]
				                 <
                                 -
				                 [#was it NOT 91?
				                 	   --
				                 	   [#was it NOT 93?
					                   		 [+]-#set cell to minus 1 NOTE: implementation must support decreasing 0
					                  		 >   #increment cell pointer so that we can exit the loop
                 			           ]
				                       <+
								 	   [ # is the cell before us minus 1? If so the value was a comment and this loop is skipped
				                       	   -# here we know we have a 93
				                     	   >++ #set to 2
                                     	   > # go to a 0 cell to exit the loop
                        		       ]
                                       ->#Either way we end up one space past a minus 1 cell
       			                 ]#END 91 We are either on the current cell plus 1 = 0 or the cell plus 2 = 0; the value before us is minus 1 signalling that we entered this loop
                                 <+
						         [ # is the cell before us minus 1? If so skip this loop if not handle 91 case
                                      -#here we know we have a 91
                                      >+ #set to 1
				                      > # go to a 0 cell to exit the loop
				                 ]
                                 ->
			             ]#END 62 If there was a comment or a set so far the cell behind us is minus 1
                         <+ [ - > +++++ #set to 5# >]
                         ->
	            ]#END 60
                <+ [- > +++ +++ #set to 6# >]
                ->
            ]#END 46
            <+ [- > +++ +++ + #set to 7# >]
            ->
         ]#END 45
         <+ [- > +++ + #set to 4# >]
	     ->
      ]#END 44
	  <+ [- > +++ +++ ++ #set to 8#>]
      ->
     ]#END 42
     <+ [- > +++ #set to 3#>]
     ->
   ]#END 0
   +
   < #minus 1 if not at EOF the last instruction if EOF (value 1 to 8)
   + [->->]
   >[<->-]<
] #continue if it was negative one do not continue if it was EOF
<+++>>#add a useless plus at the end which makes sure next instruction is never 0 but is not executed
#past the code immediately is a 0; then a 0; then a minus 1; then a 0; then the data
#before the current instruction is two 0s; when the simulated instruction pointer moves the two 0s are pushed before the next instruction
#the second 0 holds a fetched instruction the others are simply reference points
>->>-


<<<<<[<]>
[ #Main loop

  	-[-[-[-[-[-[-[-
    #8 INPUT CASE
  	   <<+++ +++ ++        #Move the current instruction into a 0 that was before it
  	   >>>[>]>>>> +[->>+]- #Find the start of the data
  	   >,                  #Read input into the pointedto data
  	   < << +[-<<+]-       #Find the register area
 	   <<<[<]<             #Stop at the first 0 in the instruction pointer
	]

	#7 OUTPUT CASE
    >
    [
	   <<< +++ +++ +       #Move the current instruction into a 0 that was before it
  	   >>>[>]>>>> +[->>+]- #Find the start of the data
  	   >.                  #Output the pointedto data
  	   < << +[-<<+]-       #Find the register area
 	   <<<[<]              #Stop at the last 0 in the instruction pointer
    ]
    <
    ]

    #6 DECREMENT POINTER CASE
    >
    [
	   <<<+++ +++          #Move the current instruction into a 0 that was before it
  	   >>>[>]>>>> +[->>+]  #Find the start of the data and delete the marker
       <<-                 #Add a marker before the data before us
  	   << +[-<<+]-         #Find the register area
 	   <<<[<]              #Stop at the last 0 in the instruction pointer
    ]
    <
    ]

    #5 INCREMENT POINTER CASE
    >
    [
	   <<<+++ ++           #Move the current instruction into a 0 that was before it
  	   >>>[>]>>>> +[->>+]  #Find the start of the data and delete the marker
  	   >>-                 #Add a marker before the data after us
  	   << +[-<<+]-         #Find the register area
 	   <<<[<]              #Stop at the last 0 in the instruction pointer
    ]
    <
    ]

	#4 DECREMENT CASE
    >
    [
  	   <<<+++ +            #Move the current instruction into the 0 that was before it
  	   >>>[>]>>>> +[->>+]- #Find the start of the data
  	   >-                  #Decrement the pointedto data
  	   < << +[-<<+]-       #Find the register area
 	   <<<[<]              #Stop at the last 0 in the instruction pointer
    ]
    <
    ]

	#3 INCREMENT CASE
    >
    [
  	   <<<+++              #Move the current instruction into the 0 that was before it
  	   >>>[>]>>>> +[->>+]- #Find the start of the data
  	   >+                  #Increment the pointedto data
  	   < << +[-<<+]-       #Find the register area
 	   <<<[<]              #Stop at the last 0 in the instruction pointer
    ]
    <
    ]

    #2 RIGHT BRACKET CASE
    >
    [
       <++                 #Repair this instruction in case we will be jumping back
  	   [>] >> >> +[->>+]-  #Find the start of the data
  	   >[                  #IF the data is not 0 we must find the matching left bracket and set the instruction one after it as the current instruction
  	      < << +[-<<+]-    #Go to register area
  	      < << [<]         #Move to the instruction pointer second 0
  	      -                #Set to negative 1 since we already have a right bracket; we will now call this the bracket count
  	      [
		    #set up: instruction 0 bracketcount
  	        <<        #The instruction before our instruction pointer
  	        -[        #If it is NOT a 1
  	           >>-    #Decrement the bracket pointer
  	           <->    #Set the 0 cell to negative 1 in case we have a 0 bracket pointer
  	           [<+]   #Point to the 0 cell and 0 it if we did not have a 0 bracket pointer
             ]
			<+[       #This happens if the bracket pointer was not set to 0
               ->
               >[<]   #We are now at the 0 cell
			  ]
	         <        #We are now back to the instruction

            -[        #If it is NOT a 2
  	           >>+    #Increment the bracket pointer
  	           <-->    #Set the 0 cell to negative 2 in case we have a 0 bracket pointer
  	           [<++]   #Point to the 0 cell and 0 it if we did not have a 0 bracket pointer
             ]
            <++[       #This happens if the bracket pointer was not set to 0
               -->
               >[<]   #We are now at the 0 cell
			  ]
	         <        #We are now back to the instruction
            ++        #Restore instruction
			>>        #Move to bracket count
			[         #Only enter if we have a bracket count != 0 since we do not need to move behind the last right bracket
	          [<+>-]     #We will decrement the instruction pointer: first we move the bracket count into our 0
	          <<[>>+<<-] #Transfer the instruction into the prior bracket count cell pointing at the 0 cell
	        ]
	        <[        #Will only be entered if above loop was entered
	          >
	        ]>
  	      ]
        ]
       <[#If we are still in the current data this will be minus one else it will be the 0 cell and will not enter
          << +[-<<+]- #Go to register area
  	      < << [<]    #Move to the instruction pointer second 0
  	      <++         #Create the instruction in the first 0
  	      >>--       #Destroy the original instruction making it the second 0
  	      <           #Go to first 0 cell
	    ]
      > #End at second 0 cell
   ]
   <
   ]

   >
   #1 LEFT BRACKET CASE
   [
       <<<+>>>             #Move the instruction pointer one back
  	   [>] >> >> +[->>+]-  #Find the start of the data
       >[                  #IF the data is not 0 we go about our business
          <<<+[-<<+]- #Go to register area
  	      < << [<]    #Move to the instruction pointer second 0
        ]
       <[#If we are still in the current data this will be minus one else it will be the 0 cell and will not enter
         #Here we need to jump forward
          << +[-<<+]-      #Go to register area
  	      < << [<]         #Move to the instruction pointer second 0
  	      +                #Set to 1 since we already have a left bracket; we will now call this the bracket count
  	      [
		    #set up: instruction 0 bracketcount
  	        >         #The instruction after our instruction pointer
  	        -[        #If it is NOT a 1
  	           <-     #Decrement the bracket pointer
  	           <      #Point to the 0 cell
             ]
			<<[>>]    #If we are at 0 cell there will always be a non zero 2 away while if we are at instruction we will now be at 0 cell
			>>        #Move again to instruction

            -[        #If it is NOT a 2
  	           <+     #Increment the bracket pointer
  	           <      #Point to the 0 cell
             ]
            <<[>>]    #If we are at 0 cell there will always be a non zero 2 away while if we are at instruction we will now be at 0 cell
			>>        #Move again to instruction

            ++        #Restore instruction
			<         #Move to bracket count
			[         #Only enter if we have a bracket count != 0 since we do not need to move behind the last right bracket
	          >[<<+>>-]  #Transfer the instruction to the 0 cell
			  <[>+<-]    #Transfer our bracket count to where the instruction was making this the new 0 cell
	        ]
	        <[        #Will only be entered if above loop was entered
	          >
	        ]>
  	      ]
	    ]
      >[
	      [<<+>>-]  #Transfer the instruction to the 0 cell
	      <[>+<-]   #Transfer our bracket count to where the instruction was making this the new 0 cell
	    >           #Point to new second 0 cell
	  ] #End at second 0 cell
   ]
   > #Point to next instruction
]
