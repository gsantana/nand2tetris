// SP=256
0  @256
1  D=A
2  @SP
3  A=M
4  M=D
//call Sys.init 0
//push returnAddress
5  @Sys.init$retd4724c48-2476-460e-b228-b7c7f11152ed
6  D=A
7  @SP
8  A=M
9  M=D
10  @SP
11  M=M+1
//push LCL
12  @LCL
13  D=M
14  @SP
15  A=M
16  M=D
17  @SP
18  M=M+1
//push ARG
19  @ARG
20  D=M
21  @SP
22  A=M
23  M=D
24  @SP
25  M=M+1
//push THIS
26  @THIS
27  D=M
28  @SP
29  A=M
30  M=D
31  @SP
32  M=M+1
//push THAT
33  @THAT
34  D=M
35  @SP
36  A=M
37  M=D
38  @SP
39  M=M+1
//ARG = SP-nArgs-5
40  @5
41  D=A
42  @0
43  D=D+A
44  @SP
45  D=M-D
46  @ARG
47  M=D
//LCL = SP
48  @SP
49  D=M
50  @LCL
51  M=D
//goto g
52  @Sys.init
53  0,JMP
//returnAddress:
(Sys.init$retd4724c48-2476-460e-b228-b7c7f11152ed)
//function Sys.init 0
(Sys.init)
//push constant 4
54  @4
55  D=A
56  @SP
57  A=M
58  M=D
59  @SP
60  M=M+1
//call Main.fibonacci 1   // computes the 4'th fibonacci element
//push returnAddress
61  @Main.fibonacci$retdbeecc34-3ffd-4021-a0ce-1ed35df2dbee
62  D=A
63  @SP
64  A=M
65  M=D
66  @SP
67  M=M+1
//push LCL
68  @LCL
69  D=M
70  @SP
71  A=M
72  M=D
73  @SP
74  M=M+1
//push ARG
75  @ARG
76  D=M
77  @SP
78  A=M
79  M=D
80  @SP
81  M=M+1
//push THIS
82  @THIS
83  D=M
84  @SP
85  A=M
86  M=D
87  @SP
88  M=M+1
//push THAT
89  @THAT
90  D=M
91  @SP
92  A=M
93  M=D
94  @SP
95  M=M+1
//ARG = SP-nArgs-5
96  @5
97  D=A
98  @1
99  D=D+A
100  @SP
101  D=M-D
102  @ARG
103  M=D
//LCL = SP
104  @SP
105  D=M
106  @LCL
107  M=D
//goto g
108  @Main.fibonacci
109  0,JMP
//returnAddress:
(Main.fibonacci$retdbeecc34-3ffd-4021-a0ce-1ed35df2dbee)
//label WHILE
(WHILE)
//goto WHILE              // loops infinitely
110  @WHILE
111  0,JMP
//function Main.fibonacci 0
(Main.fibonacci)
//push argument 0
112  @0
113  D=A
114  @ARG
115  A=D+M
116  D=M
117  @SP
118  A=M
119  M=D
120  @SP
121  M=M+1
//push constant 2
122  @2
123  D=A
124  @SP
125  A=M
126  M=D
127  @SP
128  M=M+1
//lt                     // checks if n<2
129  @SP
130  M=M-1
131  A=M
132  D=M
133  @SP
134  M=M-1
135  A=M
136  D=M-D
137  @JUMPf1f34679-c0f7-44be-9f00-85a552d3ae2c
138  D,JLT
139  @SP
140  A=M
141  M=0
142  @ENDf1f34679-c0f7-44be-9f00-85a552d3ae2c
143  0;JMP
(JUMPf1f34679-c0f7-44be-9f00-85a552d3ae2c)
144  @SP
145  A=M
146  M=-1
(ENDf1f34679-c0f7-44be-9f00-85a552d3ae2c)
147  @SP
148  M=M+1
//if-goto IF_TRUE
149  @SP
150  M=M-1
151  A=M
152  D=M
153  @IF_TRUE
154  D,JNE
//goto IF_FALSE
155  @IF_FALSE
156  0,JMP
//label IF_TRUE          // if n<2, return n
(IF_TRUE)
//push argument 0        
157  @0
158  D=A
159  @ARG
160  A=D+M
161  D=M
162  @SP
163  A=M
164  M=D
165  @SP
166  M=M+1
//return
// endFrame=LCL
167  @LCL
168  D=M
169  @R13
170  M=D
// retAddr = *(endFrame-5)
171  @5
172  D=A
173  @R13
174  A=M-D
175  D=M
176  @R14
177  M=D
// *ARG = pop
178  @SP
179  M=M-1
180  A=M
181  D=M
182  @ARG
183  A=M
184  M=D
// SP=ARG+1
185  @ARG
186  D=M+1
187  @SP
188  M=D
// THAT = *(endFramee-1)
189  @R13
190  A=M-1
191  D=M
192  @THAT
193  M=D
// THIS = *(endFrame-2)
194  @2
195  D=A
196  @R13
197  A=M-D
198  D=M
199  @THIS
200  M=D
// ARG = *(endFrame-3)
201  @3
202  D=A
203  @R13
204  A=M-D
205  D=M
206  @ARG
207  M=D
// LCL = *(endFrame-4)
208  @4
209  D=A
210  @R13
211  A=M-D
212  D=M
213  @LCL
214  M=D
// goto retAddr
215  @R14
216  A=M
217  0;JMP
//label IF_FALSE         // if n>=2, returns fib(n-2)+fib(n-1)
(IF_FALSE)
//push argument 0
218  @0
219  D=A
220  @ARG
221  A=D+M
222  D=M
223  @SP
224  A=M
225  M=D
226  @SP
227  M=M+1
//push constant 2
228  @2
229  D=A
230  @SP
231  A=M
232  M=D
233  @SP
234  M=M+1
//sub
235  @SP
236  M=M-1
237  A=M
238  D=M
239  @SP
240  M=M-1
241  A=M
242  M=M-D
243  @SP
244  M=M+1
//call Main.fibonacci 1  // computes fib(n-2)
//push returnAddress
245  @Main.fibonacci$ret76bfabae-fb3e-4b37-a357-b06d956a1f31
246  D=A
247  @SP
248  A=M
249  M=D
250  @SP
251  M=M+1
//push LCL
252  @LCL
253  D=M
254  @SP
255  A=M
256  M=D
257  @SP
258  M=M+1
//push ARG
259  @ARG
260  D=M
261  @SP
262  A=M
263  M=D
264  @SP
265  M=M+1
//push THIS
266  @THIS
267  D=M
268  @SP
269  A=M
270  M=D
271  @SP
272  M=M+1
//push THAT
273  @THAT
274  D=M
275  @SP
276  A=M
277  M=D
278  @SP
279  M=M+1
//ARG = SP-nArgs-5
280  @5
281  D=A
282  @1
283  D=D+A
284  @SP
285  D=M-D
286  @ARG
287  M=D
//LCL = SP
288  @SP
289  D=M
290  @LCL
291  M=D
//goto g
292  @Main.fibonacci
293  0,JMP
//returnAddress:
(Main.fibonacci$ret76bfabae-fb3e-4b37-a357-b06d956a1f31)
//push argument 0
294  @0
295  D=A
296  @ARG
297  A=D+M
298  D=M
299  @SP
300  A=M
301  M=D
302  @SP
303  M=M+1
//push constant 1
304  @1
305  D=A
306  @SP
307  A=M
308  M=D
309  @SP
310  M=M+1
//sub
311  @SP
312  M=M-1
313  A=M
314  D=M
315  @SP
316  M=M-1
317  A=M
318  M=M-D
319  @SP
320  M=M+1
//call Main.fibonacci 1  // computes fib(n-1)
//push returnAddress
321  @Main.fibonacci$ret8c279653-a169-4659-bc5a-3064de4b9ebf
322  D=A
323  @SP
324  A=M
325  M=D
326  @SP
327  M=M+1
//push LCL
328  @LCL
329  D=M
330  @SP
331  A=M
332  M=D
333  @SP
334  M=M+1
//push ARG
335  @ARG
336  D=M
337  @SP
338  A=M
339  M=D
340  @SP
341  M=M+1
//push THIS
342  @THIS
343  D=M
344  @SP
345  A=M
346  M=D
347  @SP
348  M=M+1
//push THAT
349  @THAT
350  D=M
351  @SP
352  A=M
353  M=D
354  @SP
355  M=M+1
//ARG = SP-nArgs-5
356  @5
357  D=A
358  @1
359  D=D+A
360  @SP
361  D=M-D
362  @ARG
363  M=D
//LCL = SP
364  @SP
365  D=M
366  @LCL
367  M=D
//goto g
368  @Main.fibonacci
369  0,JMP
//returnAddress:
(Main.fibonacci$ret8c279653-a169-4659-bc5a-3064de4b9ebf)
//add                    // returns fib(n-1) + fib(n-2)
370  @SP
371  M=M-1
372  A=M
373  D=M
374  @SP
375  M=M-1
376  A=M
377  M=M+D
378  @SP
379  M=M+1
//return
// endFrame=LCL
380  @LCL
381  D=M
382  @R13
383  M=D
// retAddr = *(endFrame-5)
384  @5
385  D=A
386  @R13
387  A=M-D
388  D=M
389  @R14
390  M=D
// *ARG = pop
391  @SP
392  M=M-1
393  A=M
394  D=M
395  @ARG
396  A=M
397  M=D
// SP=ARG+1
398  @ARG
399  D=M+1
400  @SP
401  M=D
// THAT = *(endFramee-1)
402  @R13
403  A=M-1
404  D=M
405  @THAT
406  M=D
// THIS = *(endFrame-2)
407  @2
408  D=A
409  @R13
410  A=M-D
411  D=M
412  @THIS
413  M=D
// ARG = *(endFrame-3)
414  @3
415  D=A
416  @R13
417  A=M-D
418  D=M
419  @ARG
420  M=D
// LCL = *(endFrame-4)
421  @4
422  D=A
423  @R13
424  A=M-D
425  D=M
426  @LCL
427  M=D
// goto retAddr
428  @R14
429  A=M
430  0;JMP
