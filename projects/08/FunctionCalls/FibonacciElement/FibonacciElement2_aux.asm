// SP=261
0  @261
1  D=A
2  @SP
3  A=M
4  M=D
// call Sys.init
5  @Sys.init
6  0,JMP
//function Sys.init 0
(Sys.init)
//push constant 4
7  @4
8  D=A
9  @SP
10  A=M
11  M=D
12  @SP
13  M=M+1
//call Main.fibonacci 1   // computes the 4'th fibonacci element
//push returnAddress
14  @Main.fibonacci$ret802a52d0-ae9d-4e20-bf06-bd848c0a16ad
15  D=A
16  @SP
17  A=M
18  M=D
19  @SP
20  M=M+1
//push LCL
21  @LCL
22  D=M
23  @SP
24  A=M
25  M=D
26  @SP
27  M=M+1
//push ARG
28  @ARG
29  D=M
30  @SP
31  A=M
32  M=D
33  @SP
34  M=M+1
//push THIS
35  @THIS
36  D=M
37  @SP
38  A=M
39  M=D
40  @SP
41  M=M+1
//push THAT
42  @THAT
43  D=M
44  @SP
45  A=M
46  M=D
47  @SP
48  M=M+1
//ARG = SP-nArgs-5
49  @5
50  D=A
51  @1
52  D=D+A
53  @SP
54  D=M-D
55  @ARG
56  M=D
//LCL = SP
57  @SP
58  D=M
59  @LCL
60  M=D
//goto g
61  @Main.fibonacci
62  0,JMP
//returnAddress:
(Main.fibonacci$ret802a52d0-ae9d-4e20-bf06-bd848c0a16ad)
//label WHILE
(WHILE)
//goto WHILE              // loops infinitely
63  @WHILE
64  0,JMP
//function Main.fibonacci 0
(Main.fibonacci)
//push argument 0
65  @0
66  D=A
67  @ARG
68  A=D+M
69  D=M
70  @SP
71  A=M
72  M=D
73  @SP
74  M=M+1
//push constant 2
75  @2
76  D=A
77  @SP
78  A=M
79  M=D
80  @SP
81  M=M+1
//lt                     // checks if n<2
82  @SP
83  M=M-1
84  A=M
85  D=M
86  @SP
87  M=M-1
88  A=M
89  D=M-D
90  @JUMPc63e55d6-97c0-41ad-b2cc-2c633545ef2c
91  D,JLT
92  @SP
93  A=M
94  M=0
95  @ENDc63e55d6-97c0-41ad-b2cc-2c633545ef2c
96  0;JMP
(JUMPc63e55d6-97c0-41ad-b2cc-2c633545ef2c)
97  @SP
98  A=M
99  M=-1
(ENDc63e55d6-97c0-41ad-b2cc-2c633545ef2c)
100  @SP
101  M=M+1
//if-goto IF_TRUE
102  @SP
103  M=M-1
104  A=M
105  D=M
106  @IF_TRUE
107  D,JNE
//goto IF_FALSE
108  @IF_FALSE
109  0,JMP
//label IF_TRUE          // if n<2, return n
(IF_TRUE)
//push argument 0        
110  @0
111  D=A
112  @ARG
113  A=D+M
114  D=M
115  @SP
116  A=M
117  M=D
118  @SP
119  M=M+1
//return
// endFrame=LCL
120  @LCL
121  D=M
122  @endFrame
123  M=D
// retAddr = *(endFrame-5)
124  @5
125  D=A
126  @endFrame
127  A=M-D
128  D=M
129  @retAddr
130  M=D
// *ARG = pop
131  @SP
132  M=M-1
133  A=M
134  D=M
135  @ARG
136  A=M
137  M=D
// SP=ARG+1
138  @ARG
139  D=M+1
140  @SP
141  M=D
// THAT = *(endFramee-1)
142  @endFrame
143  A=M-1
144  D=M
145  @THAT
146  M=D
// THIS = *(endFrame-2)
147  @2
148  D=A
149  @endFrame
150  A=M-D
151  D=M
152  @THIS
153  M=D
// ARG = *(endFrame-3)
154  @3
155  D=A
156  @endFrame
157  A=M-D
158  D=M
159  @ARG
160  M=D
// LCL = *(endFrame-4)
161  @4
162  D=A
163  @endFrame
164  A=M-D
165  D=M
166  @LCL
167  M=D
// goto retAddr
168  @endFrame
169  A=M
170  0;JMP
//label IF_FALSE         // if n>=2, returns fib(n-2)+fib(n-1)
(IF_FALSE)
//push argument 0
171  @0
172  D=A
173  @ARG
174  A=D+M
175  D=M
176  @SP
177  A=M
178  M=D
179  @SP
180  M=M+1
//push constant 2
181  @2
182  D=A
183  @SP
184  A=M
185  M=D
186  @SP
187  M=M+1
//sub
188  @SP
189  M=M-1
190  A=M
191  D=M
192  @SP
193  M=M-1
194  A=M
195  M=M-D
196  @SP
197  M=M+1
//call Main.fibonacci 1  // computes fib(n-2)
//push returnAddress
198  @Main.fibonacci$ret92791a30-3dea-436f-8113-b974a13f53e6
199  D=A
200  @SP
201  A=M
202  M=D
203  @SP
204  M=M+1
//push LCL
205  @LCL
206  D=M
207  @SP
208  A=M
209  M=D
210  @SP
211  M=M+1
//push ARG
212  @ARG
213  D=M
214  @SP
215  A=M
216  M=D
217  @SP
218  M=M+1
//push THIS
219  @THIS
220  D=M
221  @SP
222  A=M
223  M=D
224  @SP
225  M=M+1
//push THAT
226  @THAT
227  D=M
228  @SP
229  A=M
230  M=D
231  @SP
232  M=M+1
//ARG = SP-nArgs-5
233  @5
234  D=A
235  @1
236  D=D+A
237  @SP
238  D=M-D
239  @ARG
240  M=D
//LCL = SP
241  @SP
242  D=M
243  @LCL
244  M=D
//goto g
245  @Main.fibonacci
246  0,JMP
//returnAddress:
(Main.fibonacci$ret92791a30-3dea-436f-8113-b974a13f53e6)
//push argument 0
247  @0
248  D=A
249  @ARG
250  A=D+M
251  D=M
252  @SP
253  A=M
254  M=D
255  @SP
256  M=M+1
//push constant 1
257  @1
258  D=A
259  @SP
260  A=M
261  M=D
262  @SP
263  M=M+1
//sub
264  @SP
265  M=M-1
266  A=M
267  D=M
268  @SP
269  M=M-1
270  A=M
271  M=M-D
272  @SP
273  M=M+1
//call Main.fibonacci 1  // computes fib(n-1)
//push returnAddress
274  @Main.fibonacci$retd576083e-92d0-4223-aac7-3030a2555165
275  D=A
276  @SP
277  A=M
278  M=D
279  @SP
280  M=M+1
//push LCL
281  @LCL
282  D=M
283  @SP
284  A=M
285  M=D
286  @SP
287  M=M+1
//push ARG
288  @ARG
289  D=M
290  @SP
291  A=M
292  M=D
293  @SP
294  M=M+1
//push THIS
295  @THIS
296  D=M
297  @SP
298  A=M
299  M=D
300  @SP
301  M=M+1
//push THAT
302  @THAT
303  D=M
304  @SP
305  A=M
306  M=D
307  @SP
308  M=M+1
//ARG = SP-nArgs-5
309  @5
310  D=A
311  @1
312  D=D+A
313  @SP
314  D=M-D
315  @ARG
316  M=D
//LCL = SP
317  @SP
318  D=M
319  @LCL
320  M=D
//goto g
321  @Main.fibonacci
322  0,JMP
//returnAddress:
(Main.fibonacci$retd576083e-92d0-4223-aac7-3030a2555165)
//add                    // returns fib(n-1) + fib(n-2)
323  @SP
324  M=M-1
325  A=M
326  D=M
327  @SP
328  M=M-1
329  A=M
330  M=M+D
331  @SP
332  M=M+1
//return
// endFrame=LCL
333  @LCL
334  D=M
335  @endFrame
336  M=D
// retAddr = *(endFrame-5)
337  @5
338  D=A
339  @endFrame
340  A=M-D
341  D=M
342  @retAddr
343  M=D
// *ARG = pop
344  @SP
345  M=M-1
346  A=M
347  D=M
348  @ARG
349  A=M
350  M=D
// SP=ARG+1
351  @ARG
352  D=M+1
353  @SP
354  M=D
// THAT = *(endFramee-1)
355  @endFrame
356  A=M-1
357  D=M
358  @THAT
359  M=D
// THIS = *(endFrame-2)
360  @2
361  D=A
362  @endFrame
363  A=M-D
364  D=M
365  @THIS
366  M=D
// ARG = *(endFrame-3)
367  @3
368  D=A
369  @endFrame
370  A=M-D
371  D=M
372  @ARG
373  M=D
// LCL = *(endFrame-4)
374  @4
375  D=A
376  @endFrame
377  A=M-D
378  D=M
379  @LCL
380  M=D
// goto retAddr
381  @endFrame
382  A=M
383  0;JMP
