function runTest(testDir)
    fprintf('Running: %s\n',testDir);
    testConf=sprintf('%s/test.conf',testDir);
    
    fid = fopen(testConf,'r');
    str = fscanf(fid,'%s');
    eval([str,';']);
    fclose(fid);
    
    nsd = getNsd(fullfile(testConf,'k'));
    binFile = sprintf('~/Source/maxwell-nefem/bin/debug/maxwell%dD-parallel',nsd);
    
    % maxwell clean
    scriptsDir='~/Source/maxwell-nefem/scripts';
    sysCmd=sprintf('cd %s;%s/maxwell_clean;',testDir,scriptsDir);
    [status,cmdout] = system(sysCmd);
    if(status~=1)
        error('could not clean directory');
    end
    
    fprintf('%s\n  nP=%d\n',testDir,nProcs);
    
    % run test
    mpiexecPath='/usr/local/bin/mpiexec';
    sysCmd=sprintf('cd %s;%s -n %d %s',testDir,mpiexecPath,nProcs,binFile);
    [status,cmdout] = system(sysCmd);
    if(status~=0)
        error('error running mpiexec');
    end
    fprintf('\n');
end