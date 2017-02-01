// SP=256
0  @256
1  D=A
2  @SP
3  A=M
4  M=D
//call Sys.init 0
//push returnAddress
5  @Sys.init$ret6aa75f4e-ad33-4e47-8a4c-6fff9910cf8f
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
(Sys.init$ret6aa75f4e-ad33-4e47-8a4c-6fff9910cf8f)
//function Class2.set 0
(Class2.set)
//push argument 0
54  @0
55  D=A
56  @ARG
57  A=D+M
58  D=M
59  @SP
60  A=M
61  M=D
62  @SP
63  M=M+1
//pop static 0
64  @SP
65  M=M-1
66  A=M
67  D=M
68  @Class2.0
69  M=D
//push argument 1
70  @1
71  D=A
72  @ARG
73  A=D+M
74  D=M
75  @SP
76  A=M
77  M=D
78  @SP
79  M=M+1
//pop static 1
80  @SP
81  M=M-1
82  A=M
83  D=M
84  @Class2.1
85  M=D
//push constant 0
86  @0
87  D=A
88  @SP
89  A=M
90  M=D
91  @SP
92  M=M+1
//return
// endFrame=LCL
93  @LCL
94  D=M
95  @R13
96  M=D
// retAddr = *(endFrame-5)
97  @5
98  D=A
99  @R13
100  A=M-D
101  D=M
102  @R14
103  M=D
// *ARG = pop
104  @SP
105  M=M-1
106  A=M
107  D=M
108  @ARG
109  A=M
110  M=D
// SP=ARG+1
111  @ARG
112  D=M+1
113  @SP
114  M=D
// THAT = *(endFramee-1)
115  @R13
116  A=M-1
117  D=M
118  @THAT
119  M=D
// THIS = *(endFrame-2)
120  @2
121  D=A
122  @R13
123  A=M-D
124  D=M
125  @THIS
126  M=D
// ARG = *(endFrame-3)
127  @3
128  D=A
129  @R13
130  A=M-D
131  D=M
132  @ARG
133  M=D
// LCL = *(endFrame-4)
134  @4
135  D=A
136  @R13
137  A=M-D
138  D=M
139  @LCL
140  M=D
// goto retAddr
141  @R14
142  A=M
143  0;JMP
//function Class2.get 0
(Class2.get)
//push static 0
144  @Class2.0
145  D=M
146  @SP
147  A=M
148  M=D
149  @SP
150  M=M+1
//push static 1
151  @Class2.1
152  D=M
153  @SP
154  A=M
155  M=D
156  @SP
157  M=M+1
//sub
158  @SP
159  M=M-1
160  A=M
161  D=M
162  @SP
163  M=M-1
164  A=M
165  M=M-D
166  @SP
167  M=M+1
//return
// endFrame=LCL
168  @LCL
169  D=M
170  @R13
171  M=D
// retAddr = *(endFrame-5)
172  @5
173  D=A
174  @R13
175  A=M-D
176  D=M
177  @R14
178  M=D
// *ARG = pop
179  @SP
180  M=M-1
181  A=M
182  D=M
183  @ARG
184  A=M
185  M=D
// SP=ARG+1
186  @ARG
187  D=M+1
188  @SP
189  M=D
// THAT = *(endFramee-1)
190  @R13
191  A=M-1
192  D=M
193  @THAT
194  M=D
// THIS = *(endFrame-2)
195  @2
196  D=A
197  @R13
198  A=M-D
199  D=M
200  @THIS
201  M=D
// ARG = *(endFrame-3)
202  @3
203  D=A
204  @R13
205  A=M-D
206  D=M
207  @ARG
208  M=D
// LCL = *(endFrame-4)
209  @4
210  D=A
211  @R13
212  A=M-D
213  D=M
214  @LCL
215  M=D
// goto retAddr
216  @R14
217  A=M
218  0;JMP
//function Sys.init 0
(Sys.init)
//push constant 6
219  @6
220  D=A
221  @SP
222  A=M
223  M=D
224  @SP
225  M=M+1
//push constant 8
226  @8
227  D=A
228  @SP
229  A=M
230  M=D
231  @SP
232  M=M+1
//call Class1.set 2
//push returnAddress
233  @Class1.set$ret83c017f9-b61c-4ac8-9169-412a6f97d9f6
234  D=A
235  @SP
236  A=M
237  M=D
238  @SP
239  M=M+1
//push LCL
240  @LCL
241  D=M
242  @SP
243  A=M
244  M=D
245  @SP
246  M=M+1
//push ARG
247  @ARG
248  D=M
249  @SP
250  A=M
251  M=D
252  @SP
253  M=M+1
//push THIS
254  @THIS
255  D=M
256  @SP
257  A=M
258  M=D
259  @SP
260  M=M+1
//push THAT
261  @THAT
262  D=M
263  @SP
264  A=M
265  M=D
266  @SP
267  M=M+1
//ARG = SP-nArgs-5
268  @5
269  D=A
270  @2
271  D=D+A
272  @SP
273  D=M-D
274  @ARG
275  M=D
//LCL = SP
276  @SP
277  D=M
278  @LCL
279  M=D
//goto g
280  @Class1.set
281  0,JMP
//returnAddress:
(Class1.set$ret83c017f9-b61c-4ac8-9169-412a6f97d9f6)
//pop temp 0 // Dumps the return value
282  @0
283  D=A
284  @5
285  D=D+A
286  @R13
287  M=D
288  @SP
289  M=M-1
290  A=M
291  D=M
292  @R13
293  A=M
294  M=D
//push constant 23
295  @23
296  D=A
297  @SP
298  A=M
299  M=D
300  @SP
301  M=M+1
//push constant 15
302  @15
303  D=A
304  @SP
305  A=M
306  M=D
307  @SP
308  M=M+1
//call Class2.set 2
//push returnAddress
309  @Class2.set$ret0e81c6d7-3655-4661-8340-766c5a71f464
310  D=A
311  @SP
312  A=M
313  M=D
314  @SP
315  M=M+1
//push LCL
316  @LCL
317  D=M
318  @SP
319  A=M
320  M=D
321  @SP
322  M=M+1
//push ARG
323  @ARG
324  D=M
325  @SP
326  A=M
327  M=D
328  @SP
329  M=M+1
//push THIS
330  @THIS
331  D=M
332  @SP
333  A=M
334  M=D
335  @SP
336  M=M+1
//push THAT
337  @THAT
338  D=M
339  @SP
340  A=M
341  M=D
342  @SP
343  M=M+1
//ARG = SP-nArgs-5
344  @5
345  D=A
346  @2
347  D=D+A
348  @SP
349  D=M-D
350  @ARG
351  M=D
//LCL = SP
352  @SP
353  D=M
354  @LCL
355  M=D
//goto g
356  @Class2.set
357  0,JMP
//returnAddress:
(Class2.set$ret0e81c6d7-3655-4661-8340-766c5a71f464)
//pop temp 0 // Dumps the return value
358  @0
359  D=A
360  @5
361  D=D+A
362  @R13
363  M=D
364  @SP
365  M=M-1
366  A=M
367  D=M
368  @R13
369  A=M
370  M=D
//call Class1.get 0
//push returnAddress
371  @Class1.get$reta3289b50-f86f-4f16-a017-3a8102ba0388
372  D=A
373  @SP
374  A=M
375  M=D
376  @SP
377  M=M+1
//push LCL
378  @LCL
379  D=M
380  @SP
381  A=M
382  M=D
383  @SP
384  M=M+1
//push ARG
385  @ARG
386  D=M
387  @SP
388  A=M
389  M=D
390  @SP
391  M=M+1
//push THIS
392  @THIS
393  D=M
394  @SP
395  A=M
396  M=D
397  @SP
398  M=M+1
//push THAT
399  @THAT
400  D=M
401  @SP
402  A=M
403  M=D
404  @SP
405  M=M+1
//ARG = SP-nArgs-5
406  @5
407  D=A
408  @0
409  D=D+A
410  @SP
411  D=M-D
412  @ARG
413  M=D
//LCL = SP
414  @SP
415  D=M
416  @LCL
417  M=D
//goto g
418  @Class1.get
419  0,JMP
//returnAddress:
(Class1.get$reta3289b50-f86f-4f16-a017-3a8102ba0388)
//call Class2.get 0
//push returnAddress
420  @Class2.get$ret8c9effcf-5107-46fb-ac36-defb861a628a
421  D=A
422  @SP
423  A=M
424  M=D
425  @SP
426  M=M+1
//push LCL
427  @LCL
428  D=M
429  @SP
430  A=M
431  M=D
432  @SP
433  M=M+1
//push ARG
434  @ARG
435  D=M
436  @SP
437  A=M
438  M=D
439  @SP
440  M=M+1
//push THIS
441  @THIS
442  D=M
443  @SP
444  A=M
445  M=D
446  @SP
447  M=M+1
//push THAT
448  @THAT
449  D=M
450  @SP
451  A=M
452  M=D
453  @SP
454  M=M+1
//ARG = SP-nArgs-5
455  @5
456  D=A
457  @0
458  D=D+A
459  @SP
460  D=M-D
461  @ARG
462  M=D
//LCL = SP
463  @SP
464  D=M
465  @LCL
466  M=D
//goto g
467  @Class2.get
468  0,JMP
//returnAddress:
(Class2.get$ret8c9effcf-5107-46fb-ac36-defb861a628a)
//label WHILE
(WHILE)
//goto WHILE
469  @WHILE
470  0,JMP
//function Class1.set 0
(Class1.set)
//push argument 0
471  @0
472  D=A
473  @ARG
474  A=D+M
475  D=M
476  @SP
477  A=M
478  M=D
479  @SP
480  M=M+1
//pop static 0
481  @SP
482  M=M-1
483  A=M
484  D=M
485  @Class1.0
486  M=D
//push argument 1
487  @1
488  D=A
489  @ARG
490  A=D+M
491  D=M
492  @SP
493  A=M
494  M=D
495  @SP
496  M=M+1
//pop static 1
497  @SP
498  M=M-1
499  A=M
500  D=M
501  @Class1.1
502  M=D
//push constant 0
503  @0
504  D=A
505  @SP
506  A=M
507  M=D
508  @SP
509  M=M+1
//return
// endFrame=LCL
510  @LCL
511  D=M
512  @R13
513  M=D
// retAddr = *(endFrame-5)
514  @5
515  D=A
516  @R13
517  A=M-D
518  D=M
519  @R14
520  M=D
// *ARG = pop
521  @SP
522  M=M-1
523  A=M
524  D=M
525  @ARG
526  A=M
527  M=D
// SP=ARG+1
528  @ARG
529  D=M+1
530  @SP
531  M=D
// THAT = *(endFramee-1)
532  @R13
533  A=M-1
534  D=M
535  @THAT
536  M=D
// THIS = *(endFrame-2)
537  @2
538  D=A
539  @R13
540  A=M-D
541  D=M
542  @THIS
543  M=D
// ARG = *(endFrame-3)
544  @3
545  D=A
546  @R13
547  A=M-D
548  D=M
549  @ARG
550  M=D
// LCL = *(endFrame-4)
551  @4
552  D=A
553  @R13
554  A=M-D
555  D=M
556  @LCL
557  M=D
// goto retAddr
558  @R14
559  A=M
560  0;JMP
//function Class1.get 0
(Class1.get)
//push static 0
561  @Class1.0
562  D=M
563  @SP
564  A=M
565  M=D
566  @SP
567  M=M+1
//push static 1
568  @Class1.1
569  D=M
570  @SP
571  A=M
572  M=D
573  @SP
574  M=M+1
//sub
575  @SP
576  M=M-1
577  A=M
578  D=M
579  @SP
580  M=M-1
581  A=M
582  M=M-D
583  @SP
584  M=M+1
//return
// endFrame=LCL
585  @LCL
586  D=M
587  @R13
588  M=D
// retAddr = *(endFrame-5)
589  @5
590  D=A
591  @R13
592  A=M-D
593  D=M
594  @R14
595  M=D
// *ARG = pop
596  @SP
597  M=M-1
598  A=M
599  D=M
600  @ARG
601  A=M
602  M=D
// SP=ARG+1
603  @ARG
604  D=M+1
605  @SP
606  M=D
// THAT = *(endFramee-1)
607  @R13
608  A=M-1
609  D=M
610  @THAT
611  M=D
// THIS = *(endFrame-2)
612  @2
613  D=A
614  @R13
615  A=M-D
616  D=M
617  @THIS
618  M=D
// ARG = *(endFrame-3)
619  @3
620  D=A
621  @R13
622  A=M-D
623  D=M
624  @ARG
625  M=D
// LCL = *(endFrame-4)
626  @4
627  D=A
628  @R13
629  A=M-D
630  D=M
631  @LCL
632  M=D
// goto retAddr
633  @R14
634  A=M
635  0;JMP
