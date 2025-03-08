---
sidebar_position: 1
---

# Generating agendas
The qb::genframes() function returns a reference to a hash array, keyed to
individual frames. This array is called an "agenda". The qb::genframes() also
contains a parser that can handle a number of ways of specifying lists of frames.  

## Example

Agenda | Frames
---|---  
Single frame | 1  
Frame range | 1-100  
Range by step | 1-100x3 <br/>Expands to: 1, 4, 7, 10, 13 ... 100  
Comma | 1,2,3  
Negative | -100  
Complex | -100-100 <br/> (Expands to -100,-99, , 99, 100) <br/> -40-30x4,1,3,4,12 <br/> 100--10 <br/> (Expands to 100, 99, 98 . -9, -10)  
  
Additionally, there is a convenience function called **rangesplit()** that can
return an array of frame numbers based on the specified list string.  
Submit the job. A job is essentially a reference to a hash. The hash contains
a set of key-value pairs with various job parameters, as well as the pointer
to the agenda. This job package gets sent to the Qube system via the
qb::submit() function.  
The function returns a hash reference containing information about the
submitted job, including the job ID.

