DirectShowSource("C:\Users\username\Desktop\test.avi")
ConvertToYUY2()
SetMTMode(2)
super=MSuper(vpad=0, hpad=0, pel=4, sharp=4, rfilter=4)
backward_1 = MAnalyse(super, chroma=true, isb=true, search=3, searchparam=3, delta=1, blksize=8, blksizev=8)
forward_1 = MAnalyse(super, chroma=true, isb=false, search=3, searchparam=3, delta=1, blksize=8, blksizev=8)
backward_2 = MRecalculate(super, chroma=true, backward_1, blksize=8, blksizev=8, searchparam=4, search=3)
forward_2 = MRecalculate(super, chroma=true, forward_1, blksize=8, blksizev=8, searchparam=4, search=3)
backward_3 = MRecalculate(super, chroma=true, backward_2, blksize=4, blksizev=4, searchparam=2, search=3)
forward_3 = MRecalculate(super, chroma=true, forward_2, blksize=4, blksizev=4, searchparam=2, search=3)
MFlowBlur(super, backward_3, forward_3, blur=40)
SetMTMode(1)
GetMTMode(false) > 0 ? distributor() : last