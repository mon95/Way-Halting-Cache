# Way-Halting-Cache
Verilog Implementation of a 2-way set associative way halting cache(1 KB) with a line size of 32 B


###Specifications:

**Cache Size**: 1 KB  <br>
**Cache Line Size**: 32 B <br>
**2 way set associative, Way Halting Cache with Write Back policy**  <br>
**FIFO Replacement**  <br>

#####Number of bits used for offset, index and tag (32 bit physical address):
    
    Offset: 5 bits 
    Index : 4 bits
    Tag   : 23 bits
    
#####Total Cache Size: 

1. 16*1 (16, 1-bit regs for dirty bit) per set => 2 B  <br>
2. 16*1 (16, 1-bit regs for valid bit) per set => 2 B <br>
3. 16* 19 bits (16, 19-bit regs for the main tag array) per set => 38 B  <br>
4. 16*4 bits (16, 4-bit regs for the halt tag array) per set => 8B  <br>

(1., 2. 3. 4. )* 2 -> gives total for both sets together => 50*2 = 100B  <br>

Counter for FIFO replacement:  <br>

2 (one per each way) * 16* 1(since, one bit array) => 32 bits (4 bytes)  <br>

1024 bytes (total cache data size)         <br>
100 B (extra registers, tags, etc.)  <br>
4 B (replacement policy)  <br>
**Thus, TOTAL = 1024 + 100 + 4 = 1128 B for the cache**
 <br>
 <br>
As per the designed test bench in the *cache_Final.v* file, the following is the number of cache hits and misses:  <br>  <br>
    > Number of Cache Hits    :   1 + 1 +     1 + 1 +     + 1 + 3 +  +2  = 10  <br>
    > Number of Cache Misses  : 1       + 1 +         1 +          +2    = 5  <br>

