testList = importdata('testList');
nTest = length(testList);

for iTest=1:nTest
    testDir=regexprep(testList{iTest},'/test.conf$','');
    fileInputTest = getInputFile('path',testDir);
    
    strs = strsplit(fileInputTest,'/');
    strs{end-2} = 'bench';
    fileInputBench = fullfile(strs{:});
%     runTest(testDir);
    [UDiff,UDiffMax] = readSolutionDiff(fileInputBench, fileInputTest, [10]);
    fprintf('%s: ',testDir);
    if(UDiffMax>0)
        fprintf('FAIL\n');
    else
        fprintf('PASS\n');
    end
end