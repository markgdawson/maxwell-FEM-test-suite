function meshGUI
close all
figure
hold on
axes('xlimmode','manual','ylimmode','manual') %<- important

h = [];
vertexHandles = [];

while(1==1)
    ret = waitforbuttonpress;
    if(ret==1)
        key = get(gcf,'currentKey');
    else
        key = 'N';
    end
    
    switch key
        case 'a'
            [x,y] = ginput(1);
            h(end+1) = line(x,y,'marker','s','markersize',10,'hittest','on','buttondownfcn',@clickmarker);
        case 's'
            Xposns = getAllPosns(h);
            
            nNodes = size(Xposns,1);
            
            nNodesShape = 3;
            
            nodeListShape = nan(nNodesShape,1);
            
            for iNodeShape = 1:nNodesShape
                [x(iNodeShape),y(iNodeShape)] = ginput(1);
                
%                 for iNode = 1:nNodes
%                     dist(iNode) = sqrt((x - Xposns(iNode,1))^2 + (y - Xposns(iNode,2))^2);
%                 end
                
%                 [~,nodeListShape(iNodeShape)] = min(dist);
                
%                 if(iNodeShape>1)
%                     vertexHandles(end+1) = line(Xposns(nodeListShape(iNodeShape+[0,-1]),1),Xposns(nodeListShape(iNodeShape+[0,-1]),2));
%                 end
                if(iNodeShape>1)
                    vertexHandles(end+1) = line(x(iNodeShape+[0,-1]),y(iNodeShape+[0,-1]),'marker','s','markersize',10,'hittest','on','buttondownfcn',@clickmarker);
                end
            end
            
            
    end
end

function posns = getAllPosns(h)
nH = length(h);
posns = nan(nH,2);
for iH=1:nH
    posns(iH,1) = get(h(iH),'XData');
    posns(iH,2) = get(h(iH),'YData');
end

function clickmarker(src,ev)
set(ancestor(src,'figure'),'windowbuttonmotionfcn',{@dragmarker,src})
set(ancestor(src,'figure'),'windowbuttonupfcn',@stopdragging)

function dragmarker(fig,ev,src)
coords=get(gca,'currentpoint');
x=coords(1,1,1);
y=coords(1,2,1);
set(src,'xdata',x,'ydata',y);

function stopdragging(fig,ev)
set(fig,'windowbuttonmotionfcn','')
set(fig,'windowbuttonupfcn','')