(* ::Package:: *)

BeginPackage["BasicAlgorithmsPackage`"]


(*\:0414\:041e\:041a\:0423\:041c\:0415\:041d\:0422\:0410\:0426\:0418\:042f*)

(*\:041f\:043e\:0434\:043c\:043d\:043e\:0436\:0435\:0441\:0442\:0432\:0430*)
subsetsR::usage="subsetsR[x] - \:0433\:0435\:043d\:0435\:0440\:0438\:0440\:0443\:0435\:0442 \:043f\:043e\:0434\:043c\:043d\:043e\:0436\:0435\:0441\:0442\:0432\:0430 \:043c\:043d\:043e\:0436\:0435\:0441\:0442\:0432\:0430 x \:0432 \:043e\:0431\:0440\:0430\:0442\:043d\:043e\:043c \:0431\:0438\:043d\:0430\:0440\:043d\:043e\:043c \:043f\:043e\:0440\:044f\:0434\:043a\:0435."
subsetsRGC::usage = "subsetsRGC[x] - \:0433\:0435\:043d\:0435\:0440\:0438\:0440\:0443\:0435\:0442 \:043f\:043e\:0434\:043c\:043d\:043e\:0436\:0435\:0441\:0442\:0432\:0430 \:043c\:043d\:043e\:0436\:0435\:0441\:0442\:0432\:0430 x \:0432 \:0441\:043e\:043e\:0442\:0432\:0435\:0441\:0442\:0432\:0438\:0438 \:0441 \:0434\:0432\:043e\:0438\:0447\:043d\:044b\:043c \:043a\:043e\:0434\:043e\:043c \:0413\:0440\:0435\:044f."

(*\:0414\:0432\:043e\:0438\:0447\:043d\:044b\:0435 \:043a\:0443\:0447\:0438*)
heapQ::usage = "heapQ[x_List] - \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 True, \:0435\:0441\:043b\:0438 \:0441\:043f\:0438\:0441\:043e\:043a x \:044f\:0432\:043b\:044f\:0435\:0442\:0441\:044f \:0434\:0432\:043e\:0438\:0447\:043d\:043e\:0439 \:043a\:0443\:0447\:0435\:0439, \:0432 \:043f\:0440\:043e\:0442\:0438\:0432\:043d\:043e\:043c \:0441\:043b\:0443\:0447\:0430\:0435 \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 False."
insertHeap::usage = "insertHeap[x_List,a_Integer] - \:043e\:0441\:0443\:0449\:0435\:0441\:0442\:0432\:043b\:044f\:0435\:0442 \:0432\:0441\:0442\:0430\:0432\:043a\:0443 \:044d\:043b\:0435\:043c\:0435\:043d\:0442\:0430 a \:0432 \:0434\:0432\:043e\:0438\:0447\:043d\:0443\:044e \:043a\:0443\:0447\:0443 x."

(*\:0421\:043e\:0440\:0442\:0438\:0440\:043e\:0432\:043a\:0430*)
bubbleSort::usage = "bubbleSort[x_List] - \:0441\:043e\:0440\:0442\:0438\:0440\:043e\:0432\:043a\:0430 \:0441\:043f\:0438\:0441\:043a\:0430 x \:043c\:0435\:0442\:043e\:0434\:043e\:043c '\:043f\:0443\:0437\:044b\:0440\:044c\:043a\:0430'."
maxSort::usage = "maxSort[x_List] - \:0441\:043e\:0440\:0442\:0438\:0440\:043e\:0432\:043a\:0430 \:0441\:043f\:0438\:0441\:043a\:0430 x \:043c\:0435\:0442\:043e\:0434\:043e\:043c \:043f\:0440\:044f\:043c\:043e\:0433\:043e \:0432\:044b\:0431\:043e\:0440\:0430."
mergeP::usage = "mergeP[a_List,b_List] - \:0441\:043e\:0435\:0434\:0438\:043d\:044f\:0435\:0442 \:0443\:043f\:043e\:0440\:044f\:0434\:043e\:0447\:0435\:043d\:043d\:044b\:0435 \:0441\:043f\:0438\:0441\:043a\:0438 a \:0438 b."
insertSort::usage = "insertSort[x_List] - \:0441\:043e\:0440\:0442\:0438\:0440\:043e\:0432\:043a\:0430 \:0441\:043f\:0438\:0441\:043a\:0430 x \:043c\:0435\:0442\:043e\:0434\:043e\:043c '\:0432\:0441\:0442\:0430\:0432\:043a\:0438'."
mergeSort::usage = "mergeSort[x_List] - \:0441\:043e\:0440\:0442\:0438\:0440\:043e\:0432\:043a\:0430 \:0441\:043f\:0438\:0441\:043a\:0430 x \:043c\:0435\:0442\:043e\:0434\:043e\:043c '\:0441\:043b\:0438\:044f\:043d\:0438\:044f'."

(*\:0410\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:044b \:043d\:0430 \:0434\:0435\:0440\:0435\:0432\:044c\:044f\:0445*)
treeRoot::usage = "treeRoot[t_List] - \:0438\:0449\:0435\:0442 \:043a\:043e\:0440\:0435\:043d\:044c \:0434\:0435\:0440\:0435\:0432\:0430 t, \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:0433\:043e \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043d\:0435\:043f\:043e\:0441\:0442\:0440\:0435\:0434\:0441\:0442\:0432\:0435\:043d\:043d\:044b\:0445 \:043f\:0440\:0435\:0434\:043a\:043e\:0432."
vertexLevel::usage = "vertexLevel[t_List,v_Integer] - \:043e\:043f\:0440\:0435\:0434\:0435\:043b\:044f\:0435\:0442 \:0443\:0440\:043e\:0432\:0435\:043d\:044c \:0432\:0435\:0440\:0448\:0438\:043d\:044b v \:0432 \:0434\:0435\:0440\:0435\:0432\:0435 t, \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043d\:0435\:043f\:043e\:0441\:0442\:0440\:0435\:0434\:0441\:0442\:0432\:0435\:043d\:043d\:044b\:0445 \:043f\:0440\:0435\:0434\:043a\:043e\:0432."
vertexLevelRec::usage = "vertexLevel[t_List,v_Integer] - \:043e\:043f\:0440\:0435\:0434\:0435\:043b\:044f\:0435\:0442 \:0443\:0440\:043e\:0432\:0435\:043d\:044c \:0432\:0435\:0440\:0448\:0438\:043d\:044b v \:0432 \:0434\:0435\:0440\:0435\:0432\:0435 t, \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043d\:0435\:043f\:043e\:0441\:0442\:0440\:0435\:0434\:0441\:0442\:0432\:0435\:043d\:043d\:044b\:0445 \:043f\:0440\:0435\:0434\:043a\:043e\:0432. (\:0440\:0435\:043a\:0443\:0440\:0441\:0438\:0432\:043d\:043e)"
height::usage = "height[t_List] - \:043e\:043f\:0440\:0435\:0434\:0435\:043b\:044f\:0435\:0442 \:0432\:044b\:0441\:043e\:0442\:0443 \:0434\:0435\:0440\:0435\:0432\:0430 t, \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043d\:0435\:043f\:043e\:0441\:0442\:0440\:0435\:0434\:0441\:0442\:0432\:0435\:043d\:043d\:044b\:0445 \:043f\:0440\:0435\:0434\:043a\:043e\:0432."
pathToRoot::usage = "pathToRoot[t_List,v_Integer] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043f\:0443\:0442\:044c, \:0432\:0435\:0434\:0443\:0449\:0438\:0439 \:0438\:0437 \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:0439 \:0432\:0435\:0440\:0448\:0438\:043d\:044b v \:0432 \:043a\:043e\:0440\:0435\:043d\:044c \:0434\:0435\:0440\:0435\:0432\:0430 t, \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:0433\:043e \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043d\:0435\:043f\:043e\:0441\:0442\:0440\:0435\:0434\:0441\:0442\:0432\:0435\:043d\:043d\:044b\:0445 \:043f\:0440\:0435\:0434\:043a\:043e\:0432."
leaves::usage = "leaves[t_List] - \:0444\:043e\:0440\:043c\:0438\:0440\:0443\:0435\:0442 \:0441\:043f\:0438\:0441\:043e\:043a \:0432\:0435\:0441\:044f\:0447\:0438\:0445 \:0432\:0435\:0440\:0448\:0438\:043d \:0434\:0435\:0440\:0435\:0432\:0430 t, \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:0433\:043e \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043d\:0435\:043f\:043e\:0441\:0442\:0440\:0435\:0434\:0441\:0442\:0432\:0435\:043d\:043d\:044b\:0445 \:043f\:0440\:0435\:0434\:043a\:043e\:0432."
fromParentsToChilds::usage = "fromParentsToChilds[t_List] - \:043f\:043e \:0437\:0430\:0434\:0430\:043d\:0438\:044e \:0434\:0435\:0440\:0435\:0432\:0430 t \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:0435\:0433\:043e \:043d\:0435\:043f\:043e\:0441\:0440\:0435\:0434\:0441\:0442\:0432\:0435\:043d\:043d\:044b\:0445 \:043f\:0440\:0435\:0434\:043a\:043e\:0432 \:0441\:0442\:0440\:043e\:0438\:0442 \:0435\:0433\:043e \:0437\:0430\:0434\:0430\:043d\:0438\:0435 \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:0432 \:0434\:0435\:0442\:0435\:0439 \:0432\:0435\:0440\:0448\:0438\:043d \:0434\:0435\:0440\:0435\:0432\:0430 t."
fromChildsToParents::usage = "fromChildsToParents[t_List] - \:043f\:0440\:0435\:043e\:0431\:0440\:0430\:0437\:0443\:0435\:0442 \:0437\:0430\:0434\:0430\:043d\:0438\:0435 \:043a\:043e\:0440\:043d\:0435\:0432\:043e\:0433\:043e \:0434\:0435\:0440\:0435\:0432\:0430 t \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:0432 \:0434\:0435\:0442\:0435\:0439 \:0432 \:0435\:0433\:043e \:0437\:0430\:0434\:0430\:043d\:0438\:0435 \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:0440\:043e\:0434\:0438\:0442\:0435\:043b\:0435\:0439."
scanBreadth::usage = "scanBreadth[t_List,r_Integer] - \:043e\:0431\:0445\:043e\:0434 \:0432\:0435\:0440\:0448\:0438\:043d \:043a\:043e\:0440\:043d\:0435\:0432\:043e\:0433\:043e \:0434\:0435\:0440\:0435\:0432\:0430 t \:0432 \:0448\:0438\:0440\:0438\:043d\:0443 \:043d\:0430\:0447\:0438\:043d\:0430\:044f \:043e\:0442 \:043a\:043e\:0440\:043d\:044f \:0434\:0435\:0440\:0435\:0432\:0430 r."
scanDepth::usage = "scanDepth[t_List,r_Integer] - \:043e\:0431\:0445\:043e\:0434 \:0432\:0435\:0440\:0448\:0438\:043d \:043a\:043e\:0440\:043d\:0435\:0432\:043e\:0433\:043e \:0434\:0435\:0440\:0435\:0432\:0430 t \:0432 \:0433\:043b\:0443\:0431\:0438\:043d\:0443 \:043d\:0430\:0447\:0438\:043d\:0430\:044f \:043e\:0442 \:043a\:043e\:0440\:043d\:044f \:0434\:0435\:0440\:0435\:0432\:0430 r."
minKey::usage = "minKey[bst_List] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043d\:0430\:0438\:043c\:0435\:043d\:044c\:0448\:0435\:0435 \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:0435 \:043a\:043b\:044e\:0447\:0430 \:0432 \:0434\:0430\:043d\:043d\:043e\:043c \:0434\:0432\:043e\:0438\:0447\:043d\:043e\:043c \:0434\:0435\:0440\:0435\:0432\:0435 \:043f\:043e\:0438\:0441\:043a\:0430 bst."
bstRoot::usage = "bstRoot[bst_List] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043a\:043e\:0440\:0435\:043d\:044c \:0434\:0432\:043e\:0438\:0447\:043d\:043e\:0433\:043e \:0434\:0435\:0440\:0435\:0432\:0430 \:043f\:043e\:0438\:0441\:043a\:0430 bst."
searchKeyBST::usage = "searchKeyBST[bst_List,key_Integer] - \:043e\:0441\:0443\:0449\:0435\:0441\:0442\:0432\:043b\:044f\:0435\:0442 \:043f\:043e\:0438\:0441\:043a \:0432\:0435\:0440\:0449\:0438\:043d\:044b \:0441 \:0437\:0430\:0434\:0430\:043d\:043d\:044b\:043c \:0437\:043d\:0430\:0447\:0435\:043d\:0438\:0435\:043c \:043a\:043b\:044e\:0447\:0430 key \:0432 \:0434\:0432\:043e\:0438\:0447\:043d\:043e\:043c \:0434\:0435\:0440\:0435\:0432\:0435 \:043f\:043e\:0438\:0441\:043a\:0430 bst."

(*\:0410\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:044b \:043d\:0430 \:0433\:0440\:0430\:0444\:0430\:0445*)
graphCut::usage = "graphCut[rules_List,list1_List, list2_List] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:0440\:0430\:0437\:0440\:0435\:0437\:044b \:0432 \:0433\:0440\:0430\:0444\:0435, \:0437\:0430\:0434\:0430\:043d\:043d\:044b\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043f\:0440\:0430\:0432\:0438\:043b rules ({1,12}\[Rule]35) \:0438 \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:0432\:0435\:0440\:0448\:0438\:043d list1 \:0438 list2, \:0430\:0440\:0433\:0443\:043c\:0435\:043d\:0442 list2 - \:043e\:043f\:0446\:0438\:043e\:043d\:0430\:043b\:044c\:043d\:044b\:0439."
Prim::usage = "Prim[rules_List] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043e\:0441\:0442\:043e\:0432 \:043c\:0438\:043d\:0438\:043c\:0430\:043b\:044c\:043d\:043e\:0439 \:0434\:043b\:0438\:043d\:044b \:0432 \:043d\:0435\:043e\:0440\:0438\:0435\:043d\:0442\:0438\:0440\:043e\:0432\:0430\:043d\:043d\:043e\:043c \:0433\:0440\:0430\:0444\:0435 rules, \:0437\:0430\:0434\:0430\:043d\:043d\:044b\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043f\:0440\:0430\:0432\:0438\:043b ({1,12}\[Rule]35), \:043f\:043e \:0430\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:0443 \:041f\:0440\:0438\:043c\:0430 (\:044d\:0444\:0444\:0435\:043a\:0442\:0438\:0432\:043d\:043e\:0433\:043e)."
Dijkstra::usage = "Dijkstra[rules_List,v0_Integer] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043e\:0441\:0442\:043e\:0432 \:043c\:0438\:043d\:0438\:043c\:0430\:043b\:044c\:043d\:043e\:0439 \:0434\:043b\:0438\:043d\:044b \:0432 \:043d\:0435\:043e\:0440\:0438\:0435\:043d\:0442\:0438\:0440\:043e\:0432\:0430\:043d\:043d\:043e\:043c \:0433\:0440\:0430\:0444\:0435 rules, \:0437\:0430\:0434\:0430\:043d\:043d\:044b\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043f\:0440\:0430\:0432\:0438\:043b ({1,12}\[Rule]35), \:043f\:043e \:0430\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:0443 \:0414\:0435\:0439\:043a\:0441\:0442\:0440\:044b."
cyclicGraphQ::usage = "cyclicGraphQ[spanningTree_List,list_] - \:043e\:043f\:0440\:0435\:0434\:0435\:043b\:044f\:0435\:0442 \:044f\:0432\:043b\:044f\:0435\:0442\:0441\:044f \:043b\:0438 \:0433\:0440\:0430\:0444 spanningTree \:043f\:0440\:0438 \:0434\:043e\:0431\:0430\:0432\:043b\:0435\:043d\:0438\:0438 \:0440\:0435\:0431\:0440\:0430 list_ - \:0430\:0446\:0438\:043a\:043b\:0438\:0447\:043d\:044b\:043c \:0438\:043b\:0438 \:043d\:0435\:0442."
Kruscal::usage = "Kruscal[rules_List] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043e\:0441\:0442\:043e\:0432 \:043c\:0438\:043d\:0438\:043c\:0430\:043b\:044c\:043d\:043e\:0439 \:0434\:043b\:0438\:043d\:044b \:0432 \:043d\:0435\:043e\:0440\:0438\:0435\:043d\:0442\:0438\:0440\:043e\:0432\:0430\:043d\:043d\:043e\:043c \:0433\:0440\:0430\:0444\:0435 rules, \:0437\:0430\:0434\:0430\:043d\:043d\:044b\:043c \:0441\:043f\:0438\:0441\:043a\:043e\:043c \:043f\:0440\:0430\:0432\:0438\:043b ({1,12}\[Rule]35), \:043f\:043e \:0430\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:0443 \:041a\:0440\:0430\:0441\:043a\:043b\:0430."
FloydWarsall::usage = "FloydWarsall[m0_List] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:0432\:0441\:0435 \:043a\:0440\:0430\:0442\:0447\:0430\:0439\:0448\:0438\:0435 \:043f\:0443\:0442\:0438 \:0432\:043e \:0432\:0437\:0432\:0435\:0448\:0435\:043d\:043d\:043e\:043c \:0433\:0440\:0430\:0444\:0435 m0 \:043f\:043e \:0430\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:0443 \:0424\:043b\:043e\:0439\:0434\:0430-\:0423\:043e\:0440\:0448\:0435\:043b\:043b\:0430, \:0437\:0430\:0434\:0430\:043d\:043d\:043e\:043c \:043c\:0430\:0442\:0440\:0438\:0446\:0435\:0439 \:0432\:0435\:0441\:043e\:0432 (\:0432 \:0432\:0438\:0434\:0435 \:0441\:043f\:0438\:0441\:043a\:0430.)"
findShortestPath::usage = "findShortestPath[d_List,p_List,i_Integer,j_Integer] - d \:0438 p - \:0440\:0435\:0437\:0443\:043b\:044c\:0442\:0430\:0442\:044b \:0440\:0430\:0431\:043e\:0442\:044b \:0430\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:0430 \:0424\:043b\:043e\:0439\:0434\:0430-\:0423\:043e\:0440\:0448\:0435\:043b\:043b\:0430, \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043a\:0440\:0430\:0442\:0447\:0430\:0439\:0448\:0438\:0439 \:043f\:0443\:0442\:044c \:043c\:0435\:0436\:0434\:0443 \:0432\:0435\:0440\:0448\:0438\:043d\:0430\:043c\:0438."

(*\:041f\:043e\:0442\:043e\:043a\:043e\:0432\:044b\:0435 \:0437\:0430\:0434\:0430\:0447\:0438 \:0432 \:0441\:0435\:0442\:044f\:0445*)
FordFulkerson::usage = "FordFulkerson[capacity_List,s_,t_] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043c\:0438\:043d\:0438\:043c\:0430\:043b\:044c\:043d\:044b\:0439 s\[Rule]t-\:043f\:043e\:0442\:043e\:043a \:0432 \:0433\:0440\:0430\:0444\:0435 \:043f\:043e \:0430\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:0443 \:0424\:043e\:0440\:0434\:0430-\:0424\:0430\:043b\:043a\:0435\:0440\:0441\:043e\:043d\:0430, \:0442\:0430\:043a \:0436\:0435 \:043c\:043e\:0436\:0435\:0442 \:0440\:0430\:0431\:043e\:0442\:0430\:0442\:044c \:043f\:0440\:043e\:0441\:0442\:043e \:043e\:0442 \:0433\:0440\:0430\:0444\:0430."
bfsPath::usage = "bfsPath[edgeList_,s_,t_] - \:043f\:043e\:0438\:0441\:043a \:043a\:0440\:0430\:0442\:0447\:0430\:0439\:0448\:0435\:0433\:043e \:043f\:0443\:0442\:0438 \:0432 \:0433\:0440\:0430\:0444\:0435 edgeList \:043c\:0435\:0436\:0434\:0443 \:0432\:0435\:0440\:0448\:0438\:043d\:0430\:043c\:0438 s \:0438 t \:0432 \:0448\:0438\:0440\:0438\:043d\:0443, \:0442\:0430\:043a \:0436\:0435 \:043c\:043e\:0436\:0435\:0442 \:0440\:0430\:0431\:043e\:0442\:0430\:0442\:044c \:043e\:0442 \:0433\:0440\:0430\:0444\:0430."
EdmondsKarp::usage = "EdmondsKarp[capacity_List,s_,t_] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 \:043c\:0438\:043d\:0438\:043c\:0430\:043b\:044c\:043d\:044b\:0439 s\[Rule]t-\:043f\:043e\:0442\:043e\:043a \:0432 \:0433\:0440\:0430\:0444\:0435 \:043f\:043e \:0430\:043b\:0433\:043e\:0440\:0438\:0442\:043c\:0443 \:042d\:0434\:043c\:043e\:043d\:0434\:0441\:0430-\:041a\:0430\:0440\:043f\:0430, \:0442\:0430\:043a \:0436\:0435 \:043c\:043e\:0436\:0435\:0442 \:0440\:0430\:0431\:043e\:0442\:0430\:0442\:044c \:043f\:0440\:043e\:0441\:0442\:043e \:043e\:0442 \:0433\:0440\:0430\:0444\:0430."
bFlow::usage = "bFlow[capacity_,balance_] - \:043d\:0430\:0445\:043e\:0434\:0438\:0442 b-\:043f\:043e\:0442\:043e\:043a \:0432 \:0433\:0440\:0430\:0444\:0435."


Begin["`Private`"]


Clear[subsetsR]
subsetsR[{}] :={{}};
subsetsR[x_List]:= Join[subsetsR[Most@x],Append[#,Last@x]&/@subsetsR[Most@x]]


Clear[subsetsRGC]
subsetsRGC[{}] :={{}}; 
subsetsRGC[x_List] := Join[subsetsRGC[Most@x],Append[#,Last@x]&/@Reverse@subsetsRGC[Most@x]]


Clear[heapQ]
heapQ[x_List] := Module[{i=2,t=True,k=Length@x},While[i<k+1,If[x[[i]]>x[[Floor[i/2]]],t=False;Break[]];i++];t] 


Clear[insertHeap]
insertHeap[x_List,a_Integer] :=Module[{i=Length@x+1,bh=Append[x,a],j} ,If[heapQ@x==True,While[i>=2,j=Floor[i/2];If[x[[j]]<a,bh[[i]]=x[[j]];bh[[j]]=a;i=j,Break[]]];bh]]


Clear[bubbleSort]
bubbleSort[x_List] := Module[{y=x,i= 1,j, n = Length@x},While[i<=n,j=1;While[j<=n-i, If[y[[j]]>y[[j+1]],{y[[j]],y[[j+1]]} = {y[[j+1]],y[[j]]}];j++];i++];y]


Clear[maxSort]
maxSort[x_List] := Module[{y=x,n=Length@x,i=0,j=1},While[i<=n,j=1;While[j<=n-i,If[y[[j]]==Max@y[[1;;n-i]],{y[[j]],y[[n-i]]}={y[[n-i]],y[[j]]}];j++];i++];y]


Clear[mergeP]
mergeP[a_List,b_List] := Module[{c={},i=1,j=1,k=Length@a,n=Length@b},Do[Which[i>k,c=Join[c,b[[j;;]]];Break[],j>n,c=Join[c,a[[i;;]]];Break[],a[[i]]<b[[j]],AppendTo[c,a[[i]]];i++,True,AppendTo[c,b[[j]]];j++],{n+k}];c]


Clear[insertSort]
insertSort[x_List] := Module[{list=x,n=Length@x,i=2,j},While[i<=n,j=i;While[j>1,If[list[[j-1]]>list[[j]],{list[[j-1]],list[[j]]}={list[[j]],list[[j-1]]}];j--];i++];list]


Clear[mergeSort]
mergeSort[x:{}|{_}]:=x
mergeSort[x:{__}]:=With[{middle = Ceiling[Length@x/2]},mergeP[mergeSort@x[[;;middle]],mergeSort@x[[middle+1;;]]]]


Clear[treeRoot]
treeRoot[t_List]:=Module[{i=1},While[t[[i]]!=0,i=t[[i]]];i]


Clear[vertexLevel]
vertexLevel[t_List,v_Integer] := Module[{k=t[[v]],i=1},While[k!=0,k=t[[k]];i++];i-1]


Clear[vertexLevelRec]
vertexLevelRec[t_List,0] = 0;
vertexLevelRec[t_List,i_Integer] := If[t[[i]]==0,0,1+vertexLevel[t,i-1]]


Clear[height]
height[t_List] := Max[vertexLevelRec[t,#]&/@Range@Length@t]


Clear[pathToRoot]
pathToRoot[t_List,v_Integer] := Module[{x=t,k=v,list={v},r=treeRoot@t},While[r!=k,k=x[[k]];AppendTo[list,k]];list]


Clear[leaves]
leaves[t_List] := Module[{n=Range@Length@t},Select[n,!MemberQ[t,#]&]]


Clear[fromParentsToChilds]
fromParentsToChilds[t_List] := Module[{x=t,list={}},Do[AppendTo[list,Flatten@Position[x,i]],{i,Length@x}];list]


Clear[fromChildsToParents]
fromChildsToParents[t_List] := Module[{list=ConstantArray[0,Length@t]},Do[If[t[[i]]!={},list[[t[[i]]]]=i],{i,Length@t}];list]


Clear[scanBreadth]
scanBreadth[t_List,r_Integer] := Module[{list={r},childrens=t[[r]]},While[childrens!={},AppendTo[list,First@childrens];AppendTo[childrens,t[[First@childrens]]];childrens=Delete[childrens,1];childrens=Flatten@childrens];list]


Clear[scanDepth]
scanDepth[t_List,r_Integer] := Module[{list={r},childrens=t[[r]]},While[childrens!={}, AppendTo[list,First@childrens]; childrens=Delete[childrens,1]; PrependTo[childrens,t[[Last@list]]];childrens=Flatten@childrens];list]


Clear[minKey]
minKey[bst_List] := Min@Table[First@bst[[i]],{i,Length@bst}]


Clear[bstRoot]
bstRoot[bst_List] := Module[{i=1,t=Table[Last@bst[[i]],{i,Length@bst}]},While[t[[i]]!=0,i=t[[i]]];{bst[[i,1]],1}]


Clear[searchKeyBST]
searchKeyBST[bst_List,key_Integer] := Module[{i=bstRoot@bst},While[bst[[i,1]]!=key ,If[bst[[i,1]]<key,i=bst[[i,3]],i=bst[[i,2]]]];i]/;MemberQ[First/@bst,key]


Clear[graphCut]
graphCut[rules_List,list1_List, list2_List]:=Select[rules,IntersectingQ[Complement[list1,list2],#[[1]]]\[And]IntersectingQ[Complement[list2,list1],#[[1]]]&]/;(SubsetQ[#,list1]\[And]SubsetQ[#,list2]&@DeleteDuplicates@Flatten@rules[[All,1]])
graphCut[rules_List,list1_List]:=graphCut[rules,list1,Complement[DeleteDuplicates@Flatten@rules[[All,1]],list1]]


Clear[Prim]
Prim[rules_List]:=Module[{T,verticesT,sortedEdges=SortBy[rules,Last],edge,f,n=Max@Flatten@rules[[All,1]]},T={sortedEdges[[1]]};verticesT=sortedEdges[[1,1]];Do[edge=SelectFirst[sortedEdges,Length@Intersection[verticesT,#[[1]]]==1&];AppendTo[T,edge];verticesT=Union[verticesT,edge[[1]]],n-2];{Total@T[[All,2]],T[[All,1]]}]


Clear[Dijkstra]
Dijkstra[rules_List,v0_Integer]:=Module[{T={},verticesT={v0},edge,f,d},d[_]=0;f=d@#[[1,1]]+d@#[[1,2]]+#[[2]]&;Do[edge=SortBy[graphCut[rules,verticesT],f][[1]];AppendTo[T,edge];verticesT=Union[verticesT,edge[[1]]],Max@Flatten@rules[[All,1]]-1];{Total@T[[All,2]],T[[All,1]]}]


Clear[cyclicGraphQ]
cyclicGraphQ[spanningTree_List,list_]:=Module[{t=list,g,q=spanningTree},AppendTo[q,t];g=Graph[First/@q];AcyclicGraphQ@g]


Clear[Kruscal]
Kruscal[rules_List]:=Module[{T,verticesT,sortedEdges=SortBy[rules,Last],edge,f,n=Max@Flatten@rules[[All,1]]},T={sortedEdges[[1]]};verticesT=sortedEdges[[1,1]];sortedEdges = Delete[sortedEdges,1];Do[edge=SelectFirst[sortedEdges,cyclicGraphQ[T,#]&]; AppendTo[T,edge];verticesT=Union[verticesT,edge[[1]]],n-2];{Total@T[[All,2]],T[[All,1]]}]


Clear[FloydWarsall]
FloydWarsall[m0_List]:=Module[{n=Length@m0,d,p,s},d=m0/. 0|0.->\[Infinity];Do[d[[i,i]]=0,{i,n}];p=Table[i,{i,n},{j,n}];Do[s=d[[i,k]]+d[[k,j]];If[d[[i,j]]>s,d[[i,j]]=s;p[[i,j]]=p[[k,j]]],{k,n},{i,n},{j,n}];{d,p}]


Clear[findShortestPath]
findShortestPath[d_List,p_List,i_Integer,j_Integer]:=If[d[[i,j]]!=\[Infinity],{d[[i,j]],Reverse@NestWhileList[p[[i,#]]&,j,#!=i&]},{\[Infinity],{}}]/;i!=j


Clear[FordFulkerson]
FordFulkerson[capacity_List,s_,t_]:=Module[
{
edgeList=capacity[[All,1]],
residualCapacity=capacity,
value=0,
flow,path,\[Gamma]
},
flow=AssociationThread[edgeList->0];
While[path=DirectedEdge@@@Partition[First[FindPath[residualCapacity[[All,1]],s,t,\[Infinity],1],{}],2,1];path!={},
\[Gamma]=path/.residualCapacity//Min;
value+=\[Gamma];
Do[If[MemberQ[edgeList,e]\[And]flow@e+\[Gamma]<=Replace[e,capacity],flow@e+=\[Gamma],flow@Reverse@e-=\[Gamma]],{e,path}];residualCapacity=Select[Join[#[[1]]->#[[2]]-flow@#[[1]]&/@capacity,Normal@KeyMap[Reverse,flow]],Positive@#[[2]]&];
];{value,flow}]/;Length@Intersection[Union@@List@@@capacity[[All,1]],{s,t}]==2
FordFulkerson[g_Graph,s_,t_]:=FordFulkerson[Thread[EdgeList@g->PropertyValue[g,EdgeCapacity]],s,t]


Clear[bfsPath]
bfsPath[edgeList_,s_,t_]:=Module[
{
next=GroupBy[edgeList,First->Last],
discovered={s},
layers={{s}}
},
While[FreeQ[layers[[-1]],t],
AppendTo[layers,Complement[Union@@Lookup[next,layers[[-1]],{}],discovered]];
discovered=Join[discovered,layers[[-1]]];
If[layers[[-1]]=={},Return@{}]
];
Reverse@FoldList[FirstCase[#2,x_/;MemberQ[next@x,#1]]&,t,Reverse@Most@layers]
]
bfsPath[g_Graph,s_,t_]:=bfsPath[EdgeList@g,s,t]


Clear[EdmondsKarp]
EdmondsKarp[capacity_List,s_,t_]:=Module[
{
edgeList=capacity[[All,1]],
residualCapacity=capacity,
value=0,
flow,path,\[Gamma]
},
flow=AssociationThread[edgeList->0];
While[path=DirectedEdge@@@Partition[bfsPath[residualCapacity[[All,1]],s,t],2,1];path!={},
\[Gamma]=path/.residualCapacity//Min;
value+=\[Gamma];
Do[If[MemberQ[edgeList,e]\[And]flow@e+\[Gamma]<=Replace[e,capacity],flow@e+=\[Gamma],flow@Reverse@e-=\[Gamma]],{e,path}];residualCapacity=Select[Join[#[[1]]->#[[2]]-flow@#[[1]]&/@capacity,Normal@KeyMap[Reverse,flow]],Positive@#[[2]]&];
];{value,flow}]/;Length@Intersection[Union@@List@@@capacity[[All,1]],{s,t}]==2
EdmondsKarp[g_Graph,s_,t_]:=EdmondsKarp[Thread[EdgeList@g->PropertyValue[g,EdgeCapacity]],s,t]


Clear[bFlow]
bFlow[capacity_,balance_]:=Module[
{
sources=Select[balance,Positive],
sinks=Select[balance,Negative],
consolidatedCapacity=Normal@GroupBy[capacity,First->Last,Total],
expandedEdges,value,stFlow,o
},
expandedEdges=consolidatedCapacity~Join~KeyValueMap["s"\[DirectedEdge]#1->#2&,sources]~Join~KeyValueMap[#1\[DirectedEdge]"t"->-#2&,sinks];
{value,stFlow}=EdmondsKarp[expandedEdges,"s","t"];
If[value!=Total@sources,
Print@"b-\:043f\:043e\:0442\:043e\:043a\:0430 \:043d\:0435 \:0441\:0443\:0449\:0435\:0441\:0442\:0432\:0443\:0435\:0442 :(",
Table[
o=Min[stFlow@e[[1]],e[[2]]];
stFlow@e[[1]]-=o;
e[[1]]->o,
{e,capacity}]
]
]/;Total@balance==0


End[]


EndPackage[]
