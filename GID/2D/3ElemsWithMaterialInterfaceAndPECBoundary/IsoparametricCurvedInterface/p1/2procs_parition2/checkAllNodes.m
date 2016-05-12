clear all
close all
proc1=readHighOrderMesh('dat/3ElemCurvedMaterialInterface_p1_TM.node1',2);
proc2=readHighOrderMesh('dat/3ElemCurvedMaterialInterface_p1_TM.node2',2);
Xall = [proc1.X;proc2.X];
for iX=1:size(Xall,1)
    Xp = Xall(iX,:);
    plot(Xp(1)*[1,1],Xp(2)*[1,1],'.-','markerSize',10)
%     plot(Xall(iX:iX+1,1),Xall(iX:iX+1,2),'k-')
    hold all
end