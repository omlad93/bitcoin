# Bit-Coin Mining Project
Advanced VLSI design course: final project 

## Responsibilities
| Block            | Owner |
| ---------------- | ----- |
| Wembley88        | Gal   |
| Sultans of Swing | Omri  |
| Dire Straits     | Iris  |
| Eric Clapton     | Ido   |


## Documentation
The Project Documentation can be found in Google Docs: 
<a href="https://docs.google.com/document/d/1ActqKbxRadA4mczkYudtw3MzBfMnWl0CVKIMiWSTSkQ/edit?usp=sharing" target="_blank">Google Doc</a>.  
The PDF version of Part-A can be found in this repository:
```Console
/project/advvlsi/users/omri/ws/pro_1/project_root/docs/Project_Part_A_team04c.pdf
```

## False Path

| q    | not(q) | t0   | t1   | mux_assign_out | always out |
| ---- | ------ | ---- | ---- | -------------- | ---------- |
| 0000 | 11     | A[0] | C[0] | 1              |            |
| 0001 | 10     | A[1] | C[0] | 0              |            |
| 0010 | 01     | A[2] | C[0] | C[0]           |            |
| 0011 | 00     | A[3] | C[0] | A[3]           |            |
| 0100 | 11     | A[0] | C[1] | 1              |            |
| 0101 | 10     | A[1] | C[1] | 0              |            |
| 0110 | 01     | A[2] | C[1] | C[1]           |            |
| 0111 | 00     | A[3] | C[1] | A[3]           |            |
| 1000 | 11     | A[0] | C[2] | 1              |            |
| 1001 | 10     | A[1] | C[2] | 0              |            |
| 1010 | 01     | A[2] | C[2] | C[2]           |            |
| 1011 | 00     | A[3] | C[2] | A[3]           |            |
| 1100 | 11     | A[0] | C[3] | 1              |            |
| 1101 | 10     | A[1] | C[3] | 0              |            |
| 1110 | 01     | A[2] | C[3] | C[3]           |            |
| 1111 | 00     | A[3] | C[3] | A[3]           |            |

We Received that A[0], A[1], A[2] are false path.





