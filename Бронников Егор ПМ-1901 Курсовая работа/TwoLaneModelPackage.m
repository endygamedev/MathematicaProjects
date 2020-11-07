(* ::Package:: *)

BeginPackage["TwoLaneModelPackage`"]


(*------\:0414\:041e\:041a\:0423\:041c\:0415\:041d\:0422\:0410\:0426\:0418\:042f------*)

(*\:0413\:0415\:041d\:0415\:0420\:0410\:0426\:0418\:042f \:041c\:0410\:0428\:0418\:041d*)
carInitialization::usage = "carInitialization[carCount, maxVelocity, laneCount, probabilityOneTime, W] - \:0441\:043e\:0437\:0434\:0430\:0451\:0442 \:043c\:0430\:0448\:0438\:043d\:044b \:0432 \:043a\:043e\:043b-\:0432\:0435 carCount, \:0441 \:043c\:0430\:043a\:0441\:0438\:043c\:0430\:043b\:044c\:043d\:043e\:0439 \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:044c\:044e maxVelocity, \:043d\:0430 \:043b\:0438\:043d\:0438\:044f\:0445 laneCount, \:0441 \:0432\:0435\:0440\:043e\:0441\:0442\:043d\:043e\:0442\:044c\:044e \:0441\:0433\:0435\:043d\:0435\:0440\:0438\:0440\:043e\:0432\:0430\:0442\:044c\:0441\:044f \:0432 \:043e\:0434\:043d\:043e \:0432\:0440\:0435\:043c\:044f probabilityOneTime \:0438 \:0441\:0442\:0430\:0440\:0442\:043e\:0432\:043e\:0439 \:0432\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c\:044e \:043f\:0435\:0440\:0435\:0441\:0442\:0440\:043e\:0438\:0442\:0441\:044f \:043d\:0430 \:043b\:0435\:0432\:0443\:044e \:043f\:043e\:043b\:043e\:0441\:0443 W.";
addObstacle::usage = "addObstacle[cars,{posStart, posFinish}] - \:0434\:043e\:0431\:0430\:0432\:043b\:044f\:0435\:0442 \:043a \:0438\:0441\:0445\:043e\:0434\:043d\:043e\:0439 \:0430\:0441\:0441\:043e\:0446\:0438\:0430\:0446\:0438\:0438 \:043c\:0430\:0448\:0438\:043d  - cars, \:043f\:0435\:0440\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:0435 \:0441 \:043d\:0430\:0447\:0430\:043b\:044c\:043d\:043e\:0439 \:043f\:043e\:0437\:0438\:0446\:0438\:0435\:0439 posStart \:0438 \:043a\:043e\:043d\:0435\:0447\:043d\:043e\:0439 \:043f\:043e\:0437\:0438\:0446\:0438\:0435\:0439 posFinish.";

(*\:041f\:0420\:0410\:0412\:0418\:041b\:0410 \:0414\:041b\:042f \:041c\:0410\:0428\:0418\:041d*)

(*\:0423\:0441\:043a\:043e\:0440\:0435\:043d\:0438\:0435*)
acceleration::usage = "acceleration[carId, maxVelocity][cars] - \:043f\:0440\:0430\:0432\:0438\:043b\:043e \:0443\:0441\:043a\:043e\:0440\:0435\:043d\:0438\:044f \:0434\:043b\:044f \:043c\:0430\:0448\:0438\:043d\:044b \:0441 ID - carId.";

(*\:0422\:043e\:0440\:043c\:043e\:0436\:0435\:043d\:0438\:0435*)
barking::usage = "barking[carId][cars] - \:043f\:0440\:0430\:0432\:0438\:043b\:043e \:0442\:043e\:0440\:043c\:043e\:0436\:0435\:043d\:0438\:044f \:0434\:043b\:044f \:043c\:0430\:0448\:0438\:043d\:044b \:0441 ID - carId.";
selectFirstCarOnLane::usage = "selectFirstCarOnLane[cars, lane] - \:0432\:044b\:0431\:0438\:0440\:0430\:0435\:0442 \:0430\:0432\:0442\:043e\:043c\:043e\:0431\:0438\:043b\:044c \:0432 \:043f\:043e\:043b\:043e\:0441\:0435 \:0434\:0432\:0438\:0436\:0435\:043d\:0438\:044f lane \:0438 \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 ID \:043c\:0430\:0448\:0438\:043d\:044b.";
frontCar::usage = "frontCar[cars, carId] - \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 ID \:043c\:0430\:0448\:0438\:043d\:044b, \:043a\:043e\:0442\:043e\:0440\:0430\:044f \:043d\:0430\:0445\:043e\:0434\:0438\:0442\:0441\:044f \:043f\:0435\:0440\:0435\:0434 \:0442\:0435\:043a\:0443\:0449\:0438\:043c \:0430\:0432\:0442\:043e\:043c\:043e\:0431\:0438\:043b\:0435\:043c.";

(*\:0420\:0430\:043d\:0434\:043e\:043c\:0438\:0437\:0430\:0446\:0438\:044f*)
randomization::usage = "randomization[carId, pBreak, rnd][cars] - \:043f\:0440\:0430\:0432\:0438\:043b\:043e \:0440\:0430\:043d\:0434\:043e\:043c\:0438\:0437\:0430\:0446\:0438\:0438 \:0434\:043b\:044f \:043c\:0430\:0448\:0438\:043d\:044b \:0441 ID - carId.";

(*\:0414\:0432\:0438\:0436\:0435\:043d\:0438\:0435*)
driving::usage = "driving[carId][cars] - \:043f\:0440\:0430\:0432\:0438\:043b\:043e \:0434\:0432\:0438\:0436\:0435\:043d\:0438\:0435 \:0434\:043b\:044f \:043c\:0430\:0448\:0438\:043d\:044b \:0441 ID - carId.";

(*\:041f\:0415\:0420\:0415\:0421\:0422\:0420\:041e\:0419\:041a\:0410 \:041c\:0410\:0428\:0418\:041d\:042b \:041d\:0410 \:041b\:0415\:0412\:0423\:042e \:041f\:041e\:041b\:041e\:0421\:0423*)

(*\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c W*)
probabilityW::usage = "probabilityW[carId, maxVelocity, coefficentW, maxW][cars] - \:043e\:0431\:0440\:0430\:0431\:043e\:0442\:043a\:0430 \:0432\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:0438 W \:043c\:0430\:0448\:0438\:043d\:044b \:0441 ID - carId.";

(*\:041f\:0435\:0440\:0435\:0441\:0442\:0440\:043e\:0439\:043a\:0430 \:043c\:0430\:0448\:0438\:043d*)
leftLaneCarBehind::usage = "leftLaneCarBehind[cars, carId] - \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 ID \:043c\:0430\:0448\:0438\:043d\:044b, \:043a\:043e\:0442\:043e\:0440\:0430\:044f \:043d\:0430\:0445\:043e\:0434\:0438\:0442\:0441\:044f \:043d\:0430 \:043b\:0435\:0432\:043e\:0439 \:043f\:043e\:043b\:043e\:0441\:0435 \:043e\:0442 \:0442\:0435\:043a\:0443\:0449\:0435\:0439 \:043c\:0430\:0448\:0438\:043d\:044b \:0441 ID - carId \:0438 \:0438\:0434\:0451\:0442 \:043f\:043e\:0437\:0430\:0434\:0438.";
leftLaneCarFront::usgae = "leftLaneCarFront[cars, carId] - \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 ID \:043c\:0430\:0448\:0438\:043d\:044b, \:043a\:043e\:0442\:043e\:0440\:0430\:044f \:043d\:0430\:0445\:043e\:0434\:0438\:0442\:0441\:044f \:043d\:0430 \:043b\:0435\:0432\:043e\:0439 \:043f\:043e\:043b\:043e\:0441\:0435 \:043e\:0442 \:0442\:0435\:043a\:0443\:0449\:0435\:0439 \:043c\:0430\:0448\:0438\:043d\:044b \:0441 ID - carId \:0438 \:0438\:0434\:0451\:0442 \:0432\:043f\:0435\:0440\:0435\:0434\:0438.";
changeLaneToLeft::usage = "changeLaneToLeft[carId, rnd][cars] - \:043e\:0431\:0440\:0430\:0431\:043e\:0442\:043a\:0430 \:0441\:043c\:0435\:043d\:044b \:043f\:043e\:043b\:043e\:0441\:044b \:043d\:0430 \:043b\:0435\:0432\:0443\:044e \:043f\:043e\:043b\:043e\:0441\:0443.";

(*\:0418\:0422\:0415\:0420\:0410\:0426\:0418\:0418*)
currentCars::usage = "currentCars[cars, time] - \:043e\:043f\:0440\:0435\:0434\:0435\:043b\:044f\:0435\:0442 \:043c\:0430\:0448\:0438\:043d\:044b, \:043a\:043e\:0442\:043e\:0440\:044b\:0435 \:0441\:0433\:0435\:043d\:0435\:0440\:0438\:0440\:043e\:0432\:0430\:043b\:0438\:0441\:044c \:043d\:0430 \:0434\:0430\:043d\:043d\:043e\:0439 \:0438\:0442\:0435\:0440\:0430\:0446\:0438\:0438."
modelInterations::usage = "modelInterations[cars, maxVelocity, iterationCount, pBreak, coefficentW, maxW] - \:0444\:0443\:043d\:043a\:0446\:0438\:044f, \:043a\:043e\:0442\:043e\:0440\:0430\:044f \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 \:0441\:043f\:0438\:0441\:043e\:043a \:0438\:0442\:0435\:0440\:0430\:0446\:0438\:0439 \:0432 \:043a\:043e\:043b\:0438\:0447\:0435\:0441\:0442\:0432\:0435 iterationCount.";

(*\:0412\:0418\:0417\:0423\:0410\:041b\:0418\:0417\:0410\:0426\:0418\:042f*)
pictureArray::usage = "pictureArray[cars, pictureRange, colorObstacle] - \:0432\:043e\:0437\:0432\:0440\:0430\:0449\:0430\:0435\:0442 \:043c\:0430\:0441\:0441\:0438\:0432 \:0438\:0437 \:044d\:043b\:0435\:043c\:0435\:043d\:0442\:043e\:0432, \:043a\:043e\:0442\:043e\:0440\:044b\:0435 \:043f\:043e\:0442\:043e\:043c \:043f\:043e\:0434\:043b\:0435\:0436\:0430\:0442 \:043e\:0442\:0440\:0438\:0441\:043e\:0432\:043a\:0438 \:0447\:0435\:0440\:0435\:0437 ArrayPlot (\:043a\:0430\:0440\:0442\:0438\:043d\:043a\:0430 \:0432 \:0434\:0430\:043d\:043d\:044b\:0439 \:043c\:043e\:043c\:0435\:043d\:0442 \:0438\:0442\:0435\:0440\:0430\:0446\:0438\:0438).";
roadPicture::usage = "roadPicture[cars, maxVelocity, pBreak, iterationLimit, coefficentW, maxW] - \:0438\:043d\:0442\:0435\:0440\:0430\:043a\:0442\:0438\:0432\:043d\:0430\:044f \:043f\:0430\:043d\:0435\:043b\:044c \:0441 \:043e\:0442\:043e\:0431\:0440\:0430\:0436\:0435\:043d\:0438\:0435\:043c \:0441\:0438\:0442\:0443\:0430\:0446\:0438\:0438 \:043d\:0430 \:0434\:043e\:0440\:043e\:0433\:0435 \:0432 \:043a\:043e\:043d\:043a\:0440\:0435\:0442\:043d\:044b\:0439 \:043c\:043e\:043c\:0435\:043d\:0442.";

(*\:0410\:041d\:0410\:041b\:0418\:0417 \:041c\:041e\:0414\:0415\:041b\:0418*)

(*\:041f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:044c \:0438 \:0441\:0440\:0435\:0434\:043d\:044f\:044f \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:044c \:0432 \:0437\:043e\:043d\:0430\:0445*)
dataAnalysis::usage = "dataAnalysis[cars, maxVelocity, pBreak, iterationLimit, coefficentW, maxW, zoneName, zoneStartPos: 5] - \:0444\:0443\:043d\:043a\:0446\:0438\:044f, \:043a\:043e\:0442\:043e\:0440\:0430\:044f \:0432\:044b\:0434\:0430\:0451\:0442 \:0442\:043e\:0447\:043a\:0438 \:043f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:0438 \:0434\:043b\:044f \:0433\:0440\:0430\:0444\:0438\:043a\:0430 (densityZonesPlot) \:0438 \:0441\:0440\:0435\:0434\:043d\:044e\:044e \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:044c \:0432 \:0437\:043e\:043d\:0435 \:0442\:0440\:0430\:0441\:0441\:044b.";
densityZonesPlot::usage = "densityZonesPlot[{densityZonesPoints, _},plotLabelText, plotColor] - \:0440\:0438\:0441\:0443\:0435\:0442 \:0433\:0440\:0430\:0444\:0438\:043a \:043f\:043e \:0442\:043e\:0447\:043a\:0430\:043c \:0438\:0437 \:0444\:0443\:043d\:043a\:0446\:0438\:0438 dataAnalysis \:0432 \:043e\:043f\:0440\:0435\:0434\:0435\:043b\:0451\:043d\:043d\:043e\:0439 \:0437\:043e\:043d\:0435 \:0442\:0440\:0430\:0441\:0441\:044b.";
dataZonesAnalysis::usage = "dataZonesAnalysis - \:0438\:043d\:0442\:0435\:0440\:0430\:043a\:0442\:0438\:0432\:043d\:0430\:044f \:043f\:0430\:043d\:0435\:043b\:044c \:0434\:043b\:044f \:043e\:0442\:043e\:0431\:0440\:0430\:0436\:0435\:043d\:0438\:044f \:0430\:043d\:0430\:043b\:0438\:0437\:0430 \:043c\:043e\:0434\:0435\:043b\:0438 \:043f\:043e \:043f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:0438 \:0438 \:0441\:0435\:0440\:0434\:043d\:0435\:0439 \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:0438 \:0432 \:043e\:043f\:0440\:0435\:0434\:0435\:043b\:0451\:043d\:043d\:044b\:0445 \:0437\:043e\:043d\:0430\:0445 \:0442\:0440\:0430\:0441\:0441\:044b.";

(*\:0421\:043e\:043e\:0442\:043d\:043e\:0448\:0435\:043d\:0438\:0435 \:043f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:0438 \:043c\:0430\:0448\:0438\:043d \:043d\:0430 \:043b\:0435\:0432\:043e\:0439 \:0438 \:043f\:0440\:0430\:0432\:043e\:0439 \:043f\:043e\:043b\:043e\:0441\:0435 \:0442\:0440\:0430\:0441\:0441\:044b*)
lanesAnalysis::usage = "lanesAnalysis[cars, maxVelocity, pBreak, iterationLimit, coefficentW, maxW] - \:0444\:0443\:043d\:043a\:0446\:0438\:044f, \:043a\:043e\:0442\:043e\:0440\:0430\:044f \:0432\:044b\:0434\:0430\:0451\:0442 \:0442\:043e\:0447\:043a\:0438 \:043f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:0438 \:0434\:043b\:044f \:0433\:0440\:0430\:0444\:0438\:043a\:0430 (lanesAnalysisPlot) \:043d\:0430 \:043b\:0435\:0432\:043e\:0439 \:0438 \:043f\:0440\:0430\:0432\:043e\:0439 \:043f\:043e\:043b\:043e\:0441\:0435 \:0434\:0432\:0438\:0436\:0435\:043d\:0438\:044f \:0432 \:043e\:0431\:043b\:0430\:0441\:0442\:0438 \:0434\:043e \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f.";
lanesAnalysisPlot::usage = "lanesAnalysisPlot[lanePoints] - \:0440\:0438\:0441\:0443\:0435\:0442 \:0433\:0440\:0430\:0444\:0438\:043a \:043f\:043e \:0442\:043e\:0447\:043a\:0430\:043c \:0438\:0437 \:0444\:0443\:043d\:043a\:0446\:0438\:0438 lanesAnalysis.";
lanesInteractiveAnalysis::usage = "lanesInteractiveAnalysis - \:0438\:043d\:0442\:0435\:0440\:0430\:043a\:0442\:0438\:0432\:043d\:0430\:044f \:043f\:0430\:043d\:0435\:043b\:044c \:0434\:043b\:044f \:043e\:0442\:043e\:0431\:0440\:0430\:0436\:0435\:043d\:0438\:044f \:0430\:043d\:0430\:043b\:0438\:0437\:0430 \:043c\:043e\:0434\:0435\:043b\:0438 \:043f\:043e \:043f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:0438 \:043c\:0430\:0448\:0438\:043d \:043d\:0430 \:043b\:0435\:0432\:043e\:0439 \:0438 \:043f\:0440\:0430\:0432\:043e\:0439 \:043f\:043e\:043b\:043e\:0441\:0435 \:0432 \:043e\:0431\:043b\:0430\:0441\:0442\:0438 \:0434\:043e \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f.";


Begin["`Private`"]


(*\:0413\:0415\:041d\:0415\:0420\:0410\:0426\:0418\:042f \:041c\:0410\:0428\:0418\:041d*)


Clear[carInitialization]
carInitialization[carCount_Integer?Positive,maxVelocity_Integer?Positive,laneCount_Integer?Positive,probabilityOneTime_Real?Positive|probabilityOneTime_Rational?Positive,W_Real?Positive]:=Module[
{
cars= Range@carCount,(*\:0421\:043f\:0438\:0441\:043e\:043a \:043c\:0430\:0448\:0438\:043d*)
speed = RandomInteger[{1,maxVelocity},carCount],(*\:041f\:0430\:0440\:0430\:043c\:0435\:0442\:0440 \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:0438*)
lane=RandomInteger[{0,laneCount-1},carCount],(*\:041b\:0438\:043d\:0438\:044f \:043d\:0430 \:043a\:043e\:0442\:043e\:0440\:043e\:0439 \:043d\:0430\:0445\:043e\:0434\:0438\:0442\:0441\:044f \:0430\:0432\:0442\:043e\:043c\:043e\:0431\:0438\:043b\:044c \:0432 \:043d\:0430\:0447\:0430\:043b\:044c\:043d\:044b\:0439 \:044d\:0442\:0430\:043f \:0432\:0440\:0435\:043c\:0435\:043d\:0438, 0 - \:043b\:0435\:0432\:0430\:044f \:043f\:043b\:043e\:0441\:0430, 1 - \:043f\:0440\:0430\:0432\:0430\:044f \:043f\:043e\:043b\:043e\:0441\:0430*)
time,(*\:0412\:0440\:0435\:043c\:044f \:043a\:043e\:0433\:0434\:0430 \:043f\:043e\:044f\:0432\:0438\:0442\:0441\:044f \:0430\:0432\:0442\:043e*)
position=ConstantArray[0,carCount],(*\:041f\:043e\:0437\:0438\:0446\:0438\:044f \:0430\:0432\:0442\:043e*)
probabilityW=ConstantArray[W,carCount],
rndColor=RandomColor[carCount],
prop (*\:041f\:0435\:0440\:0435\:043c\:0435\:043d\:043d\:0430\:044f \:043e\:0431\:044a\:0435\:0434\:0438\:043d\:044f\:044e\:0449\:0430\:044f \:0432\:0441\:0435 \:0441\:0432\:043e\:0439\:0441\:0442\:0432\:0430 \:0430\:0432\:0442\:043e*)
},
time=Table[If[RandomReal[]<probabilityOneTime\[And]i!=carCount\[And]lane[[i+1]]=!=lane[[i]],i+1,i],{i,carCount}];(*\:0414\:0435\:043b\:0430\:0435\:043c \:0442\:0430\:043a, \:0447\:0442\:043e\:0431\:044b \:0432 \:043e\:0434\:043d\:043e \:0432\:0440\:0435\:043c\:044f \:043f\:043e\:044f\:0432\:043b\:044f\:043b\:0438\:0441\:044c \:043c\:0430\:0448\:0438\:043d\:044b*)
prop=AssociationThread[{"Velocity","Lane","Time","Position","W","Color"}->#]&/@Transpose[{speed,lane,time,position,probabilityW,rndColor}];
AssociationThread[cars->prop]
]


Clear[addObstacle]
addObstacle[cars_Association,{posStart_Integer?Positive,posFinish_Integer?Positive}]/;posStart<=posFinish:=
<|0-><|"Velocity"->0,"Lane"->1,"Time"->0,"Position"->{posStart,posFinish},"W"->0,"Color"->Red|>|>~Join~cars


(*\:041f\:0420\:0410\:0412\:0418\:041b\:0410 \:0414\:041b\:042f \:041c\:0410\:0428\:0418\:041d*)


Clear[acceleration]
acceleration[carId_Integer?NonNegative,maxVelocity_Integer?Positive][cars_Association]:=Module[
{
cAssociation = cars
},
If[
cAssociation[carId]["Velocity"]<maxVelocity\[And]carId!=0,(*\:0414\:043e\:0431\:0430\:0432\:0438\:043b\:0438 \:043e\:0433\:0440\:0430\:043d\:0438\:0447\:0435\:043d\:0438\:0435 \:043d\:0430 \:0443\:0441\:043a\:043e\:0440\:0435\:043d\:0438\:0435*)
cAssociation[carId]["Velocity"]+=1
];
cAssociation
]


Clear[barking]
barking[carId_Integer?NonNegative][cars_Association]:=Module[
{
cAssociation=cars,
forwardCar=frontCar[cars,carId],
gap
},
gap=cAssociation[forwardCar]["Position"]-cAssociation[carId]["Position"]-1;
If[forwardCar=!=Null\[And]cAssociation[carId]["Velocity"]>gap\[And]carId!=0,(*\:0414\:043e\:0431\:0430\:0432\:0438\:043b\:0438 \:043e\:0433\:0440\:0430\:043d\:0438\:0447\:0435\:043d\:0438\:0435 \:043d\:0430 \:0442\:043e\:0440\:043c\:043e\:0436\:0435\:043d\:0438\:0435*)
cAssociation[carId]["Velocity"]=gap];
cAssociation
]


Clear[selectFirstCarOnLane]
selectFirstCarOnLane[cars_Association,lane_Integer?NonNegative]:=Last[Keys@Select[
SortBy[cars,#["Position"]&],
#["Lane"]==lane\[And]!ListQ[#["Position"]]&],Null](*\:041e\:0431\:0440\:0430\:0431\:043e\:0442\:0430\:043b\:0438 id 0*)


Clear[frontCar]
frontCar[cars_Association,carId_Integer?NonNegative]:=If[
selectFirstCarOnLane[cars,cars[carId]["Lane"]]=!=carId ,
First[Keys@Select[
SortBy[cars,#["Position"]&],
#["Lane"]==cars[carId]["Lane"]\[And]#["Position"]>cars[carId]["Position"]&],
Null]
]


Clear[randomization]
randomization[carId_Integer?NonNegative,pBreak_Rational?Positive|pBreak_Real?Positive,rnd_Real?Positive][cars_Association]:=Module[
{
	cAssociation=cars
},
If[
rnd<pBreak\[And]cAssociation[carId]["Velocity"]>0\[And]cAssociation[carId]["Position"]>0\[And]carId!=0,(*\:041e\:0431\:0440\:0430\:0431\:043e\:0442\:0430\:043b\:0438 \:0440\:0430\:043d\:0434\:043e\:043c\:0438\:0437\:0430\:0446\:0438\:044e*)
cAssociation[carId]["Velocity"]-=1
];
cAssociation
]


Clear[driving]
driving[carId_Integer?NonNegative][cars_Association]:=Module[
{
cAssociation=cars,
obstacle=cars[0],
currentCar=cars[carId]
},
If[obstacle["Position"][[1]]>currentCar["Position"]+currentCar["Velocity"]\[Or]obstacle["Lane"]!=currentCar["Lane"],
cAssociation[carId]["Position"]+=currentCar["Velocity"]
];
cAssociation
]


(*\:041f\:0415\:0420\:0415\:0421\:0422\:0420\:041e\:0419\:041a\:0410 \:041c\:0410\:0428\:0418\:041d\:042b \:041d\:0410 \:041b\:0415\:0412\:0423\:042e \:041f\:041e\:041b\:041e\:0421\:0423*)


Clear[probabilityW]
probabilityW[carId_Integer?NonNegative,maxVelocity_Integer?Positive,coefficentW_Integer?Positive,maxW_Real?Positive][cars_Association]:=Module[
{
cAssociation=cars,
forwardCar=frontCar[cars,carId],
obstacle=cars[0],
differenceVelocity
},
If[forwardCar=!=Null,
	differenceVelocity=cAssociation[forwardCar]["Velocity"]-cAssociation[carId]["Velocity"];
	If[differenceVelocity<=maxVelocity/coefficentW,
		cAssociation[carId]["W"]=0.1 differenceVelocity UnitStep[differenceVelocity],
		cAssociation[carId]["W"]=maxW
	]
];
If[obstacle["Position"][[1]]<=cAssociation[carId]["Position"]+cAssociation[carId]["Velocity"]\[And]obstacle["Lane"]==cAssociation[carId]["Lane"],
	cAssociation[carId]["W"]=maxW
];
cAssociation
]


Clear[leftLaneCarBehind]
leftLaneCarBehind[cars_Association,carId_Integer?NonNegative]:=First[Keys@Select[
	SortBy[cars, #["Position"]&, Greater],
		#["Lane"]==cars[carId]["Lane"]-1 \[And] #["Position"]<cars[carId]["Position"]&
	],
	Null]


Clear[leftLaneCarFront]
leftLaneCarFront[cars_Association,carId_Integer?NonNegative]:=First[Keys@Select[
	SortBy[cars,#["Position"]&],
		#["Lane"]==cars[carId]["Lane"]-1\[And]#["Position"]>cars[carId]["Position"]&
	],
	Null]


Clear[changeLaneToLeft]
changeLaneToLeft[carId_Integer?NonNegative, rnd_Real][cars_Association]:=Module[
{
cAssociation=cars,
leftCarBehind=leftLaneCarBehind[cars,carId],
leftCarForward=leftLaneCarFront[cars,carId],
leftCarForwardPosition, currentCarPosition, leftCarBehindPosition
},

leftCarForwardPosition=cAssociation[leftCarForward]["Velocity"]+cAssociation[leftCarForward]["Position"];
currentCarPosition=cAssociation[carId]["Velocity"]+cAssociation[carId]["Position"];
leftCarBehindPosition=cAssociation[leftCarBehind]["Velocity"]+cAssociation[leftCarBehind]["Position"];

Which[
leftCarForward=!=Null \[And] leftCarBehind=!=Null \[And] leftCarForwardPosition>currentCarPosition>leftCarBehindPosition \[And] rnd<cAssociation[carId]["W"],(* \:0443\:0441\:043b\:043e\:0432\:0438\:0435 \:21161 *)
cAssociation[carId]["Lane"]-=1,(* \:043c\:0435\:043d\:044f\:0435\:043c \:0442\:0435\:043a\:0443\:0449\:0443\:044e \:043f\:043e\:043b\:043e\:0441\:0443 \:043d\:0430 \:043b\:0435\:0432\:0443\:044e *)

leftCarForward=!=Null\[And]leftCarForwardPosition>currentCarPosition \[And] rnd<cAssociation[carId]["W"],(* \:0443\:0441\:043b\:043e\:0432\:0438\:0435 \:21162 *)
cAssociation[carId]["Lane"]-=1,(* \:043c\:0435\:043d\:044f\:0435\:043c \:0442\:0435\:043a\:0443\:0449\:0443\:044e \:043f\:043e\:043b\:043e\:0441\:0443 \:043d\:0430 \:043b\:0435\:0432\:0443\:044e *)

leftCarBehind=!=Null\[And]currentCarPosition>leftCarBehindPosition \[And] rnd<cAssociation[carId]["W"],(* \:0443\:0441\:043b\:043e\:0432\:0438\:0435 \:21163 *)
cAssociation[carId]["Lane"]-=1(* \:043c\:0435\:043d\:044f\:0435\:043c \:0442\:0435\:043a\:0443\:0449\:0443\:044e \:043f\:043e\:043b\:043e\:0441\:0443 \:043d\:0430 \:043b\:0435\:0432\:0443\:044e *)
];
cAssociation
]


(*\:0418\:0422\:0415\:0420\:0410\:0426\:0418\:0418*)


Clear[currentCars]
currentCars[cars_Association,time_Integer?Positive]:=Keys@Select[cars,#["Time"]<=time&]


Clear[modelInterations]
modelInterations[cars_Association,maxVelocity_Integer?Positive,iterationCount_Integer?NonNegative,pBreak_Rational?Positive|pBreak_Real?Positive,coefficentW_Integer?Positive,maxW_Real?Positive]:=Module[
{
iterCars=cars,
iterationList={},
rnd:=RandomReal[]
},
Do[

Do[
iterCars=Composition[
changeLaneToLeft[car,rnd],
probabilityW[car,maxVelocity,coefficentW,maxW],
driving[car],
randomization[car,pBreak,rnd],
barking[car],
acceleration[car,maxVelocity]][iterCars],
{car,currentCars[cars,time]}];

AppendTo[iterationList,iterCars],

{time,iterationCount}
];
iterationList
]


(*\:0412\:0418\:0417\:0423\:0410\:041b\:0418\:0417\:0410\:0426\:0418\:042f*)


Clear[pictureArray]
pictureArray[cars_Association, pictureRange_Integer?Positive,colorObstacle_?ColorQ]:=Module[
{
pictureArr=ConstantArray[{0,0},pictureRange],
onePosCars
},
If[pictureRange<cars[0]["Position"][[2]],
pictureArr[[Range[cars[0]["Position"][[1]],pictureRange]]]={{0,colorObstacle}},(*pictureArr\[LeftDoubleBracket]{20,21}\[RightDoubleBracket]={0,Red} \[Rule] {{0,0},{0,0},{0,0}, ... , 0, Red} - \:043a\:043e\:0440\:0442\:0435\:0436*)
pictureArr[[Range@@cars[0]["Position"]]]={0,colorObstacle},
Nothing];
Do[
	If[car["Position"]<=pictureRange\[And]car["Position"]!=0\[And]!ListQ[car["Position"]],
	
		onePosCars=Select[cars, #["Position"]==car["Position"]&];
		If[Length@onePosCars == 2,
			If[car["Lane"]==0,
				pictureArr[[car["Position"]]]={car["Color"],Select[Values@onePosCars,#!=car&][[1]]["Color"]},
				pictureArr[[car["Position"]]]={Select[Values@onePosCars,#!=car&][[1]]["Color"],car["Color"]}
			],
		
			If[car["Lane"]==0,
				If[Between[car["Position"],cars[0]["Position"]],
						pictureArr[[car["Position"]]]={car["Color"],colorObstacle},
				pictureArr[[car["Position"]]]={car["Color"],0}
				],
			pictureArr[[car["Position"]]]={0,car["Color"]}
			]
		]
	],
{car, cars}];
Reverse[Flatten/@pictureArr]
]


Clear[roadPicture]
roadPicture:=DynamicModule[
{
cars=carInitialization[30,5,2,0.4,0.8],
iterCars,obstacleCars
},
obstacleCars=addObstacle[cars,{15,30}];
iterCars=modelInterations[obstacleCars,5,40,1/5,3,0.8];

Manipulate[

ArrayPlot[pictureArray[iterCars[[iterationCount]],scale,color],Mesh->{mesh,{1}},MeshStyle->{Gray,{Thick,Dashed}},Frame->True,FrameLabel->{"Position","Lane"},ImageSize->Large],
Style["\:041f\:0430\:043d\:0435\:043b\:044c \:0443\:043f\:0440\:0430\:0432\:043b\:0435\:043d\:0438\:044f:", Bold, FontSize->24],
Delimiter,

Grid[
{{Style["\:041d\:0430\:0441\:0442\:0440\:043e\:0439\:043a\:0430 \:0432\:0438\:0437\:0443\:0430\:043b\:0438\:0437\:0430\:0446\:0438\:0438", Bold, FontSize->20],Style["\:041f\:0430\:0440\:0430\:043c\:0435\:0442\:0440\:044b:", Bold, FontSize->20]},
{Control[{{iterationCount,1,"\:0418\:0442\:0435\:0440\:0430\:0446\:0438\:044f"},1,iterationLimit,1,Appearance->"Open"}], Control[{{carsCount,30,"\:041a\:043e\:043b-\:0432\:043e \:043c\:0430\:0448\:0438\:043d"},30}]},
{Control[{{mesh,False,"\:0421\:0435\:0442\:043a\:0430"},{True,False}}], Control[{{iterationLimit,40,"\:041a\:043e\:043b-\:0432\:043e \:0438\:0442\:0435\:0440\:0430\:0446\:0438\:0439"},40}]},
{Control[{{scale,obstacleFinish,"\:041c\:0430\:0441\:0448\:0442\:0430\:0431"},5, 2 obstacleFinish,1,AppearanceElements->All}], Control[{{maxVelocity,5,"\:041c\:0430\:043a\:0441\:0438\:043c\:0430\:043b\:044c\:043d\:0430\:044f \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:044c"},5}]},
{Control[{{color,Red,"\:0426\:0432\:0435\:0442 \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f"},Red}], Control@{{pBreak,1/5,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c \:0441\:043b\:0443\:0447\:0430\:0439\:043d\:043e\:0433\:043e \:0442\:043e\:0440\:043c\:043e\:0436\:0435\:043d\:0438\:044f"},0.1,1,AppearanceElements->All} },
{"", Control[{{W,0.8,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c W"},0.1,1,AppearanceElements->All}]},
{"", Control[{{coefficentW,3,"\:041a\:043e\:044d\:0444\:0444\:0438\:0446\:0438\:0435\:043d\:0442 \:0434\:043b\:044f \:0432\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:0438 W"},3}]},
{"", Control[{{coefficentOneTime,0.4,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c \:0441\:0433\:0435\:043d\:0435\:0440\:0438\:0440\:043e\:0432\:0430\:0442\:044c\:0441\:044f \:0432 \:043e\:0434\:043d\:043e \:0432\:0440\:0435\:043c\:044f"},0.1,1,AppearanceElements->All}]},
{"", Control[{{obstacleStart,15,"\:041d\:0430\:0447\:0430\:043b\:044c\:043d\:0430\:044f \:043f\:043e\:0437\:0438\:0446\:0438\:044f \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f"},1,24,1,AppearanceElements->All}]},
{"", Control[{{obstacleFinish,30,"\:041a\:043e\:043d\:0435\:0447\:043d\:0430\:044f \:043f\:043e\:0437\:0438\:0446\:0438\:044f \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f"},25,60,1,AppearanceElements->All}]},
{"", Button[Style["\:0412\:0438\:0437\:0443\:0430\:043b\:0438\:0437\:0430\:0446\:0438\:044f \:0441 \:043d\:043e\:0432\:044b\:043c\:0438 \:0434\:0430\:043d\:043d\:044b\:043c\:0438",16,FontFamily->"Cambria"],
cars=carInitialization[carsCount,maxVelocity,2,coefficentOneTime,W];
obstacleCars=addObstacle[cars,{obstacleStart,obstacleFinish}];
iterCars=modelInterations[obstacleCars,maxVelocity,iterationLimit,pBreak,coefficentW,W]]}
},
Alignment->Left,Dividers->{{2->Thick}, {False}},Spacings->{4,Automatic}],

ControlPlacement->Right,AppearanceElements->None,Paneled->False,Alignment->Center,LabelStyle->Directive[FontSize->16,FontFamily->"Cambria"],ContinuousAction->False
]
]


(*\:0410\:041d\:0410\:041b\:0418\:0417 \:041c\:041e\:0414\:0415\:041b\:0418*)


(*\:041f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:044c \:0438 \:0441\:0440\:0435\:0434\:043d\:044f\:044f \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:044c \:0432 \:0437\:043e\:043d\:0430\:0445*)


Clear[dataAnalysis]
dataAnalysis[cars_Association,maxVelocity_Integer?Positive,pBreak_Rational?Positive|pBreak_Real?Positive,iterationLimit_Integer?Positive,coefficentW_Integer?Positive,maxW_Real?Positive,zoneName_String,zoneStartPos_Integer:5]:=Module[
{
crit,obstaclePos,carsList,densityPoints,meanVelocity,
iterCarsList=modelInterations[cars,maxVelocity,iterationLimit,pBreak,coefficentW,maxW]
},
obstaclePos=iterCarsList[[1]][0]["Position"];

crit=Switch[zoneName,
"\:0417\:043e\:043d\:0430 \:0441\:0443\:0436\:0435\:043d\:0438\:044f",obstaclePos[[1]]-zoneStartPos<=#["Position"]<obstaclePos[[1]]&,
"\:0417\:043e\:043d\:0430 \:0441 \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:0435\:043c", obstaclePos[[1]]<=#["Position"]<obstaclePos[[2]]&,
"\:0414\:0432\:0443\:0445\:043f\:043e\:043b\:043e\:0441\:043d\:0430\:044f \:0437\:043e\:043d\:0430",1<=#["Position"]<obstaclePos[[1]]-zoneStartPos \[Or]#["Position"]>obstaclePos[[2]]&];

carsList=Table[Select[iterCars,crit],{iterCars,iterCarsList}];
densityPoints=Length/@carsList;
meanVelocity=Composition[N,Mean,Values,Map[#["Velocity"]&],Apply[Join],DeleteCases[<||>]]@carsList;
{densityPoints,meanVelocity}
]


Clear[densityZonesPlot]
densityZonesPlot[{densityZonesPoints_List,_},plotLabelText_String,plotColor_?ColorQ]:=Framed@Labeled[ListLinePlot[densityZonesPoints,Filling->Axis,PlotLabel->Style[plotLabelText,16,Bold,FontFamily->"Cambria Math",Black],PlotStyle->{plotColor,Thick},Mesh->All,ImageSize->Large],{"\:0412\:0440\:0435\:043c\:044f","\:041a\:043e\:043b-\:0432\:043e \:043c\:0430\:0448\:0438\:043d"},{Bottom,Left},RotateLabel->True]


Clear[dataZonesAnalysis]
dataZonesAnalysis:=DynamicModule[
{
cars=carInitialization[30,5,2,0.4,0.8],
zoneNamesList={"\:0417\:043e\:043d\:0430 \:0441\:0443\:0436\:0435\:043d\:0438\:044f","\:0417\:043e\:043d\:0430 \:0441 \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:0435\:043c","\:0414\:0432\:0443\:0445\:043f\:043e\:043b\:043e\:0441\:043d\:0430\:044f \:0437\:043e\:043d\:0430"},
plotColorsList={Blue,Red,Green},
labelNamesList={"\:041f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:044c \:043c\:0430\:0448\:0438\:043d \:0432 \:0437\:043e\:043d\:0435 \:0441\:0443\:0436\:0435\:043d\:0438\:044f","\:041f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:044c \:043c\:0430\:0448\:0438\:043d \:0432 \:0437\:043e\:043d\:0435 \:0441 \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:0435\:043c","\:041f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:044c \:043c\:0430\:0448\:0438\:043d \:0432 \:0434\:0432\:0443\:0445\:043f\:043e\:043b\:043e\:0441\:043d\:043e\:0439 \:0437\:043e\:043d\:0435"},
plots,obstacleCars,meanVelocityZones,dataZones
},
obstacleCars=addObstacle[cars,{15,30}];
dataZones=dataAnalysis[obstacleCars,5,1/5,40,3,0.8,#]&/@zoneNamesList;
plots=MapThread[densityZonesPlot,{dataZones,labelNamesList,plotColorsList}];
meanVelocityZones=Last/@dataZones;

Manipulate[

TabView@AssociationThread[zoneNamesList->MapThread[Column[{Style["\:0421\:0440\:0435\:0434\:043d\:044f\:044f \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:044c:"ToString@#1,16,FontFamily->"Cambria"],#2},Spacings->1]&,{meanVelocityZones,plots}]],
Style["\:041f\:0430\:043d\:0435\:043b\:044c \:0443\:043f\:0440\:0430\:0432\:043b\:0435\:043d\:0438\:044f:", Bold, FontSize->24],Delimiter,

{{carsCount,30,"\:041a\:043e\:043b-\:0432\:043e \:043c\:0430\:0448\:0438\:043d"},30},
{{iterationLimit,40,"\:041a\:043e\:043b-\:0432\:043e \:0438\:0442\:0435\:0440\:0430\:0446\:0438\:0439"},40},
{{maxVelocity,5,"\:041c\:0430\:043a\:0441\:0438\:043c\:0430\:043b\:044c\:043d\:0430\:044f \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:044c"},5},
{{pBreak,1/5,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c \:0441\:043b\:0443\:0447\:0430\:0439\:043d\:043e\:0433\:043e \:0442\:043e\:0440\:043c\:043e\:0436\:0435\:043d\:0438\:044f"},0.1,1,AppearanceElements->All},
{{W,0.8,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c W"},0.1,1,AppearanceElements->All},
{{coefficentW,3,"\:041a\:043e\:044d\:0444\:0444\:0438\:0446\:0438\:0435\:043d\:0442 \:0434\:043b\:044f \:0432\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:0438 W"},3},
{{coefficentOneTime,0.4,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c \:0441\:0433\:0435\:043d\:0435\:0440\:0438\:0440\:043e\:0432\:0430\:0442\:044c\:0441\:044f \:0432 \:043e\:0434\:043d\:043e \:0432\:0440\:0435\:043c\:044f"},0.1,1,AppearanceElements->All},
Delimiter,
{{zoneStartPos,5,"\:0414\:043b\:0438\:043d\:0430 \:0437\:043e\:043d\:044b \:0441\:0443\:0436\:0435\:043d\:0438\:044f"},5},
{{obstacleStart,15,"\:041d\:0430\:0447\:0430\:043b\:044c\:043d\:0430\:044f \:043f\:043e\:0437\:0438\:0446\:0438\:044f \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f"},1,24,1,AppearanceElements->All},
{{obstacleFinish,30,"\:041a\:043e\:043d\:0435\:0447\:043d\:0430\:044f \:043f\:043e\:0437\:0438\:0446\:0438\:044f \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f"},25,60,1,AppearanceElements->All},

{{but,plots,""},Button[Style["\:041f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:0438 \:0441 \:043d\:043e\:0432\:044b\:043c\:0438 \:0434\:0430\:043d\:043d\:044b\:043c\:0438",16,FontFamily->"Cambria"],
cars=carInitialization[carsCount,maxVelocity,2,coefficentOneTime,W];
obstacleCars=addObstacle[cars,{obstacleStart,obstacleFinish}];
dataZones=dataAnalysis[obstacleCars,maxVelocity,pBreak,iterationLimit,coefficentW,W,#]&/@zoneNamesList;
plots=MapThread[densityZonesPlot,{dataZones,labelNamesList,plotColorsList}];
meanVelocityZones=Last/@dataZones]&},

ControlPlacement->Right,AppearanceElements->None,Paneled->False,Alignment->Center,LabelStyle->Directive[FontSize->16,FontFamily->"Cambria"],ContinuousAction->False
]
]


(*\:0421\:043e\:043e\:0442\:043d\:043e\:0448\:0435\:043d\:0438\:0435 \:043f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:0438 \:043c\:0430\:0448\:0438\:043d \:043d\:0430 \:043b\:0435\:0432\:043e\:0439 \:0438 \:043f\:0440\:0430\:0432\:043e\:0439 \:043f\:043e\:043b\:043e\:0441\:0435 \:0442\:0440\:0430\:0441\:0441\:044b*)


Clear[lanesAnalysis]
lanesAnalysis[cars_Association,maxVelocity_Integer?Positive,pBreak_Rational?Positive|pBreak_Real?Positive,iterationLimit_Integer?Positive,coefficentW_Integer?Positive,maxW_Real?Positive]:=Module[
{
obstaclePos,carsList,leftLaneCars,rightLaneCars,lanesList,
iterCarsList=modelInterations[cars,maxVelocity,iterationLimit,pBreak,coefficentW,maxW]
},
obstaclePos=iterCarsList[[1]][0]["Position"];

carsList=Table[Select[iterCars,1<=#["Position"]<obstaclePos[[1]]&],{iterCars,iterCarsList}];
lanesList=Values@Map[#["Lane"]&,carsList,{2}];
leftLaneCars=Count[#,0]&/@lanesList;
rightLaneCars=Count[#,1]&/@lanesList;
{leftLaneCars,rightLaneCars}
]


Clear[lanesAnalysisPlot]
lanesAnalysisPlot[lanePoints_List]:=Framed@Labeled[ListLinePlot[lanePoints,Filling->Axis,PlotLabel->Style["\:041f\:043b\:043e\:0442\:043d\:043e\:0441\:0442\:044c \:043c\:0430\:0448\:0438\:043d \:043d\:0430 \:043b\:0435\:0432\:043e\:0439 \:0438 \:043f\:0440\:0430\:0432\:043e\:0439 \:043f\:043e\:043b\:043e\:0441\:0435 \:0434\:043e \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f",16,Bold,FontFamily->"Cambria Math",Black],PlotLegends->{"\:041b\:0435\:0432\:0430\:044f \:043f\:043e\:043b\:043e\:0441\:0430","\:041f\:0440\:0430\:0432\:0430\:044f \:043f\:043e\:043b\:043e\:0441\:0430"},PlotStyle->{Blue,Red,Thick},Mesh->All,ImageSize->Large,PlotRange->All],{"\:0412\:0440\:0435\:043c\:044f","\:041a\:043e\:043b-\:0432\:043e \:043c\:0430\:0448\:0438\:043d"},{Bottom,Left},RotateLabel->True]


Clear[lanesInteractiveAnalysis]
lanesInteractiveAnalysis:=DynamicModule[
{
cars=carInitialization[30,5,2,0.4,0.8],
plot,obstacleCars,lanePoints
},
obstacleCars=addObstacle[cars,{15,30}];
lanePoints=lanesAnalysis[obstacleCars,5,1/5,40,3,0.8];
plot=lanesAnalysisPlot[lanePoints];

Manipulate[

plot,
Style["\:041f\:0430\:043d\:0435\:043b\:044c \:0443\:043f\:0440\:0430\:0432\:043b\:0435\:043d\:0438\:044f:", Bold, FontSize->24],Delimiter,

{{carsCount,30,"\:041a\:043e\:043b-\:0432\:043e \:043c\:0430\:0448\:0438\:043d"},30},
{{iterationLimit,40,"\:041a\:043e\:043b-\:0432\:043e \:0438\:0442\:0435\:0440\:0430\:0446\:0438\:0439"},40},
{{maxVelocity,5,"\:041c\:0430\:043a\:0441\:0438\:043c\:0430\:043b\:044c\:043d\:0430\:044f \:0441\:043a\:043e\:0440\:043e\:0441\:0442\:044c"},5},
{{pBreak,1/5,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c \:0441\:043b\:0443\:0447\:0430\:0439\:043d\:043e\:0433\:043e \:0442\:043e\:0440\:043c\:043e\:0436\:0435\:043d\:0438\:044f"},0.1,1,AppearanceElements->All},
{{W,0.8,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c W"},0.1,1,AppearanceElements->All},
{{coefficentW,3,"\:041a\:043e\:044d\:0444\:0444\:0438\:0446\:0438\:0435\:043d\:0442 \:0434\:043b\:044f \:0432\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:0438 W"},3},
{{coefficentOneTime,0.4,"\:0412\:0435\:0440\:043e\:044f\:0442\:043d\:043e\:0441\:0442\:044c \:0441\:0433\:0435\:043d\:0435\:0440\:0438\:0440\:043e\:0432\:0430\:0442\:044c\:0441\:044f \:0432 \:043e\:0434\:043d\:043e \:0432\:0440\:0435\:043c\:044f"},0.1,1,AppearanceElements->All},
Delimiter,
{{obstacleStart,15,"\:041d\:0430\:0447\:0430\:043b\:044c\:043d\:0430\:044f \:043f\:043e\:0437\:0438\:0446\:0438\:044f \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f"},1,24,1,AppearanceElements->All},
{{obstacleFinish,30,"\:041a\:043e\:043d\:0435\:0447\:043d\:0430\:044f \:043f\:043e\:0437\:0438\:0446\:0438\:044f \:043f\:0440\:0435\:043f\:044f\:0442\:0441\:0442\:0432\:0438\:044f"},25,60,1,AppearanceElements->All},

{{but,plot,""},Button[Style["\:0413\:0440\:0430\:0444\:0438\:043a \:0441 \:043d\:043e\:0432\:044b\:043c\:0438 \:0434\:0430\:043d\:043d\:044b\:043c\:0438",16,FontFamily->"Cambria"],
cars=carInitialization[carsCount,maxVelocity,2,coefficentOneTime,W];
obstacleCars=addObstacle[cars,{obstacleStart,obstacleFinish}];
lanePoints=lanesAnalysis[obstacleCars,maxVelocity,pBreak,iterationLimit,coefficentW,W];
plot=lanesAnalysisPlot[lanePoints]]&},

ControlPlacement->Right,AppearanceElements->None,Paneled->False,Alignment->Center,LabelStyle->Directive[FontSize->16,FontFamily->"Cambria"],ContinuousAction->False
]
]


End[]


EndPackage[]
