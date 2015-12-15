type = {'ref','new'};
nFrames=1000;
diffs=nan(nFrames,88);
for iFrame=1:nFrames
    U = cell(2,1);
    for iRun=1:2
        fileInput=sprintf('/home/mark.dawson/Data/TestSuite/MeshReadTest/HDAT/Sphere/%s/dat/sphereP2_p2',type{iRun});
        U{iRun} = readSolution(fileInput, iFrame);
    end
    nElements=size(U{1},2);
    for iElem=1:nElements
        diffs(iFrame,iElem) = max(max(abs(U{1}(iElem).val-U{2}(iElem).val)));
    end
end

% diffs = max(diffs');
